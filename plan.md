# Human in the Loop – Research Plan

*A new Ablation Lab research topic, started 31 Oct 2026. Each section opens with a short plain-English summary in italics; the detail underneath is for whoever runs the work. Nothing here has been tested yet.*

## 1. Instructions for the next session
*In plain English: the ground rules for whichever AI session runs this. Read everything first, agree the limits with George, and keep everything inside a safe test area.*
- Read this whole plan before building anything.
- Confirm the hard caps with George first: number of runs, time per session and dollar budget.
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
*In plain English: while making the Ablation Lab videos, George passed every message between two AIs by hand, copying prompts from a chat AI into a coding AI. It's slow, but he kept catching mistakes, and he understood the work better for it.*

During the council-video project, a chat assistant (Claude in voice and text) planned the work, and a coding agent (Claude Code) built it. The two never spoke directly. George read, pasted and approved every message.

Observed during the project (anecdotes, not data):
- George caught problems before they were built, for example a self-review test the plan didn't include, and outdated assumptions about what had already been done.
- The coding agent caught problems the chat assistant missed, for example a citation whose abstract didn't support the claim made about it.
- Being the bridge forced George to read and absorb the work, which matters because he presents it on camera.

### Catch log (live, started 31 Oct 2026)

| Date | Caught by | What was caught | Missed by |
| --- | --- | --- | --- |
| 31 Oct | Fable 5.1 (independent review) | The council plan couldn't answer its own question: no scoring unit, cost unit or repeats, and several overclaims | Chat Claude, which helped write the plan |
| 31 Oct | Claude Code | Rigby and Bird (2013)'s abstract doesn't say two reviewers find most defects; swapped for Porter et al. (1997) | Chat Claude and Fable, who both cited it that way |
| 31 Oct | Chat Claude | A video line said a reviewer is tested against a smarter model checking itself, but the plan had no self-review condition | Claude Code's claims check |
| 31 Oct | Chat Claude | Claude Code reported the "Beyond Symmetric Agents" preprint couldn't be found; it exists on arXiv | Claude Code (a false "not found") |
| 31 Oct | Claude Code | Short 1's close sent viewers to a video that didn't yet cover its topic; the opening's "two questions" didn't match three | Chat Claude, who wrote the scripts |
| 31 Oct | George | Chat Claude's notes said audit Short changes were still to do; most were already done | Chat Claude |
| 31 Oct | Claude Code | Two related-work summaries didn't match their abstracts, apparently taken from search snippets and news coverage rather than the papers; also found Anthropic's original auto-approve source | Chat Claude, who wrote the summaries |
| 31 Oct | Claude Code (self-reported) | Its pre-commit privacy check had a broken search pattern, errored and printed "no hits" without checking anything; re-run correctly after the push, nothing private went out | Claude Code, before the push |

Format for future entries: date, who caught it, what, who missed it. Summarise patterns at the end of each project.

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
- Voice versus text: does the human talking to the AI by voice, rather than typing, change the quality of its work? A first observation (31 Oct 2026, see the catch log): in voice mode, chat Claude kept replies short and avoided long silences, so it ran one search and summarised from snippets, and two summaries turned out wrong. Test: give the same research task by voice and by text, and compare sources actually opened, citation accuracy, seeded errors caught, transcription mistakes and time taken. Links to the council plan's parked accent, dialect and conversational-style study. A second observation: in voice there's no visible sign the AI is still working, so the human may check in or interrupt mid-task ("are you okay there?"). Also log silences, interruptions and whether they cut work short. Also log which tools the AI actually had on each turn: in voice mode it may lack tools available in text, such as opening a web page or paper, and the human may not know. Record every voice turn where a missing tool forced a snippet-only answer. Why voice matters (George's framing): people use voice not for speed but because speaking is a more natural way to think out loud than typing, which is a learned, unnatural act that can change how thoughts come out. So the question isn't "should people type instead", it's "how should AI adapt so voice users get work as good as text users", without pushing them back to typing.
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
- Is George alone enough as the human, or does it need several people to say anything general?
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

Voice mode: first search (31 Oct 2026, from search snippets only, no papers opened yet). One search on voice-agent latency, silence and interruptions found mostly industry engineering guides about speed: pauses over about 500 ms feel like hesitation, and long ones make callers repeat themselves or give up (e.g. [Haptik](https://www.haptik.ai/blog/latency-interruption-handling-impact-on-voice-ai-quality), [Hamming AI](https://hamming.ai/resources/voice-ai-latency-whats-fast-whats-slow-how-to-fix-it)). One guide even advises against tool calls inside the voice loop to keep it fast ([AssemblyAI](https://www.assemblyai.com/blog/low-latency-voice-ai)), which is exactly the pressure that may make voice work shallower. Nothing found yet on whether that speed pressure lowers the quality of an agent's research or tool use. Possible gap; needs a proper academic search before claiming it's under-researched.

Inner voice and imagery: first search (31 Oct 2026, from search snippets and summaries only; papers not opened yet).
- Nedergaard and Lupyan, "Not Everybody Has an Inner Voice: Behavioral Consequences of Anendophasia" (Psychological Science, 2024): 93 people with low versus high self-reported inner speech. The low group did worse on verbal memory and rhyme tasks. A [BPS Research Digest summary](https://www.bps.org.uk/research-digest/silent-inner-world-anendophasia) says that among people who said the words out loud, the gap disappeared, suggesting speaking aloud compensated. Directly relevant: speaking might help some people think, which supports voice as a way of working, not just a shortcut.
- [Lind (2025), commentary in Psychological Science](https://journals.sagepub.com/doi/10.1177/09567976251335583): argues low self-reported inner speech isn't the same as having none, so the "no inner voice" claim is contested. Important caveat for how this project words it.
- A study summarised in a [research notes page](https://unfinishablemap.org/research/inner-speech-and-anendophasia-2026-08-02/) found visual imagery and auditory imagery strongly linked (128 people): most people without visual imagery also lacked an inner "ear". Secondhand; find the original.
- Nothing found yet on how these differences affect working with AI. Possible genuine gap; needs a proper academic search.
