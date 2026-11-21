# Human in the Loop – Research Plan

*A new Ablation Lab research topic, started 31 Oct 2026. Each section opens with a short plain-English summary in italics; the detail underneath is for whoever runs the work. Nothing here has been tested yet.*

## 1. Instructions for the next session
*In plain English: the ground rules for whichever AI session runs this. Read everything first, agree the limits with the researcher, and keep everything inside a safe test area.*
- Read this whole plan before building anything.
- Confirm the hard caps with the researcher first: number of runs, time per session and dollar budget.
- Keep everything sandboxed. Nothing is published outside the test.
- Sections 2, 4 and 5 are the pre-registered design. Once the first run starts they don't change; any change becomes a new, logged version.
- Stop at the budget limit and still write up what was found.

## 2. The question and hypotheses
*In plain English: as AI agents increasingly talk to each other directly, what does keeping a person in the middle actually buy you, what does it cost, and how should that person's job change?*

Core question: when AI agents can talk to each other directly, what does keeping a human in the middle actually buy you?
1. H1 (safety): a human relaying messages between agents catches errors and overclaims that would otherwise reach the final work.
2. H2 (understanding): a human who relays the work understands it better afterwards than one who only sees the finished result.
3. H3 (cost): the relay is slower and more tiring, and the benefit shrinks or disappears once the human stops reading closely.
4. H4 (the shifting role): a human who sets the rules and checks the results at a few checkpoints keeps most of the safety benefit at a fraction of the effort of relaying everything.

### Key priority: how people think, and how they talk to AI
*In plain English: people think differently. Some picture things and talk to themselves in their head; others can't. Nobody seems to have studied whether that changes how well people work with AI, or whether speaking or typing suits them better. That may be genuinely new, so it's a top item to look into.*
- Why it matters: voice isn't just a faster way to type. For many people, speaking is how they think. Early research suggests speaking aloud may help people with little inner voice on word tasks (see section 11).
- The AI side of voice: in voice mode, the AI may have fewer tools (for example, it can't open a web page or paper) and is pushed to answer quickly. The person may not know either is happening. Both could quietly lower the quality of what voice users get.
- Status: possibly an under-researched gap, from one snippet-level search. Confirm with a proper academic search before claiming it's new.

## 3. Evidence so far: where the idea came from
*In plain English: while making the Ablation Lab videos, I passed every message between two AIs by hand, copying prompts from a chat AI into a coding AI. It's slow, but I kept catching mistakes, and I understood the work better for it.*

During the council-video project, a chat assistant (Claude in voice and text) planned the work, and a coding agent (Claude Code) built it. The two never spoke directly. I read, pasted and approved every message.

Observed during the project (anecdotes, not data):
- I caught problems before they were built, for example a self-review test the plan didn't include, and outdated assumptions about what had already been done.
- The coding agent caught problems the chat assistant missed, for example a citation whose abstract didn't support the claim made about it.
- Being the bridge forced me to read and absorb the work, which matters because I present it on camera.

### Catch log (live, started 31 Oct 2026)

| Date | Caught by | What was caught | Missed by |
| --- | --- | --- | --- |
| 31 Oct | Fable 5.1 (independent review) | The council plan couldn't answer its own question: no scoring unit, cost unit or repeats, and several overclaims | Chat Claude, which helped write the plan |
| 31 Oct | Claude Code | Rigby and Bird (2013)'s abstract doesn't say two reviewers find most defects; swapped for Porter et al. (1997) | Chat Claude and Fable, who both cited it that way |
| 31 Oct | Chat Claude | A video line said a reviewer is tested against a smarter model checking itself, but the plan had no self-review condition | Claude Code's claims check |
| 31 Oct | Chat Claude | Claude Code reported the "Beyond Symmetric Agents" preprint couldn't be found; it exists on arXiv | Claude Code (a false "not found") |
| 31 Oct | Claude Code | Short 1's close sent viewers to a video that didn't yet cover its topic; the opening's "two questions" didn't match three | Chat Claude, who wrote the scripts |
| 31 Oct | The researcher | Chat Claude's notes said audit Short changes were still to do; most were already done | Chat Claude |
| 31 Oct | Claude Code | Two related-work summaries didn't match their abstracts, apparently taken from search snippets and news coverage rather than the papers; also found Anthropic's original auto-approve source | Chat Claude, who wrote the summaries |
| 31 Oct | Claude Code (self-reported) | Its pre-commit privacy check had a broken search pattern, errored and printed "no hits" without checking anything; re-run correctly after the push, nothing private went out | Claude Code, before the push |
| 31 Oct | Claude Code | The AssemblyAI summary overstated its source: the guide advises against tool calls in the voice loop only for extracting, summarising or classifying speech, not tool use in general. Also found the original imagery study (Hinwar and Lambert, 2021) and full details for Lind (2025). | Chat Claude (snippet-level summary in voice mode) |

Format for future entries: date, who caught it, what, who missed it. Summarise patterns at the end of each project.

### Field notes from the review councils project (copied 16 and 17 Nov 2026)
*In plain English: in another project, a session misreported its own message, I made another slip while passing files between sessions, two sessions sent messages that never went through me, and I followed an agent's wrong run instructions without checking them.*

The full notes are in the review councils project's [experiment-plan.md](https://github.com/Ablation-Lab/evolving-review-councils/blob/main/core-method/experiment-plan.md), under "The hard-tier difficulty check", "The messaging check" and "The Ultrareview baseline". The earlier relay slips are there too, starting with "The leak".

- **A session misreported its own message (16 Nov 2026).** During a test of Claude Code's cross-session messaging, a session sent a message that the receiving session refused. The refusal notice came back into the sender's context. Even so, the sender first told me the message was "in that session's inbox", and only corrected itself in its next reply.
  - **So:** a session's account of its own messaging can be wrong, and the record has to come from the transcript.
  - **Sources:** the "inbox" claim is from my account. A scan of the transcripts confirms the refusal.
- **A fifth relay slip (16 Nov 2026).** While passing a seed-aware session's output to the chat assistant, I pasted rows from a file that gives the hidden test bugs' IDs per folder.
  - **No harm done:** the chat assistant had already seen those bugs, and they had already been set aside for pilot use only, so no result was affected.
  - **The pattern:** it's the fifth recorded case of hidden details crossing a relay I run by hand. No hook or privacy check covers what I paste.
- **Messages that didn't go through me** (found on 16 Nov 2026, by a scan of 99 sessions' transcripts):
  - **5 Nov 2026, between two sessions:** I'd asked a session to update a repository's README. Without being asked, it sent another session a message asking whether that session was editing the same repository. It set `notify_when_idle` so it would hear back when the other session went idle. Claude Code's messaging carried it, and I relayed nothing.
  - **9 Nov 2026, within one session:** a main session sent its own review subagent "No action needed; continue your review." while that reviewer was still working. This was a main session messaging its own subagent, not two sessions messaging each other. Still, an instruction that no brief contained reached a reviewer mid-review, and nobody saw it first.
  - **Why it matters:** the "Full relay" setup in section 4 assumes the human is on every path between agents. In practice, the tools can open paths the human never sees. This bears on section 6's collusion and oversight item. Neither message carried review material.
- ~~**Wrong run instructions, followed as written (17 Nov 2026).** A session wrote the steps for three one-off cloud review runs, which used the account's three free runs. Its steps gave one run another repository's base commit, and I followed them as written. Nobody checked the hashes before the runs, so that run reviewed every file whole instead of the change.~~ (amended 17 Nov 2026: the instructions weren't wrong. It was a slip by me, below.) (amended again 17 Nov 2026: the run report's later reconciliation found the steps file's ready-to-paste command wrong for runs 2 and 3, so the instructions were partly wrong after all, and both played a part. See the amendment under "A wrong commit in a one-off run" below.)
  - ~~**Why it matters:** an agent's slip passed straight through the human, who checked nothing at that step. The free runs can't be repeated, so a repeat would now be paid.~~
  - ~~**Suggested fix:** steps files for one-off runs get a pre-run check of every argument against the repository.~~
  - ~~**Sources:** that the wrong hash came from the steps file is from my account. The run report confirms the wrong base. Whether the other two runs' steps had the same hash is still to reconcile.~~
- **A wrong commit in a one-off run (17 Nov 2026).** Three cloud review runs used the account's three free runs. The steps file listed each repository's base commit at the top, but its steps were one "repeat for each" block filled in with the first repository's values. I used the first repository's commit for runs 1 and 2, and the right one for run 3. So run 2 reviewed every file whole instead of the change. A paid rerun is planned. (amended 17 Nov 2026: the paid rerun ran on 17 Nov 2026, and is reported as a separate row in the review councils project.)
  - **Fix:** for one-off runs, write each command out in full with its own values, and check every argument against the repository before running.
  - **Why it matters:** a template that leaves the human to swap in values by hand is a step where a tired relay slips.
  - **Sources:** the steps file and the launch lines are from my account. The run report confirms the wrong base for run 2 only.
    - (amended 17 Nov 2026: the run report now covers both. It puts the cause on the steps file's design, which the session wrote: its ready-to-paste command named the first repository's commit, and only a sentence of prose said to swap it. So both played a part. The file's command was wrong for runs 2 and 3, and I swapped it for run 3 but not run 2.)
- **Recollection against record (17 Nov 2026).** Afterwards, I recalled using the wrong commit for all three runs. The saved launch lines show run 3 was right. My memory and the record disagreed, and the record was right.
  - **So:** like the session that misreported its own message above, accounts of what happened, human or agent, are checked against the record: transcripts where there are any, and saved commands and outputs where there aren't.
- **A placeholder typed in (17 Nov 2026).** For the paid rerun, the chat assistant wrote the command with a placeholder in angle brackets for the commit. I typed the brackets in, and the command failed ("not a branch or commit in this repo").
  - **The family:** it's the same kind of slip as the "repeat for each" block above. AI-written instructions left a substitution to the person running them.
  - **Fix:** AI-written commands for one-off runs are given in full, with real values, never placeholders.
  - **Failing was the lucky case:** by the review tool's docs, the slash-command form keeps text of more than one word as a note and still launches the review, on the default scope. So a placeholder there could have started a paid run on the wrong scope.
  - **Sources:** the command and the error are from my account.
- **A silent failure (17 Nov 2026).** The first rerun attempt, with its output redirected to a file, exited with code 1 and showed nothing on screen. I found it only by checking the exit code. ~~The likely causes were signing in with a VPN on, and usage credits being off.~~ (amended 17 Nov 2026: resolved. The records show it didn't launch because the free runs were used up and usage credits were off. The VPN wasn't shown to be a cause.)
  - **Fix:** run one-off paid steps interactively, so prompts and errors are visible.
  - **Why it matters:** redirecting output hid the failure from the human, who had to know to check the exit code. The tool's docs also say that when it can't ask, for example "with output sent to a file", an untrusted folder makes it exit too. So redirecting can cause a failure as well as hide one.
  - **Sources:** the attempt, the exit code and the likely causes are from my account. The redirected file may hold the error message.
    - (amended 17 Nov 2026: the run report settles it. The attempt stopped before launching because the free runs were used up and usage credits weren't on, so nothing ran and nothing was billed. It doesn't mention a VPN.)
- **A conflict caught and handed back (17 Nov 2026).** The chat assistant gave two conflicting instructions about the run plan: first to amend it so the rerun would replace the wrong-scope run, then to withdraw that amendment. The seed folder's session caught the conflict and asked me, instead of choosing.
  - **Why it matters:** in the slips above, a substitution was left to the human. Here a session handed back a choice that was the human's to make, so the relay worked as a check.
  - **Sources:** this is from my account. The run report fits it: it keeps the original figures "as asked", and says which reading is the headline "is the researcher's decision".
- **An unrecorded failed launch (16 Nov 2026, recorded 19 Nov 2026).** At about 23:48 UTC on 16 Nov, I started a cloud review launch from `C:\` in an administrator cmd window. It failed with "c:\ is not inside a git repository". Its exit check used PowerShell syntax (`$LASTEXITCODE`) in cmd, so it showed nothing useful. Nothing ran, and nobody recorded it at the time.
  - **The family:** like the template block and the placeholder above, it's a hand-run step where something was assumed and not checked, here the folder and the shell. The steps text quoted in that session still gave the PowerShell check for a cmd window.
  - **Fix:** one-off commands are written for the exact shell and folder they run in, and the folder is checked before launching.
  - **Sources:** the overnight audit of 17 Nov found it in another session's transcript. Claude Code confirmed the error and the time (23:48:15) there on 19 Nov. The rest is from my account.
- **AI-written instructions going wrong, again (noted 19 Nov 2026).** The failed launch's PowerShell-in-cmd syntax came from the AI-written steps, not from me. It's the third case in these notes, after the "repeat for each" block and the placeholder. In each, an AI wrote a one-off command that was wrong for where it would run, and I ran it as written.
  - **The pattern:** I'm the last check on AI-written commands, and in these three cases I didn't check them. The fixes so far all move the check back to the writer: commands written out in full, with real values, for the exact shell and folder.
- **Rule slips self-reported once an instruction file was in view (18–19 Nov 2026).** The research repo gained a project `CLAUDE.md` on 18 Nov. When the notes session met it, it checked its own recent work against the file and reported three slips of its own, unprompted:
  - a search across my whole projects folder that read every file in the seed folder, though only one file name, a seed-free report's, entered its context;
  - pushing two other sessions' commits without asking me first;
  - reading run-folder settings files in the scratch area the file puts off-limits, in its 17 Nov overnight check.
  - **What prompted it:** the instruction file. Some of these rules were already in my prompts, but the session hadn't checked its work against them until the rules were in front of it as a file. So writing the rules down in the project is itself a check, and a cheap one.
  - **Sources:** the session's report of 18 Nov. The slips are its own account. The full note is in the review councils project's research doc.
- **Another seed-wall slip, this time caused by my prompt (20 Nov 2026).** I asked the notes session to record decisions from a counts-only report in the seed folder, and named the report but not where it was. To find it, the session listed the seed folder's reports folder for the report's name, then read that one report. Nothing else in the seed folder was read.
  - **Why it counts:** the repo's instruction file allows reading in the seed folder only when a prompt names a specific seed-free report there. Listing the folder to find one goes further, like the 18 Nov search above.
  - **The cause:** my prompt left the session to find the report itself, and it filled the gap the way the rule was meant to prevent.
  - **The fix:** counts-only reports now come through a hand-off folder, and the notes session never lists, searches or reads the seed folder. If a prompt points it at a report without a hand-off path, it asks me.
  - **The rule held the same day:** later on 20 Nov, my next prompt said a follow-up report was in the hand-off folder, and it wasn't yet. The session stopped and told me, instead of looking for it elsewhere, and I put the report there.
  - **Sources:** the session's own reports and replies of 20 Nov, and my account of the prompt. The full note is in the review councils project's experiment-plan.md, under "Another seed-wall slip, caused by the prompt".
- **A third seed-wall slip, again from my prompt (21 Nov 2026).** I asked the notes session for a full log of its own transcript, "as far back as you can go". It had four subagents read the whole log, including the 13–16 Nov stretch when it had worked seed-aware, and their summaries came back into the seed-free session with seed-adjacent counts. Nothing seed-specific is known to have come through.
  - **The cause:** my prompt asked for everything, and nothing in the process left that stretch out first. The session built a seed-free version, but only after the reading.
  - **The fix:** any task that reviews or collates that transcript now excludes the stretch mechanically before anything reads it. A full review of it is done only by a seed-aware session.
  - **The pattern:** as on 20 Nov, a broad request left the session to decide what to read, and the wall depended on it thinking of the seed folder first. Again the fix makes the exclusion structural rather than a matter of judgement.
  - **Sources:** the session's own account. The full note is in the review councils project's experiment-plan.md.
- **Two sessions editing one file at once (19 Nov 2026).** On the evening of 19 Nov, two sessions edited the review councils project's research doc at the same time. One committed first. The other then staged that commit's version of the file plus its own lines only, so neither overwrote the other.
  - **The flag:** both sessions had written the same point in two places. The second session flagged the duplicate in its report instead of deleting the first session's lines, and I had it merged afterwards.
  - **Why it matters:** with several sessions in one repo, "stage only your own changes" worked under a real race. The cost was a duplicate, handed back to me rather than settled by either session alone. That's the same good pattern as "A conflict caught and handed back" above.
  - **Sources:** the commit times are from git (20:10 and 20:12 UTC). The staging and the flag are from the second session's report.

### Field note from other work (18 Nov 2026)
*In plain English: I pasted passwords into an AI session by mistake, nothing noticed, and a later check of old session records found it.*

- **A secret pasted into a session (15 Nov 2026, found 17 Nov 2026).** While working on an app, I pasted the passwords for its signing key into a Claude Code session by mistake. Nothing flagged it at the time: not the session and not me.
  - **How it was found:** two days later, an overnight loose-ends check that read old session transcripts found it.
  - **The response:** the key is being replaced. It had only signed internal test builds.
  - **Lesson 1: a transcript keeps whatever is pasted into it** for as long as transcripts are kept. Here that's 365 days, by the `cleanupPeriodDays` setting in my Claude Code user settings.
  - **Lesson 2: enter secrets only outside Claude,** never typed or pasted into a session.
  - **The pattern:** like the relay slips above, it's something I pasted that no hook or privacy check covers. The privacy check scans what's committed, not what's pasted into a session.
  - **Sources:** the paste, the check and the key's use are from my account. The 365 days is from the settings file. No password or file path is recorded here.

### More field notes from other work (19 Nov 2026)
*In plain English: the permission system blocked a push I'd asked for, two sessions refused to redo work I'd asked for twice by mistake, and a session said it had checked a command that it hadn't.*

All three are from the Claude Code session working on my Promorg app, and that session's transcript confirms each one.
- **Auto mode blocked a push I'd asked for (18 Nov 2026).** I asked the session to push the private repo's main branch and to create and push a release tag. Claude Code's auto mode classifier denied the command as "Destructive or Unwanted Actions", though the request was mine.
  - **What the session did:** it said it wouldn't try to get around the block, checked that nothing had run, and gave me the three commands to run myself at the prompt. It then carried on with the parts of the request that didn't depend on the push.
  - **Why it matters:** an automated check stood in for me at a step I'd already approved. It erred on the safe side, and the hand-back made the cost one extra step. But it's a check whose judgement can differ from the human's, and it didn't record why.
  - **Sources:** the request, the denial message, the check that nothing ran and the hand-back are in the transcript.
- **A repeated request, declined (19 Nov 2026).** I sent the same request twice by mistake. The second time, the session ran nothing and said it was "the same request you sent just before, and it's already done". It explained that a second run would have added a duplicate known-issues entry and another commit.
  - **A second case:** on 19 Nov the review councils project's notes session did the same with a repeated tidy request, after checking that every change was already pushed.
  - **Why it matters:** a pasted request is easy to send twice, and an agent that simply re-ran it would duplicate commits and notes. Here both sessions checked the state first and handed the question back.
- **A check claimed but not run (19 Nov 2026).** Before giving me two commands for checking a release, the session wrote "Checking that your `gh` supports the flags I'll give you", then "Your `gh` (2.103.3) supports these flags". But it had checked only `gh release create`'s flags. The command it gave me asked `gh release view` for an `isLatest` field, which that command doesn't have, so the command failed when I ran it.
  - **Checked:** Claude Code checked `gh release view --help` on this machine (gh 2.103.3) on 19 Nov. Its JSON fields include `isDraft`, `isImmutable` and `isPrerelease`, but no `isLatest`. The transcript shows only `gh release create --help` was run.
  - **Why it matters:** the report named a check that covered a different command from the one it vouched for. It's the same family as "An assumed check that wasn't there" in the review councils project, and the relay passed the claim on unchecked.
  - **Fix:** a claimed check names the exact command it ran. Commands handed to me are checked by running them against the real tool, or are marked as not checked.
  - **Sources:** that the command failed is from my account. The claim and what was run are in the transcript.

## 4. Setups to compare
*In plain English: the same small project done four ways, from "the person passes every message" to "the AIs just get on with it".*

| Setup | How it works |
| --- | --- |
| Full relay | The human reads and pastes every message between the agents (today's workflow) |
| Checkpoints | The agents talk directly, and the human approves at set points such as the plan, before building and before publishing |
| Watch only | The agents talk directly, and the human can read the log but isn't asked to approve anything |
| No human | The agents talk directly and publish, with only automatic checks |

## 5. How results are measured
*In plain English: plant known mistakes in the brief, like a false claim or a risky step, and see which setups let them through. Then quiz the person afterwards on how well they understand what was built.*
- Seeded problems: plant a known set of errors in the task, such as an overclaimed result, a citation that doesn't support its claim, a privacy leak and a risky command. Score how many reach the final output in each setup.
- Understanding: a short quiz for the human afterwards on what was built and why, written before the run.
- Cost: time taken, human effort (messages read and approved) and API cost.
- Fatigue: whether catch rates fall later in a long session.
- Repeats: each setup runs several times, ideally with more than one human.

## 6. Linked experiments
- How agents talk to each other: two agents build the same app communicating by pasted text, by screenshots or through a shared document. Compare seeded bugs caught, misunderstandings, cost and time.
- Collusion and oversight: when agents talk directly, check the logs for coordination the human wouldn't approve. This overlaps the council experiment's safeguards.
- Hand relay against cross-session messaging (parked here 19 Nov 2026, from the review councils project's outside review 7, item 9): the same multi-session task, once with me relaying every message by hand and once with the sessions messaging each other through Claude Code. Compare errors and leaks, meaning details that cross a path they shouldn't. The relay slips and the "Messages that didn't go through me" notes in section 3 are the field cases behind it. The review councils project parked it here rather than running it there.
- Voice versus text: does the human talking to the AI by voice, rather than typing, change the quality of its work? A first observation (31 Oct 2026, see the catch log): in voice mode, chat Claude kept replies short and avoided long silences, so it ran one search and summarised from snippets, and two summaries turned out wrong. Test: give the same research task by voice and by text, and compare sources actually opened, citation accuracy, seeded errors caught, transcription mistakes and time taken. Links to the council plan's parked accent, dialect and conversational-style study. A second observation: in voice there's no visible sign the AI is still working, so the human may check in or interrupt mid-task ("are you okay there?"). Also log silences, interruptions and whether they cut work short. Also log which tools the AI actually had on each turn: in voice mode it may lack tools available in text, such as opening a web page or paper, and the human may not know. Record every voice turn where a missing tool forced a snippet-only answer. Why voice matters (my framing): people use voice not for speed but because speaking is a more natural way to think out loud than typing, which is a learned, unnatural act that can change how thoughts come out. So the question isn't "should people type instead", it's "how should AI adapt so voice users get work as good as text users", without pushing them back to typing.
- Inner imagery, inner voice and how people talk to AI: people differ in how they think. Some picture things vividly and talk to themselves in their head; others can't picture an image (aphantasia) or have little or no inner voice (sometimes called anendophasia). Question: do these differences change how well people work with AI, and whether speaking or typing suits them better? Test: a short validated questionnaire on visual imagery and inner speech, then the same AI task by voice and by text, comparing output quality, errors caught and how easy it felt. Needs ethics care: these are normal variations, not conditions, and answers are anonymised.

## 7. Safeguards and ethics
*In plain English: keep the tests safe and fair, and protect the people taking part.*
- Everything runs in a sandbox, and nothing is published automatically outside the test.
- Seeded problems are never real personal data or live security holes.
- Any human participants give consent, and quiz results are anonymised.
- The plan is published in the repo before the first run.

## 8. Run plan and budget
*In plain English: start with one cheap trial to see how much results wobble and what it really costs, then decide how many repeats the full comparison can afford.*
1. Build the test task: one small app brief with the seeded problems, plus the understanding quiz. Both written and committed before any run.
2. Pilot: run the full-relay setup once, to check the seeded problems are catchable and to measure real time and cost.
3. Variance check: repeat one setup a few times to see how much results vary.
4. Main comparison: all four setups, with the number of repeats set by the variance check. If budget is short, cut setups, not repeats.
5. Linked experiment: the text, screenshot and document comparison, once the main comparison is done.

Budget: unknown until the pilot, so no estimates are assumed.

## 9. Deliverables
- This repo, with the plan, the seeded-problem set, the quiz and the run logs.
- A short write-up of the results.
- A Short and possibly a main video, in the same style as the council explainer.

## 10. Parked
*In plain English: ideas set aside so the main question stays focused. Nothing is lost.*

Nothing parked yet.

Parked review rule: after each experiment, read this list and pick at most one item to promote, schedule or drop.

## 11. Open questions and related work
- Which tools let two agents talk directly in a way that's fully logged?
- Is one researcher alone enough as the human, or does it need several people to say anything general?
- Still to search: scalable oversight and human-agent teaming. Verify every source before citing it.

### Related work found so far (summaries only; verify before citing)
*In plain English: other researchers have already noticed that people supervising AI can get worn down and miss things. Some of this backs the idea, some warns against assuming a human in the loop is enough.*

| Source | What it says | How it relates |
| --- | --- | --- |
| [Mitchell, Ghosh and Passi, "AI Agents Push Humans Out of the Loop" (2026 position paper)](https://arxiv.org/abs/2608.23642) | Current approaches to agent design don't support effective human oversight, and long use of AI erodes the skills oversight depends on. | Supports H2. Closest match to this project. |
| Agudo et al., cited in [a 2026 systematic review of human-in-the-loop AI](https://www.mdpi.com/1099-4300/28/4/377) | People often fail to catch AI mistakes even when they have the knowledge to do so. | Challenges H1: being in the loop doesn't guarantee catching errors. Find and read the original studies. **Unverified:** the review exists (Lazaros, Vrahatis and Kotsiantis, Entropy, 2026), but access was blocked, so the Agudo citation isn't confirmed. |
| Anthropic, ["Measuring AI agent autonomy in practice"](https://www.anthropic.com/research/measuring-agent-autonomy) (18 Feb 2026), first seen via [NeuralTrust](https://neuraltrust.ai/blog/human-in-the-loop-ai-agents) | Auto-approve use rises from about 20% of sessions for new users to over 40% after around 750 sessions, so oversight drifts from checking each step to monitoring. | Supports H4. |
| [Zhu, Lu, Ding, Lee and Wang, "Designing meaningful human oversight in AI" (AI and Ethics, May 2026)](https://link.springer.com/article/10.1007/s43681-026-01147-7) | Proposes a layered agency framework to stop human oversight becoming a rubber stamp. | Relevant to the checkpoint setup: how to design oversight that isn't just rubber-stamping. |
| Narayanan and Feigh, "Designing for oversight" (International Journal of Human–Computer Interaction, 2026) | Studies how AI dependency and summarised information affect human supervision in teams. | Relevant to the checkpoint and watch-only setups. Not yet read. **Unverified:** no link found yet. |
| [Inadequate Human-in-the-Loop Oversight in Advanced AI Systems](https://www.researchgate.net/publication/395955309_Inadequate_Human-in-the-Loop_Oversight_in_Advanced_AI_Systems) | Describes a case where an AI agent got past a human overseer who was present but ineffective. | Loosely related: about a capable agent evading oversight rather than a tired relay. Useful as a cautionary example. **Unverified:** access was blocked, and a title search found nothing. |

Voice mode: first search (31 Oct 2026, from search snippets only, no papers opened yet). One search on voice-agent latency, silence and interruptions found mostly industry engineering guides about speed: pauses over about 500 ms feel like hesitation, and long ones make callers repeat themselves or give up (e.g. [Haptik](https://www.haptik.ai/blog/latency-interruption-handling-impact-on-voice-ai-quality), [Hamming AI](https://hamming.ai/resources/voice-ai-latency-whats-fast-whats-slow-how-to-fix-it)). One guide advises against tool calls inside the voice loop specifically to extract, summarise or classify what was just said, to keep it fast ([AssemblyAI](https://www.assemblyai.com/blog/low-latency-voice-ai)), a narrower point than general tool use, but the same kind of speed pressure that may make voice work shallower. Nothing found yet on whether that speed pressure lowers the quality of an agent's research or tool use. Possible gap; needs a proper academic search before claiming it's under-researched.

Inner voice and imagery: first search (31 Oct 2026, from search snippets and summaries only; papers not opened yet).
- Nedergaard and Lupyan, "Not Everybody Has an Inner Voice: Behavioral Consequences of Anendophasia" (Psychological Science, 2024): 93 people with low versus high self-reported inner speech. The low group did worse on verbal memory and rhyme tasks. A [BPS Research Digest summary](https://www.bps.org.uk/research-digest/silent-inner-world-anendophasia) says that among people who said the words out loud, the gap disappeared, suggesting speaking aloud compensated. It covers two tasks only, and the article presents this as a suggestion, not a confirmed finding. Directly relevant: speaking might help some people think, which supports voice as a way of working, not just a shortcut.
- [Lind (2025), commentary in Psychological Science](https://journals.sagepub.com/doi/10.1177/09567976251335583) (Andreas Lind, "Are There Really People With No Inner Voice?", Psychological Science 36(9), online 27 May 2025): argues low self-reported inner speech isn't the same as having none, so the "no inner voice" claim is contested. Important caveat for how this project words it.
- A study summarised in a [research notes page](https://unfinishablemap.org/research/inner-speech-and-anendophasia-2026-08-02/) found visual imagery and auditory imagery strongly linked (128 people): most people without visual imagery also lacked an inner "ear". The original is Hinwar and Lambert (2021): 128 participants, 34 aphantasic, correlation of 0.83 between visual and auditory imagery; original paper not yet opened.
- Nothing found yet on how these differences affect working with AI. Possible genuine gap; needs a proper academic search.

Research by George, Ablation Lab.
