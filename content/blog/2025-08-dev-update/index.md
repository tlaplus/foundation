+++
type = "blog"
title = 'August 2025 Monthly Development Update'
date = 2025-08-15
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

- The [GenAI-Accelerated TLA⁺ Challenge](https://foundation.tlapl.us/challenge/) winners were [announced](https://groups.google.com/g/tlaplus/c/t50jSz8TcvY/m/Ep_UlGnjBQAJ)!
  First, second, and third place were as follows:
    1. [Qian Cheng](https://github.com/Qian-Cheng-nju), [Dr. Tianyin Xu](https://siebelschool.illinois.edu/about/people/faculty/tyxu), and [Dr. Yu Huang](https://cs.nju.edu.cn/yuhuang/) developed [Specula](https://github.com/specula-org/Specula), a framework for synthesizing TLA⁺ specifications from source code using LLMs.
       Their prize is a NVIDIA 5090 GPU!
    2. [Andrew Helwer](https://ahelwer.ca) investigated the viability of using a formal grammar to [constrain LLM token output](https://codeberg.org/tlaplus/tla-constrain-llm) so that it only produces valid TLA⁺ syntax.
       His prize is a year of GitHub Copilot Pro+!
    3. [Gregory Terzian](https://github.com/gterzian) explored using [TLA⁺ as a blueprint for generating idiomatic, multithreaded Rust code](https://github.com/gterzian/_refinement) with refinement.
       His prize is a year of Github Copilot Pro!
- The TLA⁺ Foundation grant program is continuing on a rolling basis; please [submit a proposal](/grants/2024-grant-program/) if you have ideas to improve TLA⁺ so the Foundation can support you financially as you work on them.
  You can find some desired projects listed [here](https://github.com/tlaplus/tlaplus/issues?q=is%3Aissue%20state%3Aopen%20label%3A%22TLA%2B%20Foundation%20Funding%22).
  If you're trying to figure out the next stage of your career and like the sound of being paid a stipend to work on free & open source software in the formal methods space, this is a great opportunity!

### Posts, Papers, and Specs

- [Lorin Hochstein](https://lorinhochstein.org/) wrote [a post](https://surfingcomplexity.blog/2025/07/26/formal-specs-as-sets-of-behaviors/) about how formal specifications differ from a traditional program: a program is a list of instructions, and a formal specification is a set of behaviors.
- [Igor Konnov](https://konnov.phd/) wrote about [proving completeness of an eventually perfect failure detector in Lean4](https://protocols-made-fun.com/lean/2025/06/10/lean-epfd-completeness.html), comparing & contrasting it to solving the same problem in TLA⁺.
- [Jarod Differdange](https://github.com/JarodDif) contributed two TLA⁺ specifications from his master's thesis [to the TLA⁺ examples repo](https://github.com/tlaplus/Examples/pull/177).
  The first spec is of a barrier for synchronizing threads, and the second uses auxiliary variables to achieve bidirectional refinement between [Peterson's algorithm](https://en.wikipedia.org/wiki/Peterson%27s_algorithm) and an abstract lock; the thesis itself can be read [here](http://hdl.handle.net/2268.2/23374).
- AI startup Crackd has launched a new platform to incentivize development of TLA⁺ specifications for training LLMs.
  Contributors will write a formal TLA⁺ spec corresponding to an informal specification document, along with a programming language implementation of the same system; they are then compensated according to the complexity of the problem.
  Interested potential contributors can fill out the form at https://www.getcrackd.ai/.

### TLA⁺ Docs & Tooling Updates

- The Java-based [core TLA⁺ tools](https://github.com/tlaplus/tlaplus) saw [Finn Hackett](https://fhackett.com/) extend TLC's `TLCCache` API to [work in constant contexts](https://github.com/tlaplus/tlaplus/pull/1214).
  [Markus Kuppe](https://github.com/lemmy/) further reduced false positives for a [recently-introduced linter warning](https://github.com/tlaplus/tlaplus/pull/1213) about TLA⁺ record field names.
- The [Apalache symbolic model checker](https://github.com/apalache-mc/apalache) saw [Igor Konnov](https://konnov.phd/) work to migrate Maven package publishing [to Sonatype Central](https://github.com/apalache-mc/apalache/pull/3121) (now that OSSRH is EOL'd) and begin implementation of a [JSON RPC server](https://github.com/apalache-mc/apalache/pull/3122) facilitating integration of Apalache with other codebases.
- The [TLA⁺ Unicode Converter](https://github.com/tlaplus-community/tlauc) had a new `--skip` CLI parameter [added](https://github.com/tlaplus-community/tlauc/pull/23) by [Andrew Helwer](https://ahelwer.ca), to avoid translating Unicode symbols like ℕ, ℤ, and ℝ that mainline TLA⁺ parsers [do not yet support](https://github.com/tlaplus/tlaplus/issues/1020).
- In the [TLA⁺ VS Code extension](https://github.com/tlaplus/vscode-tlaplus/), [Markus Kuppe](https://github.com/lemmy/) fixed a bug where parser problems were [not clearing properly](https://github.com/tlaplus/vscode-tlaplus/pull/407).
  [Federico Ponzi](https://blog.fponzi.me/) contributed a fix for some [linter issues](https://github.com/tlaplus/vscode-tlaplus/pull/405).

### TLA⁺ Foundation-Funded Updates

Here are things [Andrew Helwer](https://ahelwer.ca/) (author of this post) worked on - all funded by the TLA⁺ Foundation!
- In the Java-based [core TLA⁺ tools](https://github.com/tlaplus/tlaplus), I [fixed a bug](https://github.com/tlaplus/tlaplus/pull/1222) introduced by my recent SANY output control changes, which inadvertently silenced detailed parser error messages in some cases.
  I also extended my previous error code standardization work to encompass [PlusCal translation-hash mismatch warnings](https://github.com/tlaplus/tlaplus/pull/1215).
  In service of recent user requests to support reading TLA⁺ specs from non-file sources, I proposed [some refactorings](https://github.com/tlaplus/tlaplus/pull/1225) to SANY's core `NamedInputStream` class.
  Finally, I developed [a set of tests](https://github.com/tlaplus/tlaplus/pull/1228) for SANY's tokenizer and the parser's `belchDEF` method, a small but critical method that identifies the start of new operator definitions.
- For my main task of transitioning [TLAPM](https://github.com/tlaplus/tlapm) to use SANY as its parser, I continued translating the TLAPM syntax tree [into a standardized S-expression format](https://github.com/tlaplus/tlapm/pull/229) for comparison with an expected S-expression parse tree across a standardized set of TLA⁺ parse inputs.
  This work seems approximately 75% complete, in terms of number of distinct TLA⁺ AST node types for which a translation funtion has been written.
  One [parser bug](https://github.com/tlaplus/tlapm/issues/235) has been identified through this work.
- I did some work on the [TLA⁺ Examples](https://github.com/tlaplus/examples) repo, simplifying the CI & spec contribution process ([1](https://github.com/tlaplus/Examples/pull/180), [2](https://github.com/tlaplus/Examples/pull/181), [3](https://github.com/tlaplus/Examples/pull/182), [4](https://github.com/tlaplus/Examples/pull/185)) and adding some additional example specs to CI validation ([1](https://github.com/tlaplus/Examples/pull/183), [2](https://github.com/tlaplus/Examples/pull/184)).

### Newbie Corner

Here we highlight an issue that would be a good choice for new contributors!
Before starting work, be sure to read the [contribution guidelines](https://github.com/tlaplus/tlaplus/blob/master/CONTRIBUTING.md) and discuss your planned approach with maintainers.

This month we're looking at adding a capability to TLC's model file format: [the `EXPECT` statement](https://github.com/tlaplus/tlaplus/issues/1192).
Sometimes, users *want* a model-checker run to fail in an interesting way, for example if the spec has identified a particularly interesting bug.
For this it would be useful to have an `EXPECT` construct so the user can define the expected result of running a model - be that success, invariant violation, or otherwise.
If TLC finds an invariant violation, ordinarily it will exit with a nonzero exit code.
However, if the model file contains an `EXPECT` statement that an invariant violation is expected, it should exit with a zero (success) error code instead.

The work required is roughly:
 1. Locate the TLC model file parsing code and add support for `EXPECT` syntax
 2. Propagate the `EXPECT` value back to the top level of TLC, modifying the command-line exit code logic to exit with a zero code if the result is as specified by `EXPECT`

Since this issue involves modifying TLC's exit code logic, it's similar to the issue [highlighted in the June 2025 newsletter](/blog/2025-06-dev-update/#newbie-corner).
If you fix one issue, it would probably be easy for you to fix the other!

Issues highlighted in past months have also yet to be claimed:
 - July 2025: [SANY allows the `@` symbol in places it shouldn't](/blog/2025-07-dev-update/#newbie-corner)
 - June 2025: [Emit different TLC exit codes for stuttering vs. lasso liveness counterexamples](/blog/2025-06-dev-update/#newbie-corner)
 - May 2025: [Handle contraints like `<<y>>' = <<y>>`](blog/2025-05-dev-update/#newbie-corner)
 - April 2025: [PlusCal translates to invalid TLA⁺ if procedure identifier is too long](blog/2025-04-dev-update/#newbie-corner)
 - March 2025: [interpret expressions of the form `x' ⊆ S`](blog/2025-03-dev-update/#newbie-corner)
 - February 2025: [interpret expressions of the form `CHOOSE x : x ∈ S`](blog/2025-02-dev-update/#newbie-corner)

