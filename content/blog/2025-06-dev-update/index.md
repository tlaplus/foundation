+++
type = "blog"
title = 'June 2025 Monthly Development Update'
date = 2025-06-15
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

- The TLA⁺ Foundation, in collaboration with NVIDIA, is holding a [GenAI-Accelerated TLA⁺ Challenge](https://foundation.tlapl.us/challenge/)!
  This is an open call for submissions exploring the intersection of TLA⁺ and generative AI.
  Entries must be submitted by July 3rd, 2025 and will be judged by the TLA⁺ Specification Language Committee.
  First place wins a NVIDIA RTX 5090 GPU!
- The TLA⁺ Foundation grant program is continuing on a rolling basis; please [submit a proposal](/grants/2024-grant-program/) if you have ideas to improve TLA⁺ so the Foundation can support you financially as you work on them.
  You can find some desired projects listed [here](https://github.com/tlaplus/tlaplus/issues?q=is%3Aissue%20state%3Aopen%20label%3A%22TLA%2B%20Foundation%20Funding%22).
  If you're trying to figure out the next stage of your career and like the sound of being paid a stipend to work on free & open source software in the formal methods space, this is a great opportunity!

### Posts & Papers

- [Divyanshu Ranjan](https://github.com/rdivyanshu) has been working to formalize portions of Leslie Lamport's new textbook [*A Science of Concurrent Programs*](https://lamport.azurewebsites.net/tla/science-book.html) in Rocq; you can follow the progress [here](https://github.com/rdivyanshu/one-bit).
- [A. Jesse Jiryu Davis](https://emptysqua.re/blog/about/) wrote [a retrospective](https://emptysqua.re/blog/mongodb-conformance-checking/) on work presented at the [2020 TLA⁺ Community Event](https://conf.tlapl.us/2020/) detailing TLA⁺ conformance checking at MongoDB.
- [Hillel Wayne](https://www.hillelwayne.com/) wrote a post titled [*Modeling Awkward Social Situations with TLA⁺*](https://buttondown.com/hillelwayne/archive/modeling-awkward-social-situations-with-tla/), which casts the common issue of two people trying to pass one another as a liveness problem.
  He also wrote another post titled [*AI is a gamechanger for TLA⁺ users*](https://buttondown.com/hillelwayne/archive/ai-is-a-gamechanger-for-tla-users/), on his experiments using LLMs in agent mode to modify TLA⁺ specs.
- [Cheng Huang](https://www.microsoft.com/en-us/research/people/chengh/) published a post ambitiously titled [*The Coming AI Revolution in Distributed Systems*](https://zfhuang99.github.io/github%20copilot/formal%20verification/tla+/2025/05/24/ai-revolution-in-distributed-systems.html), about using LLMs to extract a TLA⁺ specification of an existing system from its implementation.
- Three new specs were added to the [TLA⁺ Examples](https://github.com/tlaplus/Examples) repo: [Konstantin Läufer](https://laufer.cs.luc.edu/) added a [microwave example](https://github.com/tlaplus/Examples/pull/169), and [Florian Schanda](https://github.com/florianschanda) added a variant of [The Prisoner's Puzzle](https://github.com/tlaplus/Examples/pull/172) and a puzzle involving finding [a cat hidden in one of several boxes](https://github.com/tlaplus/Examples/pull/173).

### TLA⁺ Tooling Updates

- The web-based [spectacle TLA⁺ interpreter](https://github.com/will62794/spectacle) had [GraphViz animation supported](https://github.com/will62794/spectacle/commit/f1c3c266565035f2040a8b39a41bea15fb8e20e0) added by [William Schultz](https://will62794.github.io/), and [Markus Kuppe](https://github.com/lemmy/) contributing several example specs with animations ([1](https://github.com/will62794/spectacle/pull/65), [2](https://github.com/will62794/spectacle/pull/67), [3](https://github.com/will62794/spectacle/pull/69), [4](https://github.com/will62794/spectacle/pull/70)).
- [tree-sitter-tlaplus](https://github.com/tlaplus-community/tree-sitter-tlaplus) saw a [metadata update](https://github.com/tlaplus-community/tree-sitter-tlaplus/pull/138) by [Kim Burgess](https://simple.industries/about.html) as part of a larger effort to [onboard tree-sitter grammars to nixpkgs](https://github.com/NixOS/nixpkgs/pull/408414).
- The [TLA⁺ VS Code extension](https://github.com/tlaplus/vscode-tlaplus/) added support for [the Model Context Protocol](https://github.com/tlaplus/vscode-tlaplus/pull/379) thanks to Markus Kuppe.
  [Federico Ponzi](https://blog.fponzi.me/) fixed a [window focus issue](https://github.com/tlaplus/vscode-tlaplus/pull/381).
  New contributor [Younes](https://younes.io/about/) made quite an entrance by fixing issues with [record field syntax highlighting](https://github.com/tlaplus/vscode-tlaplus/pull/382), incorrect go-to-definition functionality [for record field names](https://github.com/tlaplus/vscode-tlaplus/pull/384), incorrect trace annotations for [set differences](https://github.com/tlaplus/vscode-tlaplus/pull/388), misplaced [proof status markings](https://github.com/tlaplus/vscode-tlaplus/pull/389), and a broken [VS Code grammar test](https://github.com/tlaplus/vscode-tlaplus/pull/390).
  He also added [TLC simulation statistics visualization](https://github.com/tlaplus/vscode-tlaplus/pull/385), further improved [TLA⁺ syntax highlighting](https://github.com/tlaplus/vscode-tlaplus/pull/391), and added [VS Code grammar tests to the CI](https://github.com/tlaplus/vscode-tlaplus/pull/392).
- The Java-based [core TLA⁺ tools](https://github.com/tlaplus/tlaplus) saw Markus Kuppe further refine a recently-added [SANY linter warning about records](https://github.com/tlaplus/tlaplus/pull/1189).
  Markus also introduced a new warning in TLC for when users try to check liveness properties that are [trivially true](https://github.com/tlaplus/tlaplus/pull/1195).

### TLA⁺ Foundation-Funded Updates

Here are things [Andrew Helwer](https://ahelwer.ca/) (author of this post) worked on - all funded by the TLA⁺ Foundation!
- For the [*Create your own TLA⁺ tools*](https://docs.tlapl.us/creating:start) how-to guide, I completed writing the chapter on [functions, operators, and parameters](https://docs.tlapl.us/creating:operators).
  This included a very fun algorithm for enumerating through variable bindings in expressions like `\E x, y \in Nat : P(x, y)`.
  I also finished writing, refining, & testing the code for the very involved chapter on finding next states, and wrote its [first draft](https://docs.tlapl.us/creating:actions).
  TLA⁺ is quite a strange language to interpret!
- Transitioning [TLAPM](https://github.com/tlaplus/tlapm) to use SANY as its parser has [moved to the implementation phase](https://github.com/tlaplus/tlapm/issues/213).
  To prepare, I spent a week working through the book [Real World OCaml](https://dev.realworldocaml.org/) to understand the more advanced parts of the language.
  I also experimented with using [GraalVM Native Images](https://www.graalvm.org/latest/reference-manual/native-image/) to expose a C API from SANY Java code, as a potential alternative to deserializing the syntax tree from SANY's XML output.
  I am currently familiarizing myself with TLAPM parser internals by extending [previous work](https://github.com/tlaplus/tlapm/pull/159) subjecting it to a corpus of standardized syntax tests - previously only in a pass/fail manner - to also check the equivalence of the expected parse tree.
- In the Java-based [core TLA⁺ tools](https://github.com/tlaplus/tlaplus), I fixed some longstanding warnings in the [JavaCC parser generation process](https://github.com/tlaplus/tlaplus/pull/1188), then made some changes to support greater control over SANY's output by [merging the abort & error classes](https://github.com/tlaplus/tlaplus/pull/1194) and appending the error causing an abort to the [thrown exception](https://github.com/tlaplus/tlaplus/pull/1197).

The TLA⁺ Foundation also funded a new research-oriented grant to [Ian Dardik](https://iandardik.github.io/), a Software Engineering PhD student at Carnegie Mellon University.
In his own words, here is the problem the grant is funding him to solve:

>Showing that a TLA+ specification is safe (e.g., satisfies an invariant) is usually done through model checking.
However, for specifications that are infinite-state or parameterized, one must find an inductive invariant to prove safety.
Inductive invariant inference — the task of automatically finding an inductive invariant — is an important, tough, and consequently a well-studied research area.
Past research papers propose techniques that can find more complex inductive invariants for more complex specifications.
In this grant, however, we propose a new compositional technique for finding inductive invariants, in which we aim to find multiple smaller local inductive invariants.
At a high level, we perform four steps: (1) decompose a specification into components, (2) write an assume-guarantee contract for each component, (3) infer a local inductive invariant for each contract, and then finally (4) stitch the local inductive invariants together to create a global one.
A key part of this process is finding an assume-guarantee contract for each component in step (2); we also are building tooling for this step as part of this grant.

### Newbie Corner

Here we highlight an issue that would be a good choice for new contributors!
Before starting work, be sure to read the [contribution guidelines](https://github.com/tlaplus/tlaplus/blob/master/CONTRIBUTING.md) and discuss your planned approach with maintainers.

This month, it's about emitting a different exit code when the TLC model checker finds a liveness property counter-example that ends in stuttering, versus when the counter-example ends in a multi-state infinite loop.
This would be helpful for the growing number of programs which iteratively run TLC & consume its output.
You can find & begin discussing the feature proposal [here](https://github.com/tlaplus/tlaplus/issues/1041).

Issues highlighted in past months have also yet to be claimed!
 - May 2025: [Handle contraints like `<<y>>' = <<y>>`](blog/2025-05-dev-update/#newbie-corner)
 - April 2025: [PlusCal translates to invalid TLA⁺ if procedure identifier is too long](blog/2025-04-dev-update/#newbie-corner)
 - March 2025: [interpret expressions of the form `x' ⊆ S`](blog/2025-03-dev-update/#newbie-corner)
 - February 2025: [interpret expressions of the form `CHOOSE x : x ∈ S`](blog/2025-02-dev-update/#newbie-corner)

New contributor [Max Moiseev](https://github.com/moiseev) took a crack at the issue highlighted in the December 2024 newsletter on [adding parser support for backticks in strings](blog/2024-12-dev-update/#newbie-corner).
It turned out to be much more complicated than expected!
SANY *does* already support backticks in strings, but they have to be balanced by apostrophes; these are translated into UK English-style inverted commas by the `tla2tex` tool.
Astonishingly this also uncovered that SANY (probably unintentionally) supports multi-line strings!
So what was thought to be a simple beginner issue ended up being brought before [the TLA⁺ Specification Language Committee](https://github.com/tlaplus/rfcs/issues/25) to decide what TLA⁺ should actually do here.
I try to find easy issues but you just never know in software development!

