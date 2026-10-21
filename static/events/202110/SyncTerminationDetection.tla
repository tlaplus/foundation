---------------------- MODULE SyncTerminationDetection ----------------------
(***************************************************************************)
(* An abstract specification of the termination detection problem in a     *)
(* ring with synchronous communication.                                    *)
(***************************************************************************)
EXTENDS Naturals
CONSTANT N
ASSUME NAssumption == N \in Nat \ {0}

Nodes == 0 .. N-1

VARIABLES 
  active,               \* activation status of nodes
  terminationDetected   \* has termination been detected?

TypeOK ==
  /\ active \in [Nodes -> BOOLEAN]
  /\ terminationDetected \in BOOLEAN

terminated == \A n \in Nodes : ~ active[n]

(***************************************************************************)
(* Initial condition: the nodes can be active or inactive, termination     *)
(* may (but need not) be detected immediately if all nodes are inactive.   *)
(***************************************************************************)
Init ==
  /\ active \in [Nodes -> BOOLEAN]
  /\ terminationDetected \in {FALSE, terminated}

Terminate(i) ==  \* node i terminates
  /\ active[i]
  /\ active' = [active EXCEPT ![i] = FALSE]
     (* possibly (but not necessarily) detect termination if all nodes are inactive *)
  /\ terminationDetected' \in {terminationDetected, terminated'}

Wakeup(i,j) ==  \* node i activates node j
  /\ active[i]
  /\ active' = [active EXCEPT ![j] = TRUE]
  /\ UNCHANGED terminationDetected

DetectTermination ==
  /\ terminated
  /\ terminationDetected' = TRUE
  /\ UNCHANGED active

Next ==
  \/ \E i \in Nodes : Terminate(i)
  \/ \E i,j \in Nodes : Wakeup(i,j)
  \/ DetectTermination

vars == <<active, terminationDetected>>
Spec == Init /\ [][Next]_vars /\ WF_vars(DetectTermination)

Stable == [](terminationDetected => []terminated)

Live == terminated ~> terminationDetected

=============================================================================
\* Modification History
\* Last modified Sun Jan 10 17:29:24 CET 2021 by merz
\* Created Sun Jan 10 15:19:20 CET 2021 by merz
