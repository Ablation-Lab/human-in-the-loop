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
| 31 Oct | Claude Code | Two related-work summaries didn't match their abstracts, and found Anthropic's original auto-approve source | Chat Claude |

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
| [Mitchell, Ghosh and Passi, "AI Agents Push Humans Out of the Loop" (2026 position paper)](https://arxiv.org/abs/2608.23642) | Current approaches to agent design don't support effective human oversight, and long use of AI erodes the skills oversight depends on. | Supports H2 and H3. Closest match to this project. |
| Agudo et al., cited in [a 2026 systematic review of human-in-the-loop AI](https://www.mdpi.com/1099-4300/28/4/377) | People often fail to catch AI mistakes even when they have the knowledge to do so. | Challenges H1: being in the loop doesn't guarantee catching errors. Find and read the original studies. **Unverified:** the review exists (Lazaros, Vrahatis and Kotsiantis, Entropy, 2026), but access was blocked, so the Agudo citation isn't confirmed. |
| Anthropic, ["Measuring AI agent autonomy in practice"](https://www.anthropic.com/research/measuring-agent-autonomy) (18 Feb 2026), first seen via [NeuralTrust](https://neuraltrust.ai/blog/human-in-the-loop-ai-agents) | Auto-approve use rises from about 20% of sessions for new users to over 40% after around 750 sessions, so oversight drifts from checking each step to monitoring. | Supports H4. |
| [Zhu, Lu, Ding, Lee and Wang, "Designing meaningful human oversight in AI" (AI and Ethics, May 2026)](https://link.springer.com/article/10.1007/s43681-026-01147-7) | Proposes a layered agency framework to stop human oversight becoming a rubber stamp. | Relevant to the checkpoint setup: how to design oversight that isn't just rubber-stamping. |
| Narayanan and Feigh, "Designing for oversight" (International Journal of Human–Computer Interaction, 2026) | Studies how AI dependency and summarised information affect human supervision in teams. | Relevant to the checkpoint and watch-only setups. Not yet read. **Unverified:** no link found yet. |
| [Inadequate Human-in-the-Loop Oversight in Advanced AI Systems](https://www.researchgate.net/publication/395955309_Inadequate_Human-in-the-Loop_Oversight_in_Advanced_AI_Systems) | Describes a case where an AI agent got past a human overseer who was present but ineffective. | Loosely related: about a capable agent evading oversight rather than a tired relay. Useful as a cautionary example. **Unverified:** access was blocked, and a title search found nothing. |
