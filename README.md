# Fallacy-Aware

Critical thinking skills for Claude Code. 24 cognitive guardrails that activate when reasoning is most likely to go wrong — forcing a pause to research, reflect, and explain before proceeding.

## Install

```bash
claude plugin add zieka/fallacy-aware
```

## How It Works

Skills activate two ways:

- **Explicitly** — invoke `fallacy-aware:<skill-name>` directly
- **Contextually** — Claude detects trigger patterns and activates the appropriate skill automatically

### Severity Levels

- **Gate** — Claude stops and researches before proceeding. Used for irreversible or high-impact actions.
- **Advisory** — Claude flags the potential fallacy, explains briefly, and continues. Used for reasoning patterns.

## Skills

### Hard Gates (7)

These skills stop Claude from proceeding until research is done.

| Skill | Trigger | Core Error |
|---|---|---|
| `chestertons-fence` | Removing/deleting code | Removing something before understanding why it exists |
| `hyrums-law` | Changing observable behavior | Assuming you can change behavior without breaking consumers |
| `galls-law` | Rewriting a system from scratch | Believing you can design a complex replacement all at once |
| `second-system-effect` | Designing a v2 with expanded scope | Overloading a rebuild with every feature wish |
| `sunk-cost` | Continuing a failing approach | Letting past investment drive future decisions |
| `cargo-culting` | Adopting patterns without understanding | Copying form without understanding function |
| `false-dichotomy` | Framing a decision as only two options | Presenting only two options when more exist |

### Soft Advisories (17)

These skills flag reasoning patterns and continue.

| Skill | Core Error |
|---|---|
| `appeal-to-tradition` | Doing something because it's always been done that way |
| `appeal-to-novelty` | Assuming something is better because it's new |
| `slippery-slope` | Assuming one step inevitably leads to catastrophe |
| `straw-man` | Misrepresenting an argument to attack it |
| `ad-hominem` | Attacking the person rather than the argument |
| `hasty-generalization` | Drawing broad conclusions from insufficient data |
| `post-hoc` | Assuming causation from correlation |
| `no-true-scotsman` | Moving goalposts to protect a generalization |
| `gamblers-fallacy` | Believing past events affect future probability |
| `argument-from-authority` | Accepting a claim because of who said it |
| `argument-from-silence` | Treating absence of evidence as evidence of safety |
| `tu-quoque` | Deflecting criticism instead of addressing it |
| `goodharts-law` | When a measure becomes a target, it stops being a good measure |
| `conways-law` | Systems mirror org structure, not necessarily domain boundaries |
| `leaky-abstractions` | Abstractions eventually force you to understand what they hide |
| `occams-razor` | The simplest explanation is probably right |
| `hanlons-razor` | Don't attribute to malice what can be explained by context |

## Theme Groupings

| Theme | Skills |
|---|---|
| Epistemic humility before removing | Chesterton's Fence, Hyrum's Law |
| Epistemic humility before replacing | Gall's Law, Second System Effect |
| Epistemic humility before adopting | Cargo Culting, Appeal to Novelty, Appeal to Tradition |
| Epistemic humility in measurement | Goodhart's Law |
| Epistemic humility in abstraction | Leaky Abstractions |
| Epistemic humility about people | Conway's Law, Hanlon's Razor, Ad Hominem |
| Reasoning errors about causation | Post Hoc, Gambler's Fallacy, Hasty Generalization |
| Reasoning errors about options | False Dichotomy, Slippery Slope, Sunk Cost |
| Rhetorical misdirection | Straw Man, Tu Quoque, Ad Hominem, No True Scotsman |
| Misplaced deference | Argument from Authority, Argument from Silence |

## Examples

### Gate: Chesterton's Fence

> **You:** "Remove this `time.sleep(2)`, it's slowing down the tests."
>
> **Claude (with fallacy-aware):** "Before removing this, let me understand why it's there." *researches git history* "This sleep was added in commit abc123 to work around a DB connection race condition in CI. Removing it may cause flaky tests. Want me to replace it with a proper retry mechanism instead?"

### Advisory: Sunk Cost

> **You:** "This approach isn't working perfectly but we've already put two days into it. Let's just add one more workaround."
>
> **Claude (with fallacy-aware):** "Let me step back — we've added 4 workarounds in 2 days. Fresh-start test: if we were starting today, would we choose this approach? A simpler alternative would handle this naturally without workarounds. The 2 days are spent either way. Recommend: spend 3 hours trying the simpler approach."

## License

MIT
