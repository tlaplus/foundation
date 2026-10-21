+++
title = "High-level TLA+ specifications for the five consistency levels offered by Azure Cosmos DB"
+++

#### Murat Demirbas
##### Microsoft
 
Customers of Azure Cosmos DB can associate any number of Azure regions (50+ at the time of writing) to their Cosmos database, at any time. The clients can read and write locally with any of the regions associated with the given Cosmos database. For the read operations, Cosmos DB allows developers to choose between five well-defined consistency models along the consistency spectrum – strong, bounded staleness, session, consistent prefix and eventual.

Since describing the consistency levels in English is prone to errors due to the ambiguity of natural language and generalizations involved, we provide TLA+ specifications of these consistency levels. The specifications we provide focus on the clients' interactions with their globally distributed Cosmos DB database as a single logical entity by performing writes and reads, based on the consistency level specified. We refrain from modeling the Cosmos DB internals, and model a user's Cosmos DB database as a single system image, abstracting away the underlying global distribution/replication among the regions. 

To simplify the exposition of the consistency guarantees given to the clients, we provide three simple scenarios accompanied by their TLA+ specifications. The first two, we consider a single client interacting with the Cosmos database. In the final example (the general model), we present our TLA+/PlusCal specification of the general model of Cosmos DB, where multiple clients across different regions put Cosmos DB to the test with respect to the consistency guarantees it provides in the presence of concurrent read and writes.
