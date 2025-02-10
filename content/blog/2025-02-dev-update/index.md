+++
type = "blog"
title = 'February 2025 Monthly Development Update'
date = 2025-02-15
+++

You're reading the TLA⁺ Foundation monthly development update.
Here we summarize the past month of development for the benefit of Foundation patrons and interested members of the community.
We will also highlight a good bug or small feature for prospective new contributors to look at!
If your TLA⁺ contribution was missed or some important part of it that wasn't captured in the summary, worry not -
these newsletters will be published monthly, so it's easy to hop on the next train; open an issue [here](https://github.com/tlaplus/foundation/issues).

If you're interested in getting involved in the TLA⁺ community:
- Learn TLA⁺ starting [here](https://lamport.azurewebsites.net/tla/learning.html)!
- Join the monthly virtual community meetings [here](https://groups.google.com/g/tlaplus/c/3CloQYEH0qQ/m/GAIxbKNgBAAJ)!
- Read the mailing list [here](https://groups.google.com/g/tlaplus)!
- Start hacking on the tools themselves [here](https://github.com/tlaplus/tlaplus)!

Let's start with some interesting non-coding-related developments & announcements:
- The [TLA⁺ Community Event 2025](https://conf.tlapl.us/2025-etaps/) will be co-located with [ETAPS 2025](https://etaps.org/2025/) in Hamilton, Ontario, Canada on May 4th, 2025.
  The talk submission deadline is Friday, February 28th; hopefully we'll have some great talks in store and we look forward to seeing you there!
- The TLA⁺ Foundation grant program is continuing on a rolling basis; please [submit a proposal](/grants/2024-grant-program/) if you have ideas to improve TLA⁺ so the Foundation can support you financially as you work on them.
- In Europe, [ABZ 2025](https://abz-conf.org/site/2025/) - the 11th International Conference on Rigorous State-Based Methods - will take place from June 10th to 13th of 2025 in Düsseldorf, Germany and will hopefully have some TLA⁺-related talks.
- [Hillel Wayne](https://www.hillelwayne.com/) wrote [a post](https://buttondown.com/hillelwayne/archive/what-are-the-rosettas-of-formal-specification/) exploring the idea of "Rosetta problems" for formal specification - common simple problems for comparing different formal specification languages by looking at how each language solves each problem.

Now on to coding-related community developments:
- [Calvin Loncaric](https://calvin.loncaric.us/) ran [some benchmarks](https://github.com/tlaplus/rfcs/issues/16#issuecomment-2563975827) on the SANY TLA⁺ parser and found latency could be greatly improved by using [Graal native images](https://www.graalvm.org/22.1/reference-manual/native-image/index.html).
 He contributed [a fix](https://github.com/tlaplus/tlaplus/pull/1116) to SANY's dependency loading code so it works with TLA⁺ modules embedded within the images, also taking the opportunity to improve the code's clarity ([1](https://github.com/tlaplus/tlaplus/pull/1127), [2](https://github.com/tlaplus/tlaplus/pull/1124)).
 Latency is important to consider as more applications move to consume SANY as a dependency.
- [Stephan Merz](https://members.loria.fr/SMerz/) explored using TLA⁺'s proof language to analyze monotonic systems.
 Distributed system designs commonly use monotonicity with elements like increment-only counters or append-only logs.
 Monotonic systems have an unbounded state space so are difficult to analyze with finite model-checking.
 Stephan [proved convergence of a conflict-free replicated datatype](https://github.com/tlaplus/Examples/pull/153#issuecomment-2649586427) and validated the proof using [TLAPM](https://github.com/tlaplus/tlapm).
- [Federico Ponzi](https://fponzi.me/) contributed [a fix](https://github.com/tlaplus/vscode-tlaplus/pull/362) for erroneous syntax highlighting in the TLA⁺ VSCode extension, ensuring operator definitions are not highlighted inside comments.
While a tree-sitter grammar for TLA⁺ [does exist](https://github.com/tlaplus-community/tree-sitter-tlaplus/), VSCode [does not support it](https://github.com/microsoft/vscode/issues/50140) and so it is necessary to maintain a regex-based TextMate grammar for syntax highlighting.
- [William Schultz](https://will62794.github.io/) made a number of updates to [spectacle](https://github.com/will62794/spectacle), a JavaScript-based interpreter for TLA⁺ previously known as tla-web.
 In particular, support was added for calling operators in modules imported as instances.
- [Karolis Petrauskas](https://github.com/kape1395) landed [a fix](https://github.com/tlaplus/tlapm/pull/194) for a race condition in the TLA⁺ language server when running multiple concurrent TLAPM backend provers.
 He also looked into strangely long processing times in the TLAPM parser ([1](https://github.com/tlaplus/tlapm/pull/148#issuecomment-2558607669), [2](https://github.com/tlaplus/tlapm/pull/186)); the level-checker turned out to be the culprit, exhibiting exponential-time behavior on some inputs.
- [Damien Doligez](http://cambium.inria.fr/~doligez/) worked on [speeding up the TLAPM level-checking process using memoization](https://github.com/tlaplus/tlapm/pull/198).
- [Julia Ferraioli](https://www.juliaferraioli.com/) had previously submitted TLA⁺ for inclusion in the [Amazon Web Services Open Source Credits Program](https://aws.amazon.com/blogs/opensource/aws-promotional-credits-open-source-projects/).
It was [recently accepted](https://github.com/tlaplus/tlaplus/issues/864#issuecomment-2578225917), so [Finn Hackett](https://github.com/fhackett) and [Markus Kuppe](https://github.com/lemmy) worked to revive performance tests for the TLC model checker!
- Longtime TLA⁺ Tools maintainer [Markus Kuppe](https://github.com/lemmy) continued investigation of fingerprint duplication issues arising during long-running model checking ([1](https://github.com/tlaplus/tlaplus/pull/1122), [2](https://github.com/tlaplus/tlaplus/pull/1137)), fixed a bug with TLC [using the wrong value in parameterized spec instances](https://github.com/tlaplus/tlaplus/pull/1139), and investigated lasso-shaped liveness examples [failing to reconstruct](https://github.com/tlaplus/tlaplus/pull/1111) when a `VIEW` is defined.

Finally, things [Andrew Helwer](https://ahelwer.ca/) (author of this post) worked on - all funded by the TLA⁺ Foundation!
- I worked with [Calvin Loncaric](https://calvin.loncaric.us/) to [design a new API for the SANY TLA⁺ parser](https://github.com/tlaplus/tlaplus/pull/1125), supporting emerging use-cases and setting us up to easily expose more capabilities in the future.
- The bulk of my time went toward developing a [semantic test corpus for TLA⁺](https://github.com/tlaplus/tlaplus/pull/1133): a large set of implementation-independent test files filled with assertions about semantic properties like identifier resolution and expression level (roughly analogous to type-checking) which various TLA⁺ tools can adopt to verify conformance with the language specification.
This sort of work is dull, slow, and seemingly endless - but I know from experience how wonderful it is to have an existing test corpus to rely on & add to over time!
At this point the tests cover most of the important parts of the language, although there are always more cases to consider.
- I did some [testing & refactoring](https://github.com/tlaplus/tlaplus/pull/1135) of SANY's error reporting machinery to facilitate future implementation of [standardized error codes](https://github.com/tlaplus/rfcs/issues/15) in TLA⁺ parsing.
 In addition to the clear usability improvement of including such codes in user-visible error messages for reference, they would enable development of a negative counterpart to the semantic test corpus: a set of specifications which should each trigger a specific error code when parsed.
- I did some minor refactoring of existing SANY tests ([1](https://github.com/tlaplus/tlaplus/pull/1129), [2](https://github.com/tlaplus/tlaplus/pull/1131)) using JUnit's class parameterization & assume functionality to control test execution.
- I wrote two RFCs proposing un-contentious changes to the TLA⁺ language standard ([1](https://github.com/tlaplus/rfcs/issues/18), [2](https://github.com/tlaplus/rfcs/issues/19)).
 While both RFCs address issues that ought to be definitively decided, I think they are primarily useful as exercises for figuring out what the full end-to-end language standard update process *actually is*.
 We can then apply that same process to more-exciting RFCs, like [combining set map & filter into a single language construct](https://github.com/tlaplus/rfcs/issues/10)!

## Newbie Corner

Here we highlight an issue that would be a good choice for new contributors!
This one is a bit more advanced than past months, but hopefully someone can rise to the challenge: we want TLC to [interpret expressions of the form `CHOOSE x : x ∈ S`](https://github.com/tlaplus/tlaplus/issues/619).
Ordinarily this would be an unbounded choose error, but *this specific form* of the expression is obviously bounded (the bound is just given in the body!) and is much nicer to write than the clunky `CHOOSE x ∈ S : TRUE`.

To solve this issue you will need to:
1. Figure out where TLC raises the unbounded choose error
2. Modify the logic to first check whether the choose body is just the `∈` infix operator, defining an expression of the form `x ∈ S`
3. If so, evaluate the choose expression as though the bound is `S` instead of raising an error

As a bonus you can extend this work to support larger sets of reasonable expressions, like `CHOOSE x : x ∈ S ∧ …`.

Issues highlighted in past months have also yet to be claimed!
 - January 2025: [fix the PlusCal CLI `-labelRoot` option](https://github.com/tlaplus/tlaplus/issues/1092)
 - December 2024: [add parser support for backticks in strings](https://github.com/tlaplus/tlaplus/issues/802)

