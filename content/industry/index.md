+++
title = "Industrial Use of TLA⁺"
menu = "main"
menuPre = "<i class='fa-solid fa-users'></i> "
weight = 3
+++

## Introduction

*Originally written by Leslie Lamport, sourced from [here](https://lamport.azurewebsites.net/tla/industrial-use.html).*

It's hard to find out about the use of TLA⁺ in industry.
Companies usually don't talk about their engineering process, and any specifications they write are almost always proprietary.
I happened to have contacts at Intel and Amazon who were willing to describe how they used TLA⁺, and Amazon even published a couple of papers about it.
And of course, I know about much of the TLA⁺ use at Microsoft.
I learned about its use in building OpenComRTOS after its developers published a book about it.
The Other Use section below describes a few smaller examples of TLA⁺ use that I've learned about.

Examples can be added to this page by [opening a pull request on GitHub](https://github.com/tlaplus/foundation/pulls) or emailing foundation@tlapl.us.

## Intel

TLA⁺ was first used in industry to model hardware.
Hardware engineers are highly motivated to eliminate bugs, and they understand that this requires thinking hard about what they're building before they begin implementing it in silicon.

The early use of TLA⁺ at Intel is described in [this section](https://lamport.azurewebsites.net/tla/intel-excerpt.html?back-link=industrial-use.html?unhideBut@EQhide-intel@AMPunhideDiv@EQintel) of a paper, written in 2002.
It provides an excellent account of how TLA⁺ fit into their design process.

A picture of TLA⁺ use in 2008 is provided by the paper:
>[**Pre-RTL formal Verification: An Intel Experience**](https://dl.acm.org/citation.cfm?id=1391675)
>
> Robert Beers
>
> DAC '08: Proceedings of the 45th annual Design Automation Conference, Pages 806-822

It explains how a formal verification (FV) team used TLA⁺ in a project to design and implement a new cache-coherence protocol for a processor chip.
The team validated the protocol and parts of the register transfer language (RTL) implementation.
Here is an excerpt from that paper that describes the results of the pre-RTL FV effort.

>The FV team filed 45 "issues" that the project used before RTL to track engineering problems requiring special attention to solve.
A design lead for one of the verified microarchitectures, when asked for about the FV work, said, "They found hundreds of bugs before RTL and played an important role in creating a stable microarchitecture."
This microarchitecture had the lowest ratio of bugs per line of RTL even though the unit was new.
On RTL and silicon there have been no coherence protocol or architecture feature bugs.
In the areas covered by pre-RTL FV, only one microarchitecture bug has been found on silicon, attributed to accepting an unfounded claim that the affected logic would never interact with particular microarchitecture protocols.

TLA⁺ was still being used at Intel in 2014, but I have no information about what has happened there since then.

## Amazon

Amazon Web Services (AWS) has been using TLA⁺ since 2011.
In April, 2015, six engineers published an article describing how it was introduced to AWS and how it was being used there.
Here are the "key insights" listed in the article.
 - Formal methods find bugs in system designs that cannot be found through any other technique we know of.
 - Formal methods are surprisingly feasible for mainstream software development and give good return on investment.
 - At Amazon, formal methods are routinely applied to the design of complex real-world software, including public cloud services.

This article provides an excellent picture of TLA⁺ use in an industrial environment, describing its benefits and what it can't do.
A highly abridged version of the article, a pointer to the complete article, and a pointer to another article about TLA⁺ use at Amazon can be found [here](https://lamport.azurewebsites.net/tla/amazon-excerpt.html?back-link=industrial-use.html?unhideBut@EQhide-amazon@AMPunhideDiv@EQamazon).
James Hamilton has a [blog post](https://perspectives.mvdirona.com/2014/07/challenges-in-designing-at-scale-formal-methods-in-building-robust-distributed-systems/) and Tim Rath gave a [lecture](https://www.infoq.com/presentations/aws-testing-tla) about the use of TLA⁺ at AWS.

Here is what Chris Newcombe, the lead author of the articles, has written [elsewhere](https://groups.google.com/forum/#!searchin/tlaplus/professional$20career/tlaplus/ZJCi-UF31fc/Mawvwi6U1CYJ):

>TLA⁺ is the most valuable thing that I've learned in my professional career.
It has changed how I work, by giving me an immensely powerful tool to find subtle flaws in system designs.
It has changed how I think, by giving me a framework for constructing new kinds of mental-models, by revealing the precise relationship between correctness properties and system designs, and by allowing me to move from `plausible prose' to precise statements much earlier in the software development process.

## Microsoft

TLA⁺ was used sporadically at Microsoft beginning around 2004.
Here is one of those uses as reported by the late [Chuck Thacker](https://en.wikipedia.org/wiki/Charles_P._Thacker).

>During the development of the Xbox 360, I was working with the engineering group on the memory coherence protocol.
Working with an intern, we were developing a TLA⁺ model for the protocol.
In the course of this, we discovered a very subtle bug.
We reported it to IBM, and they told us it couldn't happen.
A couple of weeks later, they relented and told us that not only was the bug real, but that their regression tests wouldn't have found it.
Had they not fixed it, they would have shipped us chips that would have deadlocked after about four hours of use.
Had this [occurred], the schedule for a Christmas launch would almost certainly have been missed.

Starting around 2015, use at Microsoft increased — especially in Azure, Microsoft's cloud service.
Here are some abridged and lightly edited descriptions of TLA⁺ use written by members of the Azure team.
Some of the TLA⁺ specifications mentioned were actually written in PlusCal.

Albert Greenberg, Corporate Vice President of Azure Networking, writes:

>Our engineering process moves validation as early as possible in the engineering lifecycle — we strive to detect errors sooner to reduce risk, increase agility, and provide fast feedback to developers.
Among the key tools we use is the TLA⁺ specification language — enabling us to describe our components formally with simple mathematics, with as little overhead as possible beyond what is needed to write the mathematics precisely.
>
>We have found TLA⁺ especially well-suited for writing high-level specifications of concurrent and distributed systems: concretely defining the problem, providing a specification close to the desired implementation, and proving that successive refinements implement the specification — or else finding the flaws and correcting the design.
Among the projects in Azure Networking where we have applied TLA⁺ are Azure DNS (record propagation), RingMaster (distributed global replication and checkpoint coordination), Distributed Load Shedding, and Macsec (encryption key rollover orchestration).
For example, in RingMaster, we identified a bug that showed up in intermittent failures of unit tests but was devilishly hard to localize in the code.
We wrote a specific TLA⁺ specification of the desired behavior, quickly found the bug in the logical design, and fixed the code.

Dharma Shukla, Microsoft Technical Fellow, writes this about TLA⁺ use in Azure Cosmos DB, Microsoft's globally distributed database service:

>The Cosmos DB engineering team have been using TLA⁺ for specifying and validating the correctness of the core algorithms as well as the high-level specifications of the five consistency models that the system offers to our customers.
We have found TLA⁺ extremely useful in two fundamental ways:
> 1. For designing distributed algorithms.
     For example, while designing the algorithm for the multi-location write capability, we found a critical correctness bug that violated an important safety property of the system.
     The bug was found while writing the TLA⁺ spec, and we were able to correct the issue before writing a single line of code.
> 2. Precisely specifying the guarantees provided by an algorithm or system.
     For example, Cosmos DB has used TLA⁺ to specify the guarantees provided by the five consistency models the service offers to its users.
     These specifications are made available to our users.

Cheng Huang, Principle Software Engineer Manager, writes:

>TLA⁺ uncovered a safety violation even in our most confident implementation.
We had a lock-free data structure implementation which was carefully design & implemented, went through thorough code review, and was tested under stress for many days.
As a result, we had high confidence about the implementation.
We eventually decided to write a TLA⁺ spec, not to verify correctness, but to allow team members to learn and practice PlusCal.
So, when the model checker reported a safety violation, it really caught us by surprise.
This experience has become the aha moment for many team members and their de facto testimonial about TLA⁺.
>
>Our system manages many Paxos rings and dynamically reconfigures these rings on the fly.
TLA⁺ helped us realize that getting this correct is way more subtle than it appears.
We were very glad to have uncovered a safety violation which would have caused data loss (for customers) upon a specific ordered sequence of events during the recovery from a power failure.
We couldn't imagine that this would have been discovered through any of our testing efforts.
>
>TLA⁺ is not yet a prerequisite for our hiring.
However, a candidate's knowledge of TLA⁺ is given significant weight in our evaluation.
To us, it is a great indicator of those who really care about quality and correctness.

## MongoDB

MongoDB has applied TLA⁺ to core protocols within the MongoDB database over several years, as early as 2015, including distributed replication, dynamic reconfiguration, and distributed transactions. These are complex and highly concurrent protocols and systems, where testing alone is often not sufficient to catch and reproduce subtle design bugs.

MongoDB engineers [emphasized](https://youtu.be/x9zSynTfLDE?feature=shared&t=73) the value derived from TLA⁺ in their experience specifying and model checking their core consensus protocol:

> Without a formal model, it’s nearly impossible to get a complex distributed protocol right. TLA⁺ and TLC are tools that make this possible for practicing software engineers...Even very simple and abstract models can help catch non-trivial bugs.

They also noted the value of these tools for accelerating rigorous design of complex protocols, 
specifically during their [development of a novel dynamic reconfiguration protocol](https://www.mongodb.com/company/blog/technical/rapid-prototyping-safe-logless-reconfiguration-protocol-mongodb-tla-plus):


> Model checking is an excellent tool for rapidly and precisely answering "what if" design questions. Our efforts also emphasized an important feature of lightweight, design-level formal methods techniques, which is about more than simply ensuring correctness of your system design. Rather, it enables the exploration of protocol optimizations at a level of aggressiveness and velocity that would typically be infeasible with manual design methods. From this perspective, we can view these formal methods tools as not only a means for improving correctness of our systems and protocols, but as a means for efficient exploration of the optimization design space while maintaining a high correctness bar.

They have also employed TLA⁺ for model-based trace checking and for modular specification and model-based verification of distributed transactions, writing about their experiences in several papers:

> [**Extreme Modeling in Practice**](https://dl.acm.org/doi/10.14778/3397230.3397233)
> 
> A. Jesse Jiryu Davis, Max Hirschorn, Judah Schvimer, VLDB 2020
>
> [**Fault-Tolerant Replication with Pull-Based Consensus in MongoDB**](https://www.usenix.org/conference/nsdi21/presentation/zhou)
> 
> Siyuan Zhou, Shuai Mu, NSDI 2021
> 
> [**Design and Modular Verification of Distributed Transactions in MongoDB**](https://www.vldb.org/pvldb/vol18/p5045-schultz.pdf)
> 
> William Schultz, Murat Demirbas, VLDB 2025


## OpenComRTOS

The European Space Agency's *Rosetta* spacecraft, which flew to a comet, used a real-time operating system called *Virtuoso* to control some of its instruments.
The next version of that operating system, called *OpenComRTOS*, was developed using TLA⁺ as described in this book:

> [**Formal Development of a Network-Centric RTOS**](https://www.springer.com/gp/book/9781441997357)
>
> Eric Verhulst, Raymond T. Boute, José Miguel Sampaio Faria, Bernard H. C. Sputh, and Vitaliy Mezhuyev
>
> Springer, 2011

Eric Verhulst, the head of the group that developed OpenComRTOS, wrote this in an email to me:

>The [TLA⁺] abstraction helped a lot in coming to a much cleaner architecture (we witnessed first hand the brain washing done by years of C programming).
One of the results was that the code size is about 10x less than [in Virtuoso].

## Other Use

I have seen a number of reports of TLA⁺ (and PlusCal) being used in real life.
Some have been sent to me; some I found by simply searching the web for "TLA⁺".
Here are a few of them.

A web posting titled [Model Checking for the Working Man (m/f)](http://rix0r.nl/essays/2015/08/25/model-checking-for-the-working-man-mf/) by a programmer identified only as *Rico* describes how he was led to try TLA⁺ for the first time, and his experience using it.
Here is a brief extract.

> What I was expecting was to wrestle with this for a good couple of days, but actually this tool chain is so easy to get started with, I got our algorith[m] modeled, the problem detected and the solution verified, all within half a day!
>
> Let me say that again: TLA⁺ is fantastically easy to use!
>
> ... This tool is so easy to use and so effective, you can’t afford to not use it in your development cycle somewhere.

By "TLA⁺" he meant PlusCal.
It's not as easy to solve a real problem with TLA⁺ when you start by knowing nothing about it, and he found TLA⁺ to be "cumbersome".
But it's worth learning TLA⁺ if you're building a complex distributed system.

[Hacker News](https://news.ycombinator.com/) has a [web page about TLA⁺](https://news.ycombinator.com/item?id=9601770).
Here is part of a posting on it from 8 July 2015:

> One of my coworkers fleshed out an important and complex component that absolutely had to be logically correct, by using TLA⁺ modelling.
It was the first time he'd used TLA⁺ ... at all, and it took a bit of experimenting to get used to it, but he soon generated a solid logical model and exposed a number of fringe flaws in the original proposed solution.
>
> From TLA⁺ model to completed Java application took very little time at all, the logic was all there already, it just needed [to be] fleshed out in the language.
It was also easy to split the work out amongst multiple programmers.
He's argued that the total time, including learning TLA⁺, took less time than writing the application from scratch in Java and discovering the bugs as they went along.

In November, 2016, Bogdan Munteanu sent me email describing TLA⁺ use at Dropbox.
Here is an extract from that email.

>[An] engineer decided to learn/experiment with [TLA⁺], so I provided some guidance and feedback.
He wrote the formal spec for one of our two-phase commit protocols that we knew would fail in certain real-world situations.
His spec found the issue ... and the engineer found the process extremely valuable.
He mentioned that learning TLA⁺ was not at all a steep curve — it took him longer to understand the actual protocol.
>
>About a month ago, another engineer designed a deadlock detection algorithm for one of the new distributed protocols at Dropbox.
After hearing about the success of the previous TLA⁺ project, he decided to write a spec for this new protocol with the help of the other engineer.
They found a bug in the protocol, fixed it, then confirmed the fix by re-running the model checker.
In both cases the spec was written in PlusCal.
Everyone was really impressed by the results, and for most came as a surprise because few have heard of formal verification before.

In [a TLA⁺ Google group posting](https://groups.google.com/forum/#!topic/tlaplus/unVsjY7Aefc), Hillel Wayne reports this story of [a bug in Elastic Search (ES)](https://github.com/elastic/elasticsearch/issues/31976#ISSUECOMMENT-404722753):

  1. ES has been running in production for a long time.
  2. In March, David Turner wrote a TLA⁺ model and discovered a bug with ES 6.2 that nobody's yet run into.
  3. In April, they preemptively fix the bug and update the version to 6.3.
  4. Two days ago somebody on 6.2.4 reports a bizarre concurrency bug.
  5. After investigation, the source of the bug exactly matches the discovered TLA⁺ edge case.

In his talk [Hardening Kafka Replication](https://kafka-summit.org/sessions/hardening-kafka-replication/) at the Kafka Summit conference in 2018, Jason Gustafson describes his experience using TLA⁺.
Here's what he wrote in an email to me:

> I found four edge cases in the replication protocol that were not understood and could have led to data loss.
Some of these cases were dubious optimizations which I noticed as I was comparing the model with the implementation.
I think there were two cases that were entirely unknown and unexpected.
The most important thing from my perspective was that the model allowed me to validate the fixes.
We had iterated on the protocol for several years, and every time we thought we had fixed all the problems, we found some missed case.
In fact, my own initial attempt to fix the discovered problems suffered from a subtle bug.
I am doubtful we would have caught it until much later if not for the model checking [of the TLA⁺ spec].

