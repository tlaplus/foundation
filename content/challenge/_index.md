+++
title = "GenAI-accelerated TLA+ challenge"
menu = "main"
menuPre = "<i class='fa-solid fa-trophy'></i> "
date = 2025-05-03
weight = 4
+++


{{< figure src="banner.png" alt="My image description" >}}


###### 🏆 **Announcement: Winners of the 2025 TLAi+ Challenge**

<span style="font-size: 20px;">

The TLA+ Foundation, in collaboration with [NVIDIA](https://www.nvidia.com/en-us/), is pleased to announce the winners of the first GenAI-accelerated TLA+ Challenge—an open call for submissions showcasing creative and technically impressive work at the intersection of TLA+, formal methods, and AI-assisted development.

</span>

###### **🥇 First Place — Specula *(Code → Spec)***

<span style="font-size: 1.3em;">

[Specula](https://github.com/specula-org/Specula), developed by [Qian Cheng](https://github.com/Qian-Cheng-nju), [Dr. Tianyin Xu](https://siebelschool.illinois.edu/about/people/faculty/tyxu), and [Dr. Yu Huang](https://cs.nju.edu.cn/yuhuang/), is an open-source framework that automatically derives TLA+ specifications from source code and checks them against the implementation. It combines an LLM-based generator with a Control Flow Analyzer to ensure syntactic and structural correctness, then uses trace validation to semantically align the spec and the implementation. Demonstrated on etcd’s Raft (Go) and Asterinas’s SpinLock (Rust), Specula offers a reproducible path toward scaling automated specification to broader codebases and abstracting algorithmic intent.

**Award**: [Nvidia GeForce RTX 5090](https://www.nvidia.com/en-us/geforce/graphics-cards/50-series/rtx-5090/) (sponsored by NVIDIA)

</span>

###### **🥈 Second Place — Andrew Helwer *(LLM Token Restriction)***

<span style="font-size: 1.3em;">

[Andrew](https://ahelwer.ca) tested whether [local LLMs can be constrained to produce valid TLA+](https://codeberg.org/tlaplus/tla-constrain-llm) by restricting token generation. Using LlamaCpp’s GBNF syntax (context-free) and the Guidance framework (context-sensitive), he showed that grammar-based constraints can reliably enforce syntax and, in some cases, symbol definition. Adding TLA+ documentation to prompts improved results, and the language’s explicit symbol declarations make it well-suited to such constraints. This approach could complement or even surpass fine-tuning for niche languages.

**Award**: One-year single seat, individual subscription to [Github Copilot Pro+](https://github.com/github-copilot/pro-plus) (sponsored by the TLA+ Foundation)

</span>

###### **🥉 Third Place — Gregory Terzian *(Spec → Code)***

<span style="font-size: 1.3em;">

[Gregory](https://github.com/gterzian) explored using [TLA+ as a blueprint for generating idiomatic, multithreaded Rust code](https://github.com/gterzian/_refinement). By applying TLA+’s refinement process in stages, the LLM is guided toward correct and efficient implementations, avoiding the ambiguity of natural language instructions. If this approach were combined with new TLA+ MCP server integrations, it could pave the way to fully verified, spec-driven code generation.

**Award**: One-year single seat, individual subscription to [Github Copilot Pro](https://github.com/github-copilot/pro) (sponsored by the TLA+ Foundation)

</span>

###### 🙏 **Acknowledgements**

<span style="font-size: 1.3em;">

We warmly thank all participants for their submissions. The challenge was made possible thanks to NVIDIA and the TLA+ Foundation, whose generous sponsorship funded the prizes. We also invite other companies to consider donating prizes for future challenges to help grow the TLA+ ecosystem.  For those with larger, longer-term projects in mind, remember that the [TLA+ Grants Program](https://foundation.tlapl.us/grants/index.html) is open for proposals year-round.

</span>


-------------------------

<p style="text-align: center;">The rest of this page is retained in its original form, preserved for posterity.</p>



#### **Example Project Areas**

{{< youtube id="JX_kTGHoYT8" autoplay=true loop=true controls=false >}}

Participants may submit work including, but not limited to:

* Intelligent refactoring of TLA+ specifications (e.g., managing `UNCHANGED` correctly when adding variables)
* LLM-enhanced linters, formatters, or other development tools
* LLM-driven tools for automated grading in education
* Visualizations of specifications or execution traces
* Generation of type annotations for tools like Apalache
* Synthesis of inductive invariant candidates, validated via [TLC](https://github.com/tlaplus/tlaplus) or [Apalache](https://github.com/apalache-mc/apalache/)
* Synthesis of [TLAPS](https://github.com/tlaplus/tlapm) proofs
* Synthesis of entire specifications from source code and design documents

#### **Evaluation**

Submissions will be judged by the **TLA+ Specification Language Committee (SLC)**

The Jury will evaluate submissions based on their functionality, relevance to the TLA+ ecosystem, and the thoughtful use of AI. Submissions must be reproducible by the Jury. Passive formats, such as videos alone, are not sufficient. However, the Jury does not require a fully polished product—a prototype is sufficient. All submissions must be released under the [MIT license](https://opensource.org/license/mit), and any underlying AI models must be publicly available.

The use of GenAI/LLMs is explicitly encouraged, provided that any AI-generated content—such as specs, invariants, visualizations, … —is checked using some form of verification such as the TLA+ tools.

{{% notice style="accent" title="" icon="bullhorn" %}}
Catch the [live announcement](https://youtu.be/oFfTuHuTnVw) at the [TLA+ Community Event 2025](https://conf.tlapl.us/2025-etaps)!
{{% /notice %}}

{{< youtube id="oFfTuHuTnVw" autoplay=false loop=true controls=true >}}


#### **Participation Criteria**

Eligible participants must meet the following:

* Prior engagement with the TLA+ community (e.g., contribution to [mailing lists](https://groups.google.com/g/tlaplus), [forums](https://www.reddit.com/r/tlaplus/), [open-source repositories](https://github.com/tlaplus/), [conference presentations](https://conf.tlapl.us/), or [academic publications](https://scholar.google.com/scholar?q=TLA%2B))
* Must not be a member of the TLA+ Foundation Board or Specification Language Committee
* Must not be subject to any legal, contractual, export control, or jurisdictional restrictions that would preclude participation

#### **Submission Timeline & Announcement**

Submissions will open alongside this announcement. The deadline to submit entries for the challenge is *July 3, 2025*. Submissions must be sent to genai@tlapl.us. The jury will select the winner one month after the submission period closes. We welcome innovative, technically robust, and practically valuable contributions that explore and expand the potential of GenAI within the context of TLA+. 

For longer-term or foundational engineering and research efforts related to TLA+, we encourage you to explore the [TLA+ grant program](../grants/2024-grant-program/).

<!-- https://gohugo.io/shortcodes/youtube/ -->
<!-- https://docs.google.com/document/d/1QYpQQlgNJ-JHqM-GAfE9cEZt7bQaARgIc5qmbiuEKK4/edit?usp=sharing -->
