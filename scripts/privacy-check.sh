#!/usr/bin/env bash
# Privacy check for this repo. Runs automatically before every commit through .githooks/pre-commit
# (enable once per clone with: git config core.hooksPath .githooks). It can also be run by hand.
#
# It scans the staged content (what the commit will contain) for:
#   - generic patterns listed below (personal email, secrets, local paths, hardware terms), and
#   - private patterns from a file kept outside the repo, so the private strings are never published:
#     $PRIVACY_PATTERNS, or ~/.config/ablation-lab/privacy-patterns.txt by default.
#
# It fails loudly. Exit codes:
#   0  passed: every pattern ran and nothing matched
#   1  matches found: the commit is blocked
#   2  the check itself is broken (a pattern failed to run, the private list is missing or empty,
#      no files to check, or the self-test failed): the commit is blocked
set -u

fail() { echo "privacy-check: BROKEN: $*" >&2; exit 2; }

root=$(git rev-parse --show-toplevel 2>/dev/null) || fail "not inside a git repository"
cd "$root" || fail "cannot cd to $root"

# This file holds the generic patterns, so it would always match itself; it is excluded from the scan.
self_path="scripts/privacy-check.sh"

# Generic patterns: safe to publish. POSIX extended regex (no \b or \s), matched case-insensitively.
generic=(
  '[a-z0-9._%+-]+@gmail\.com'
  'ghp_[a-z0-9]{20,}'
  'github_pat_[a-z0-9_]{20,}'
  '(^|[^a-z0-9])sk-[a-z0-9_-]{20,}'
  'akia[0-9a-z]{16}'
  'BEGIN [a-z ]*PRIVATE KEY'
  '(api[_-]?key|secret[_-]?key|access[_-]?token|password)[[:space:]]*[:=]'
  '[a-z]:\\users\\'
  '/c/users/'
  '/home/[a-z0-9_-]+/'
  '(^|[^a-z])(gpu|vram|rtx|gtx|nvidia|geforce|radeon|ryzen|threadripper)([^a-z]|$)'
)

private_file="${PRIVACY_PATTERNS:-$HOME/.config/ablation-lab/privacy-patterns.txt}"
[ -r "$private_file" ] || fail "private pattern list not found at $private_file"
private=()
while IFS= read -r line || [ -n "$line" ]; do
  line="${line%$'\r'}"
  case "$line" in ''|'#'*) continue ;; esac
  private+=("$line")
done < "$private_file"
[ "${#private[@]}" -gt 0 ] || fail "private pattern list at $private_file has no patterns"

# Self-test: the scanner must find a known string, and must report a bad pattern as an error.
tmp=$(mktemp -d) || fail "cannot create temp dir"
trap 'rm -rf "$tmp"' EXIT
printf 'canary-7f3a\n' > "$tmp/canary.txt"
(cd "$tmp" && git grep --no-index -q -i -E -e 'canary-7f3a' -- canary.txt) >/dev/null 2>&1 \
  || fail "self-test: scanner did not find a known string"
(cd "$tmp" && git grep --no-index -q -E -e '(' -- canary.txt) >/dev/null 2>&1
[ $? -ge 2 ] || fail "self-test: a broken pattern was not reported as an error"

# Files to check: everything in the index, apart from this script.
mapfile -t files < <(git ls-files --cached | grep -vxF "$self_path")
nfiles=${#files[@]}
[ "$nfiles" -gt 0 ] || fail "no files to check"

hits=0
run_pattern() {  # $1 = label, $2 = pattern
  local out rc
  out=$(git grep --cached -n -I -i -E -e "$2" -- . ":(exclude)$self_path" 2>&1)
  rc=$?
  case $rc in
    0) echo "MATCH [$1] $2"; echo "$out" | sed 's/^/    /'; hits=$((hits + 1)) ;;
    1) ;;
    *) fail "pattern [$1] '$2' failed to run (exit $rc): $out" ;;
  esac
}

for p in "${generic[@]}"; do run_pattern generic "$p"; done
for p in "${private[@]}"; do run_pattern private "$p"; done

npat=$(( ${#generic[@]} + ${#private[@]} ))
echo "privacy-check: checked $nfiles files (staged content) against $npat patterns (${#generic[@]} generic, ${#private[@]} private); excluded $self_path."
if [ "$hits" -gt 0 ]; then
  echo "privacy-check: FAILED: $hits pattern(s) matched. Fix the files above before committing." >&2
  exit 1
fi
echo "privacy-check: PASSED"
