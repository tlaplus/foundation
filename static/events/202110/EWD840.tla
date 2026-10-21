------------------------------- MODULE EWD840 -------------------------------
(***************************************************************************)
(* TLA+ specification of an algorithm for distributed termination          *)
(* detection on a ring, due to Dijkstra, published as EWD 840:             *)
(* Derivation of a termination detection algorithm for distributed         *)
(* computations (with W.H.J.Feijen and A.J.M. van Gasteren).               *)
(***************************************************************************)
EXTENDS Naturals

CONSTANT N
ASSUME NAssumption == N \in Nat \ {0}

VARIABLES active, color, tpos, tcolor

Nodes == 0 .. N-1
Color == {"white", "orange"}

TypeOK ==
  /\ active \in [Nodes -> BOOLEAN]    \* status of nodes (active or passive)
  /\ color \in [Nodes -> Color]       \* color of nodes
  /\ tpos \in Nodes                   \* token position
  /\ tcolor \in Color                 \* token color

(***************************************************************************)
(* Initially the token is orange. The other variables may take any         *)
(* "type-correct" values.                                                  *)
(***************************************************************************)
Init ==
  /\ active \in [Nodes -> BOOLEAN]
  /\ color \in [Nodes -> Color]
  /\ tpos \in Nodes
  /\ tcolor = "orange"

(***************************************************************************)
(* Node 0 may initiate a probe when it has the token and when either it is *)
(* orange or the token is orange. It passes a white token to node N-1 and  *)
(* paints itself white.                                                    *)
(***************************************************************************)
InitiateProbe ==
  /\ tpos = 0
  /\ tcolor = "orange" \/ color[0] = "orange"
  /\ tpos' = N-1
  /\ tcolor' = "white"
  /\ active' = active
  /\ color' = [color EXCEPT ![0] = "white"]

(***************************************************************************)
(* A node i different from 0 that possesses the token may pass it to node  *)
(* i-1 under the following circumstances:                                  *)
(*   - node i is inactive or                                               *)
(*   - node i is colored orange or                                         *)
(*   - the token is orange.                                                *)
(* Note that the last two conditions will result in an inconclusive round, *)
(* since the token will be orange. The token will be stained if node i is  *)
(* orange, otherwise its color is unchanged. Node i will be made white.    *)
(***************************************************************************)
PassToken(i) == 
  /\ tpos = i
  /\ ~ active[i] \/ color[i] = "orange" \/ tcolor = "orange"
  /\ tpos' = i-1
  /\ tcolor' = IF color[i] = "orange" THEN "orange" ELSE tcolor
  /\ active' = active
  /\ color' = [color EXCEPT ![i] = "white"]

(***************************************************************************)
(* token passing actions controlled by the termination detection algorithm *)
(***************************************************************************)
System == InitiateProbe \/ \E i \in Nodes \ {0} : PassToken(i)

(***************************************************************************)
(* An active node i may activate another node j by sending it a message.   *)
(* If j>i (and i may therefore activate a node that the token has already  *)
(* passed), then node i becomes orange.                                    *)
(***************************************************************************)
SendMsg(i) ==
  /\ active[i]
  /\ \E j \in Nodes \ {i} :
        /\ active' = [active EXCEPT ![j] = TRUE]
        /\ color' = [color EXCEPT ![i] = IF j>i THEN "orange" ELSE @]
  /\ UNCHANGED <<tpos, tcolor>>

(***************************************************************************)
(* Any active node may become inactive at any moment.                      *)
(***************************************************************************)
Deactivate(i) ==
  /\ active[i]
  /\ active' = [active EXCEPT ![i] = FALSE]
  /\ UNCHANGED <<color, tpos, tcolor>>

(***************************************************************************)
(* actions performed by the underlying algorithm                           *)
(***************************************************************************)
Environment == \E i \in Nodes : SendMsg(i) \/ Deactivate(i)

(***************************************************************************)
(* next-state relation: disjunction of above actions                       *)
(***************************************************************************)
Next == System \/ Environment

vars == <<active, color, tpos, tcolor>>

Spec == Init /\ [][Next]_vars /\ WF_vars(System)

-----------------------------------------------------------------------------

(***************************************************************************)
(* Non-properties, useful for validating the specification with TLC.       *)
(***************************************************************************)
TokenAlwaysorange == tcolor = "orange"

NeverChangeColor == [][ UNCHANGED color ]_vars

(***************************************************************************)
(* Main safety property: if there is a white token at node 0 then every    *)
(* node is inactive.                                                       *)
(***************************************************************************)
terminated == \A i \in Nodes : ~ active[i]

terminationDetected ==
  /\ tpos = 0 /\ tcolor = "white"
  /\ color[0] = "white" /\ ~ active[0]

TerminationDetection == terminationDetected => terminated 

(***************************************************************************)
(* Liveness property: termination is eventually detected.                  *)
(***************************************************************************)
Liveness == terminated ~> terminationDetected

(***************************************************************************)
(* The following property asserts that when every process always           *)
(* eventually terminates then eventually termination will be detected.     *)
(* It does not hold since processes can wake up each other.                *)
(***************************************************************************)
FalseLiveness ==
  (\A i \in Nodes : []<> ~ active[i]) ~> terminationDetected

(***************************************************************************)
(* The following property says that eventually all nodes will terminate    *)
(* assuming that from some point onwards no messages are sent. It is       *)
(* not supposed to hold: any node may indefinitely perform local           *)
(* computations. However, this property holds if the fairness condition    *)
(* WF_vars(Next) is used instead of WF_vars(System) that only assumes      *)
(* fairness of the actions controlled by the algorithm.                    *)
(***************************************************************************)
SpecWFNext == Init /\ [][Next]_vars /\ WF_vars(Next)
AllNodesTerminateIfNoMessages ==
  (<>[][\A i \in Nodes : ~ SendMsg(i)]_vars) => <>terminated

(***************************************************************************)
(* Dijkstra's inductive invariant                                          *)
(***************************************************************************)
Inv == 
  \/ P0:: \A i \in Nodes : i > tpos => ~ active[i]
  \/ P1:: \E j \in 0 .. tpos : color[j] = "orange"
  \/ P2:: tcolor = "orange"

(***************************************************************************)
(* Use the following specification to let TLC check that the predicate     *)
(* TypeOK /\ Inv is inductive for EWD 840: verify that it is an            *)
(* (ordinary) invariant of a specification obtained by replacing the       *)
(* initial condition by that conjunction.                                  *)
(***************************************************************************)
CheckInductiveSpec == TypeOK /\ Inv /\ [][Next]_vars

-----------------------------------------------------------------------------
(***************************************************************************)
(* EWD840 implements termination detection in a synchronous ring.          *)
(***************************************************************************)
TD == INSTANCE SyncTerminationDetection

THEOREM Spec => TD!Spec
=============================================================================
\* Modification History
\* Last modified Fri Oct 08 13:49:50 CEST 2021 by merz
\* Created Mon Sep 09 11:33:10 CEST 2013 by merz
