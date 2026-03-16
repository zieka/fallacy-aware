# Fallacy-Aware

Critical thinking skills for software engineering. 24 cognitive guardrails that activate when reasoning is most likely to go wrong — forcing a pause to research, reflect, and explain before proceeding.

Skills activate two ways:
- **Explicitly** via `fallacy-aware:<skill-name>`
- **Contextually** when trigger patterns are detected in a request or in Claude's own reasoning

## Severity Levels

- **Gate:** Claude MUST stop and research before proceeding. Used when about to take an irreversible or high-impact action without full understanding.
- **Advisory:** Claude flags the potential fallacy, explains briefly, and continues. Used for reasoning patterns that benefit from awareness.

## Contextual Triggers

When you detect any of these patterns, invoke the corresponding skill using the Skill tool.

### Hard Gates — Stop and research before proceeding

| Pattern | Skill | Core Error |
|---|---|---|
| Removing/deleting/disabling code without understanding why it exists | `fallacy-aware:chestertons-fence` | Removing something before understanding why it was put there |
| Changing observable behavior of APIs, interfaces, or shared systems | `fallacy-aware:hyrums-law` | Assuming you can change observable behavior without breaking consumers |
| Proposing to rewrite or replace a working system from scratch | `fallacy-aware:galls-law` | Believing you can design a complex replacement all at once |
| Designing a v2/next-gen replacement with expanded scope | `fallacy-aware:second-system-effect` | Overloading a rebuild with every feature wish from the original |
| Continuing a failing approach because of time already invested | `fallacy-aware:sunk-cost` | Letting past investment drive future decisions |
| Adopting patterns, tools, or frameworks without understanding why they work | `fallacy-aware:cargo-culting` | Copying form without understanding function |
| Framing a decision as only two options | `fallacy-aware:false-dichotomy` | Presenting only two options when more exist |

### Soft Advisories — Flag and continue

| Pattern | Skill | Core Error |
|---|---|---|
| Justifying a practice because "we've always done it this way" | `fallacy-aware:appeal-to-tradition` | Doing something because it's always been done that way |
| Choosing something primarily because it's new | `fallacy-aware:appeal-to-novelty` | Assuming something is better because it's new |
| Predicting catastrophic chain reactions from a single change | `fallacy-aware:slippery-slope` | Assuming one step inevitably leads to catastrophe |
| Mischaracterizing a position to argue against it | `fallacy-aware:straw-man` | Distorting an argument to make it easier to attack |
| Dismissing input based on who said it rather than its merit | `fallacy-aware:ad-hominem` | Attacking the person rather than the argument |
| Drawing broad conclusions from one or two data points | `fallacy-aware:hasty-generalization` | Drawing broad conclusions from insufficient data |
| Assuming A caused B because A happened first | `fallacy-aware:post-hoc` | Assuming causation from correlation |
| Redefining criteria to exclude counterexamples | `fallacy-aware:no-true-scotsman` | Moving goalposts to protect a generalization |
| Assuming past independent events affect future probability | `fallacy-aware:gamblers-fallacy` | Believing past independent events affect future probability |
| Accepting a claim because of who said it | `fallacy-aware:argument-from-authority` | Accepting a claim because of who said it, not its merit |
| Treating absence of evidence as evidence of correctness | `fallacy-aware:argument-from-silence` | Treating absence of evidence as evidence of safety |
| Deflecting criticism by pointing to the critic's inconsistency | `fallacy-aware:tu-quoque` | Deflecting criticism instead of addressing it |
| Optimizing a metric as a target rather than an indicator | `fallacy-aware:goodharts-law` | When a measure becomes a target, it ceases to be a good measure |
| System architecture mirroring org structure inappropriately | `fallacy-aware:conways-law` | Systems mirror the org structure that built them |
| Adding more abstraction when the current abstraction is leaking | `fallacy-aware:leaky-abstractions` | All non-trivial abstractions eventually force you to understand what they hide |
| Preferring a complex explanation over a simpler one | `fallacy-aware:occams-razor` | The simplest explanation consistent with evidence is probably right |
| Attributing code decisions to malice or incompetence | `fallacy-aware:hanlons-razor` | Don't attribute to malice what can be explained by ignorance |
