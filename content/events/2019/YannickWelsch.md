+++
title = "Using TLA+ for fun and profit in the development of Elasticsearch"
+++

#### Yannick Welsch
##### Elastic

[Elasticsearch](https://github.com/elastic/elasticsearch) is a distributed search and analytics engine based on [Apache Lucene](https://lucene.apache.org/). Initially
released in 2010, it has quickly become the [most popular](https://db-engines.com/en/ranking/search+engine) enterprise search engine, and
is commonly used for log analytics, full-text search, operational and security intelligence,
business analytics, and metrics use cases. Built as a distributed system since its inception,
Elasticsearch effortlessly scales to clusters of hundreds of servers. As part of a larger
resiliency effort, Elasticsearch’s core cluster coordination and data replication algorithms
have undergone major overhauls in recent years. The use of formal methods, with in
particular [TLA+, PlusCal and the TLC model checker](/), has extensively contributed to
the goal of creating a much safer and resilient system. This presentation will provide an
overview on the various uses of TLA + during the development of Elasticsearch:

* We refined and validated an informal specification of the [data replication algorithm](https://www.elastic.co/blog/elasticsearch-sequence-ids-6-0)
that has been powering Elasticsearch since version 6, released in November 2017, by
creating a [TLA+ specification](https://github.com/elastic/elasticsearch-formal-models/blob/master/data/tla/replication.tla) during the implementation effort. This algorithm, based
on the primary-backup approach, enables high-throughput sharded data ingestion
pipelines and has served as fundational work to build newer features such as [cross-datacenter replication](https://www.elastic.co/blog/follow-the-leader-an-introduction-to-cross-cluster-replication-in-elasticsearch).

* We studied [two](https://github.com/elastic/elasticsearch/pull/28787) [bugs](https://github.com/elastic/elasticsearch/pull/28790) in a highly concurrent component that handles deletion tomb-
stones and out-of-order writes under various optimizations. The implementation was
mapped onto a [PlusCal spec](https://github.com/elastic/elasticsearch-formal-models/blob/master/ReplicaEngine/tla/ReplicaEngine.tla), which, with the use of the TLC model checker, led
us to discover an additional unknown bug in the implementation, which we only
later [observed](https://github.com/elastic/elasticsearch/issues/31976#issuecomment-404722753) in the wild. The [bug fixes](https://github.com/elastic/elasticsearch/pull/29619/files#diff-1a19a661d8e349460d8f8ae99cbe1274R318) were first [prototyped](https://github.com/elastic/elasticsearch-formal-models/pull/29/commits/893a0edbce86b2e114ea59de4170c838024fc6ac) using the PlusCal
specification.

* We designed a [new cluster coordination](https://www.elastic.co/blog/a-new-era-for-cluster-coordination-in-elasticsearch) subsystem and validated it with TLA + before starting off our implementation efforts. This new cluster coordination subsystem
is powering all Elasticsearch clusters since version 7, released in April 2019. The
[TLA+ specification](https://github.com/elastic/elasticsearch-formal-models/blob/ca26d5cb4ce9fd8c8b032a11bc849b52a812b6e5/ZenWithTerms/tla/ZenWithTerms.tla) is modeling the core safety bits of the consensus algorithm with
dynamic reconfiguration. The [implementation](https://github.com/elastic/elasticsearch/blob/a1fcb8a7e6c6880ae72273f7b336450af42aae2b/server/src/main/java/org/elasticsearch/cluster/coordination/CoordinationState.java) of this core safety module has a direct
one-to-one mapping with the TLA + specification.

* Our chaos-monkey style test infrastructure discovered a [bug](https://github.com/elastic/elasticsearch/pull/40519) in the cluster state
storage layer that was related to the atomic persistence of state. This only surfaced
through randomized testing after running for months on our [CI infrastructure](https://elasticsearch-ci.elastic.co/). The
implementation was mapped onto a [TLA+ model](https://github.com/elastic/elasticsearch-formal-models/blob/master/Storage/tla/Storage.tla) to rule out other such bugs. The
TLC model checker was able to find this bug within seconds.

All Elasticsearch TLA + specifications are open-source and publicly available on our [Github repository](https://github.com/elastic/elasticsearch-formal-models), just as the [actual system](https://github.com/elastic/elasticsearch) that is modeled.
