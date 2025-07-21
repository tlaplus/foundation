+++
type = "blog"
title = 'July 2025 Monthly Development Update'
date = 2025-07-15
+++

This is the TLA⁺ Foundation monthly development update ([subscribe via RSS](/blog/index.xml)).
Here we summarize the past month of development for the benefit of Foundation patrons and interested members of the community.
We will also highlight a good bug or small feature for prospective new contributors to look at!
If your TLA⁺ contribution was missed, worry not - we publish monthly, so it's easy to hop on the next train; open an issue [here](https://github.com/tlaplus/foundation/issues).

If you're interested in getting involved in the TLA⁺ community:
- Learn TLA⁺ starting [here](https://lamport.azurewebsites.net/tla/learning.html)!
- Join the monthly virtual community meetings [here](https://groups.google.com/g/tlaplus/c/3CloQYEH0qQ/m/GAIxbKNgBAAJ)!
- Read the mailing list [here](https://groups.google.com/g/tlaplus)!
- Start hacking on the tools themselves [here](https://github.com/tlaplus/tlaplus)!

### Organizational Updates

- The TLA⁺ Foundation grant program is continuing on a rolling basis; please [submit a proposal](/grants/2024-grant-program/) if you have ideas to improve TLA⁺ so the Foundation can support you financially as you work on them.
  You can find some desired projects listed [here](https://github.com/tlaplus/tlaplus/issues?q=is%3Aissue%20state%3Aopen%20label%3A%22TLA%2B%20Foundation%20Funding%22).
  If you're trying to figure out the next stage of your career and like the sound of being paid a stipend to work on free & open source software in the formal methods space, this is a great opportunity!
- The [GenAI-Accelerated TLA⁺ Challenge](https://foundation.tlapl.us/challenge/) submission date was on July 3rd.
  Four submissions were received, and the winners will be announced at the start of August!

### Posts & Papers

- [Heidi Howard](http://www.heidihoward.co.uk/) wrote [an accessible overview](https://decentralizedthoughts.github.io/2025-05-23-smart-casual-verification/) of the [Confidential Consortium Framework](https://www.vldb.org/pvldb/vol17/p225-howard.pdf) paper, which was modeled using TLA⁺.
- [Andrew Helwer](https://ahelwer.ca) wrote [a post](https://ahelwer.ca/post/2025-07-04-tla-contracts/) about a TLA⁺ contract that didn't turn out as hoped, and how it reinforced his belief that the greatest value in writing a TLA⁺ specification is forcing you to think deeply about your system.

### TLA⁺ Docs & Tooling Updates

- The [TLA⁺ Wiki](https://docs.tlapl.us) has now been successfully migrated from an old Inria server onto hosting paid for by the TLA⁺ Foundation, thanks to [Federico Ponzi](https://blog.fponzi.me/).
- In the [TLA⁺ VS Code extension](https://github.com/tlaplus/vscode-tlaplus/), [Markus Kuppe](https://github.com/lemmy/) exposed a new TLA⁺ model exploration command through the Model Context Protocol ([1](https://github.com/tlaplus/vscode-tlaplus/pull/397), [2](https://github.com/tlaplus/vscode-tlaplus/pull/398)).
  [Younes](https://younes.io/about/) added [heatmap execution profiling](https://github.com/tlaplus/vscode-tlaplus/pull/393), so TLA⁺ actions can be highlighted according to how often they are taken in a model-checking run.
- The Java-based [core TLA⁺ tools](https://github.com/tlaplus/tlaplus) saw Markus Kuppe add [a new parameter](https://github.com/tlaplus/tlaplus/pull/1199) to the TLC model-checker to specify invariants from the command line.
  He also continued adding warnings ([1](https://github.com/tlaplus/tlaplus/pull/1201), [2](https://github.com/tlaplus/tlaplus/pull/1203), [3](https://github.com/tlaplus/tlaplus/pull/1204)) to TLC's liveness checker.
- In the [TLA⁺ Proof Manager](https://github.com/tlaplus/tlapm), [Damien Doligez](https://github.com/damiendoligez) added support for [the `\forall` and `\exists` quantification token variants](https://github.com/tlaplus/tlapm/pull/219) and fixed a [macOS build issue](https://github.com/tlaplus/tlapm/pull/215).
  [Stephan Merz](https://members.loria.fr/SMerz/index.html) upgraded the version of Isabelle bundled with TLAPM and [fixed all library proofs](https://github.com/tlaplus/tlapm/pull/217), assisted by [rozlynd](https://github.com/tlaplus/tlapm/pull/216) and [Karolis Petrauskas](https://github.com/tlaplus/tlapm/pull/220).
  Stephan then [fixed every formal proof](https://github.com/tlaplus/Examples/pull/175) in the [TLA⁺ examples](https://github.com/tlaplus/examples) repository to work with the updated TLAPM.
  Karolis also worked to bring the long-lived `updated_enabled_cdot` branch closer to merge-ready, by [speeding up proof step fingerprint calculations](https://github.com/tlaplus/tlapm/pull/222); the `updated_enabled_cdot` branch adds additional automated rewrite capabilities for reasoning about `ENABLED` statements.

### TLA⁺ Foundation-Funded Updates

Here are things [Andrew Helwer](https://ahelwer.ca/) (author of this post) worked on - all funded by the TLA⁺ Foundation!
- For my main task of transitioning [TLAPM](https://github.com/tlaplus/tlapm) to use SANY as its parser, I have been translating the TLAPM syntax tree [into a standardized S-expression format](https://github.com/tlaplus/tlapm/pull/229) for comparison with an expected S-expression parse tree across a standardized set of TLA⁺ parse inputs.
  This builds familiarity with the TLAPM AST format and ensures thorough test coverage during the transition to using SANY.
- For the [*Create your own TLA⁺ tools*](https://docs.tlapl.us/creating:start) how-to guide, I completed the crucial chapter on [variables, states, and actions](https://docs.tlapl.us/creating:actions).
  Here learners encounter the strange dual nature of interpreting TLA⁺, where statements both evaluate to values and reveal possible next states of the system.
  Only two chapters remain: one on how to model-check TLA⁺ (largely trivial once a next-state interpreter has been written) and a final one on the surprisingly subtle method of evaluating operator arguments lazily so that TLA⁺ operators can work like macros expanding into parameter-free expressions.
- In the Java-based [core TLA⁺ tools](https://github.com/tlaplus/tlaplus), I worked to support greater [control over output](https://github.com/tlaplus/tlaplus/pull/1209) and [error reporting](https://github.com/tlaplus/tlaplus/pull/1202) in the SANY parser.
  I also did some refactoring, replacing [a custom internal stack class](https://github.com/tlaplus/tlaplus/pull/1210) with the Deque class from Java's standard library.
- I supported Stephan's TLAPM upgrade & proof fixing efforts by adding some proof checks [to the TLAPM CI](https://github.com/tlaplus/tlapm/pull/218) and fixing [a bug in state count recording logic](https://github.com/tlaplus/Examples/pull/176) in the TLA⁺ examples repo.

This past month also saw longtime TLAPM contributor [Karolis Petrauskas](https://github.com/kape1395) receive a TLA⁺ Foundation grant to work on [decomposing TLA⁺ proofs](https://github.com/tlaplus/tlapm/issues/205) in the VS Code extension, by implementing a new LSP code action.

### Newbie Corner

Here we highlight an issue that would be a good choice for new contributors!
Before starting work, be sure to read the [contribution guidelines](https://github.com/tlaplus/tlaplus/blob/master/CONTRIBUTING.md) and discuss your planned approach with maintainers.

This month we're back down in the depths of the parser.
The Java-based SANY parser allows the `@` symbol [in places it shouldn't](https://github.com/tlaplus/tlaplus/issues/1153), such as constant or operator definitions.
The `@` symbol is ordinarily used in statements like `[f EXCEPT ![x] = @ + 1]` to refer to the un-modified function value.

There are a few different ways to fix this.
One possibility: at the lexer level, separate `@` from the general identifier regular expression, then selectively allow `@` in various places (for example, as an atom in ordinary expressions) at the syntax parser level.
Existing resolution machinery would then catch `@` being used outside of `EXCEPT` expressions.

Issues highlighted in past months have also yet to be claimed!
 - June 2025: [Emit different TLC exit codes for stuttering vs. lasso liveness counterexamples](https://github.com/tlaplus/tlaplus/issues/1041)
 - May 2025: [Handle contraints like `<<y>>' = <<y>>`](blog/2025-05-dev-update/#newbie-corner)
 - April 2025: [PlusCal translates to invalid TLA⁺ if procedure identifier is too long](blog/2025-04-dev-update/#newbie-corner)
 - March 2025: [interpret expressions of the form `x' ⊆ S`](blog/2025-03-dev-update/#newbie-corner)
 - February 2025: [interpret expressions of the form `CHOOSE x : x ∈ S`](blog/2025-02-dev-update/#newbie-corner)

