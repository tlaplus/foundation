+++
type = "blog"
title = 'March 2025 Monthly Development Update'
date = 2025-03-15
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

Let's start with some organizational, conference, blog post, and user-side TLA⁺ happenings:
- The [TLA⁺ Community Event 2025](https://conf.tlapl.us/2025-etaps/) will be co-located with [ETAPS 2025](https://etaps.org/2025/) in Hamilton, Ontario, Canada on May 4th, 2025.
  Hope to see you there!
- The TLA⁺ Foundation grant program is continuing on a rolling basis; please [submit a proposal](/grants/2024-grant-program/) if you have ideas to improve TLA⁺ so the Foundation can support you financially as you work on them.
- [Concur 2025](https://conferences.au.dk/confest2025/concur), the 36th International Conference on Concurrency Theory, will take place August 25-30, 2025, at the University of Aarhus, Denmark.
  TLA⁺-related papers are [being solicited](https://groups.google.com/g/tlaplus/c/2k4EJQ-4ZZg/m/NtDIKZmvAQAJ).
  The abstract submission deadline is April 3rd.
- [Hillel Wayne](https://www.hillelwayne.com/) wrote [a post](https://buttondown.com/hillelwayne/archive/five-kinds-of-nondeterminism/) categorizing kinds of nondeterminism commonly encountered or used when formally specifying a system.
- [Marc Brooker](https://brooker.co.za/blog/) and [Ankush Desai](https://ankushdesai.github.io/) published a paper titled [*Systems Correctness Practices at AWS: Leveraging Formal and Semi-formal Methods*](https://dl.acm.org/doi/10.1145/3712057), an update of the now-decade-old paper [*How Amazon Web Services uses formal methods*](https://www.amazon.science/publications/how-amazon-web-services-uses-formal-methods).
  TLA⁺ is mentioned, along with a diverse array of other formal methods tools; there is a clear trend toward use of deterministic simulation testing (in various flavors) to analyze correctness at the implementation level.
- The paper [*Smart Casual Verification of the Confidential Consortium Framework*](https://www.microsoft.com/en-us/research/publication/smart-casual-verification-of-ccfs-distributed-consensus-and-consistency-protocols/) by [Heidi Howard](https://www.microsoft.com/en-us/research/people/heidihoward/), [Markus Kuppe](https://www.microsoft.com/en-us/research/people/makuppe/), [Eddy Ashton](https://www.microsoft.com/en-us/research/people/edashton/), [Amaury Chamayou](https://www.microsoft.com/en-us/research/people/amchamay/), and Natacha Crooks was accepted into [USENIX NSDI 2025](https://www.usenix.org/conference/nsdi25).
  The paper details the method of binding a formal TLA⁺ specification to a C++ implementation of the [Confidential Consortium Framework](https://en.wikipedia.org/wiki/Confidential_Consortium_Framework).

Now on to coding-related community developments:
- [Calvin Loncaric](https://calvin.loncaric.us/) did some work on the Java-based TLA⁺ interpreter, fixing a recently-discovered [bug](https://github.com/tlaplus/tlaplus/issues/1145) occurring when TLA⁺ functions using `EXCEPT` are coerced into sequences, and performing [some refactoring](https://github.com/tlaplus/tlaplus/pull/1148) of lazy evaluation code.
- [Stephan Merz](https://members.loria.fr/SMerz/) fixed a number ([1](https://github.com/tlaplus/Examples/pull/158), [2](https://github.com/tlaplus/Examples/pull/159), [3](https://github.com/tlaplus/Examples/pull/159), [4](https://github.com/tlaplus/Examples/pull/163)) of proofs in the [tlaplus/examples](https://github.com/tlaplus/examples) repository that were failing in the new [rolling TLAPM pre-release](https://github.com/tlaplus/tlapm/releases/tag/1.6.0-pre).
- [William Schultz](https://will62794.github.io/) worked on his web-based [spectacle TLA⁺ interpreter](https://github.com/will62794/spectacle), improving support for lambda operators and module instance variable substitutions; this was motivated by writing a TLA⁺ specification of [MongoDB's distributed cross-shard transaction protocol](https://github.com/muratdem/MDBTLA/tree/f20b65bbaa21f57f9244528fc28d023fb9811317/MultiShardTxn).
- [rozlynd](https://github.com/rozlynd) contributed [a fix](https://github.com/tlaplus/tlapm/pull/202) for a TLAPM soundness bug involving tuples and `EXCEPT` originally reported by [Uğur Yavuz](https://www.uguryav.uz/).
  It's been a rough month for tuples/sequences and the `EXCEPT` keyword!
- [domodwyer](https://github.com/domodwyer) released a [TLA⁺ formatter tool](https://github.com/domodwyer/tlafmt) written in Rust, using the [TLA⁺ tree-sitter grammar](https://github.com/tlaplus-community/tree-sitter-tlaplus) as the parser backend.
  That makes a second TLA⁺ formatting tool in existence, including the [Java-based one](https://github.com/FedericoPonzi/tlaplus-formatter)!
  It is heartening to see a proliferation of community-written development tooling for TLA⁺.
- [s12f](https://github.com/s12f) contributed some fixes for TLA⁺ Unicode tooling, ensuring the TLA⁺ Unicode Converter tool [preserves end-of-file newlines](https://github.com/tlaplus-community/tlauc/pull/20) and activating the TLA⁺ Neovim Plugin when [opening a new file](https://github.com/tlaplus-community/tlaplus-nvim-plugin/pull/6).
- [Ana Catarina Ribeiro](https://github.com/acm-ribeiro) enhanced TLC state graph output by [including model values in transition labels](https://github.com/tlaplus/tlaplus/pull/1147), as part of using TLA⁺ in a [testing strategy for microservices](https://github.com/acm-ribeiro/state-space-graph); the PR was later merged [with modifications by Markus Kuppe](https://github.com/tlaplus/tlaplus/pull/1158).
- Longtime TLA⁺ Tools maintainer [Markus Kuppe](https://github.com/lemmy) fixed & updated a TLA⁺ example for [finitizing monotonic systems](https://github.com/tlaplus/Examples/pull/155), expanded debug logging [when deserializing states in TLC](https://github.com/tlaplus/tlaplus/pull/1155/), expanded TLC debugger support for [expressions as breakpoint filters](https://github.com/tlaplus/tlaplus/pull/1156), and [fixed](https://github.com/tlaplus/vscode-tlaplus/commit/06da33c124260263ddf3ffe8d7b600bbbd886e95) the VS Code TLA⁺ Extension upload process to open-vsx.org.

Finally, things [Andrew Helwer](https://ahelwer.ca/) (author of this post) worked on - all funded by the TLA⁺ Foundation!
- I created a [semantic error test corpus](https://github.com/tlaplus/tlaplus/pull/1140) for TLA⁺, a large set of small TLA⁺ files that should each trigger a specific [standardized parse error](https://github.com/tlaplus/rfcs/issues/15).
  This corpus was developed by finding all locations in the Java-based SANY TLA⁺ parser where a parse error is reported, then attempting to reverse-engineer a parse input triggering that error.
  This greatly improves SANY test coverage, and also serves as an implementation-independent behavior standard for other TLA⁺ parsers to adopt.
- I supported Markus's work on updating the monotonic systems examples by adding some features ([1](https://github.com/tlaplus/Examples/pull/156), [2](https://github.com/tlaplus/Examples/pull/157)) to the TLA⁺ examples automated validation tooling, and also [expanded documentation](https://github.com/tlaplus/Examples/pull/164) to hopefully reduce the difficulty of contributing example specifications.

## Newbie Corner

Here we highlight an issue that would be a good choice for new contributors!
Before starting work, be sure to read the [contribution guidelines](https://github.com/tlaplus/tlaplus/blob/master/CONTRIBUTING.md) and discuss your planned approach with maintainers.

This one is substantial, similar in genre to last month: extending the Java-based TLA⁺ interpreter to handle a wider variety of expressions.
Calvin Loncaric [proposed](https://github.com/tlaplus/tlaplus/issues/336) allowing `\subseteq`/`⊆` in TLA⁺ next-state relations; currently the interpreter only supports the logically-equivalent `∈ SUBSET` operator.
This work could also be easily extended to support the `\subset`/`⊂` operator (without equality).
Similar to last month, the high-level steps required to implement this feature are:
1. Figure out where TLC implements the `∈` functionality for next-state relations, while disallowing operators like `\subseteq`/`⊆`.
1. Modify the logic to translate `⊆` to an execution form equivalent to `∈ SUBSET`.
1. Write tests to validate these changes.

Issues highlighted in past months have also yet to be claimed!
 - February 2025: [interpret expressions of the form `CHOOSE x : x ∈ S`](blog/2025-02-dev-update/#newbie-corner)
 - January 2025: [fix the PlusCal CLI `-labelRoot` option](blog/2025-01-dev-update/#newbie-corner)
 - December 2024: [add parser support for backticks in strings](blog/2024-12-dev-update/#newbie-corner)

