--------------------------- MODULE EWD840_proofs ---------------------------
EXTENDS EWD840, TLAPS, NaturalsInduction

(***************************************************************************)
(* TLAPS proofs of the safety and liveness properties of EWD840.           *)
(***************************************************************************)

(***************************************************************************)
(* The algorithm is type-correct: TypeOK is an inductive invariant.        *)
(***************************************************************************)

LEMMA Spec => []TypeOK
<1>1. Init => TypeOK
<1>2. TypeOK /\ [Next]_vars => TypeOK'
<1>3. QED



LEMMA TypeCorrect == Spec => []TypeOK
<1>1. Init => TypeOK
  BY DEF Init, TypeOK, Color
<1>2. TypeOK /\ [Next]_vars => TypeOK'
  <2> SUFFICES ASSUME TypeOK,
                      [Next]_vars
               PROVE  TypeOK'
    OBVIOUS
  <2>. USE NAssumption DEF TypeOK, Nodes, Color
  <2>1. CASE InitiateProbe
    BY <2>1 DEF InitiateProbe
  <2>2. ASSUME NEW i \in Nodes \ {0},
               PassToken(i)
        PROVE  TypeOK'
    BY <2>2 DEF PassToken
  <2>3. ASSUME NEW i \in Nodes,
               SendMsg(i)
        PROVE  TypeOK'
    BY <2>3 DEF SendMsg
  <2>4. ASSUME NEW i \in Nodes,
               Deactivate(i)
        PROVE  TypeOK'
    BY <2>4 DEF Deactivate
  <2>5. CASE UNCHANGED vars
    BY <2>5 DEF vars
  <2>6. QED
    BY <2>1, <2>2, <2>3, <2>4, <2>5 DEF Environment, Next, System
<1>. QED  BY <1>1, <1>2, PTL DEF Spec

(***************************************************************************)
(* Prove the main soundness property of the algorithm by (1) proving that  *)
(* Inv is an inductive invariant and (2) that it implies correctness.      *)
(***************************************************************************)
THEOREM Safety == Spec => []TerminationDetection
<1>. USE NAssumption
<1>1. Init => Inv
  BY DEF Init, Inv, Nodes
<1>2. TypeOK /\ Inv /\ [Next]_vars => Inv'
  BY DEF TypeOK, Inv, Next, vars, Nodes, Color,
         System, Environment, InitiateProbe, PassToken, SendMsg, Deactivate
<1>3. Inv => TerminationDetection
  BY DEF Inv, TerminationDetection, terminated, terminationDetected, Nodes
<1>. QED
  BY <1>1, <1>2, <1>3, TypeCorrect, PTL DEF Spec


(***************************************************************************)
(* Step <1>3 of the above proof shows that Dijkstra's invariant implies    *)
(* TerminationDetection. If you find that one-line proof too obscure, here *)
(* is a more detailed, hierarchical proof of that same implication.        *)
(***************************************************************************)
LEMMA Inv => TerminationDetection
<1>1. SUFFICES ASSUME tpos = 0, tcolor = "white", 
                      color[0] = "white", ~ active[0],
                      Inv
               PROVE  \A i \in Nodes : ~ active[i]
  BY <1>1 DEF TerminationDetection, terminated, terminationDetected
<1>2. ~ Inv!P2  BY tcolor = "white" DEF Inv
<1>3. ~ Inv!P1  BY <1>1 DEF Inv
<1>. QED
  <2>1. Inv!P0  BY Inv, <1>2, <1>3 DEF Inv
  <2>.  TAKE i \in Nodes
  <2>3. CASE i = 0  BY <2>1, <1>1, <2>3
  <2>4. CASE i \in 1 .. N-1
    <3>1. tpos < i  BY tpos=0, <2>4, NAssumption
    <3>2. i < N  BY NAssumption, <2>4
    <3>. QED  BY <3>1, <3>2, <2>1
  <2>. QED  BY <2>3, <2>4 DEF Nodes

-----------------------------------------------------------------------------
(***************************************************************************)
(* The liveness proof.                                                     *)
(* We have to show that after all nodes have terminated, node 0 will       *)
(* eventually detect termination. In order for this to happen, the token   *)
(* will have to perform up to 3 rounds of the ring. The first round simply *)
(* takes it back to node 0, the second round paints all nodes white,       *)
(* while the token may be orange, and the third round verifies that all     *)
(* nodes are still white, so the token returns white.                      *)
(* The proof becomes a little simpler if we set it up as a proof by        *)
(* contradiction and assume that termination will never be declared.       *)
(* In particular, node 0 will then always pass on the token.               *)
(* The formula BSpec gathers all boxed formulas used in the proof.         *)  
(***************************************************************************)
BSpec == /\ []TypeOK 
         /\ [](~terminationDetected) 
         /\ [][Next]_vars
         /\ WF_vars(System)

USE NAssumption

(***************************************************************************)
(* We first establish the enabledness conditions of the action for which   *)
(* fairness is asserted.                                                   *)
(***************************************************************************)

SystemEnabled == 
\/ /\ tpos = 0
   /\ tcolor = "orange" \/ color[0] = "orange"
\/ \E i \in Nodes \ {0} :
      /\ tpos = i
      /\ ~ active[i] \/ color[i] = "orange" \/ tcolor = "orange"

LEMMA EnabledSystem ==
  ASSUME TypeOK
  PROVE  ENABLED <<System>>_vars <=> SystemEnabled
<1>1. System <=> <<System>>_vars
  BY DEF TypeOK, System, vars, InitiateProbe, PassToken, Nodes
<1>2. (ENABLED System) <=> ENABLED <<System>>_vars
  BY <1>1, ENABLEDrules
<1>. QED
  BY <1>2, ENABLEDrewrites DEF System, InitiateProbe, PassToken, SystemEnabled

(***************************************************************************)
(* If all nodes are inactive, the token must eventually arrive at node 0.  *)
(***************************************************************************)
LEMMA TerminationRound1 ==
  BSpec => (terminated ~> (terminated /\ tpos = 0))
<1>. DEFINE P(n) == terminated /\ n \in Nodes /\ tpos = n
            Q == P(0)
            R(n) == BSpec => [](P(n) => <>Q)
<1>1. \A n \in Nat : R(n)
  <2>1. R(0)
    BY PTL
  <2>2. ASSUME NEW n \in Nat
        PROVE  R(n) => R(n+1)
    <3>. DEFINE Pn == P(n)  Pn1 == P(n+1)
    <3>. USE DEF TypeOK, terminated, Nodes
    <3>1. TypeOK /\ Pn1 /\ [Next]_vars => Pn1' \/ Pn'
      BY DEF Next, vars, System, Environment, InitiateProbe, PassToken, Deactivate, SendMsg
    <3>2. TypeOK /\ Pn1 /\ <<System>>_vars => Pn'
      BY DEF System, InitiateProbe, PassToken, vars
    <3>3. TypeOK /\ Pn1 => ENABLED <<System>>_vars
      BY EnabledSystem DEF SystemEnabled
    <3>. HIDE DEF Pn1
    <3>4. R(n) => (BSpec => [](Pn1 => <>Q))
      BY <3>1, <3>2, <3>3, PTL DEF BSpec
    <3>. QED  BY <3>4 DEF Pn1
  <2>. HIDE DEF R
  <2>. QED  BY <2>1, <2>2, NatInduction, Isa
<1>2. BSpec => []((\E n \in Nat : P(n)) => <>Q)
  <2>. HIDE DEF P, Q
  <2>1. BSpec => [](\A n \in Nat : P(n) => <>Q)
    BY <1>1
  <2>2. (\A n \in Nat : P(n) => <>Q) <=> ((\E n \in Nat : P(n)) => <>Q)
    OBVIOUS
  <2>. QED  BY <2>1, <2>2, PTL
<1>3. TypeOK => (terminated => \E n \in Nat : P(n))
  BY DEF terminated, TypeOK, Nodes
<1>. QED  BY <1>2, <1>3, TypeCorrect, PTL DEF BSpec

(***************************************************************************)
(* Moreover, if all nodes are inactive and the token is at node 0 but      *)
(* termination cannot be detected, it will eventually return to node 0     *)
(* in a state where all nodes are white.                                   *)
(***************************************************************************)
allWhite == \A i \in Nodes : color[i] = "white"

LEMMA TerminationRound2 ==
  BSpec => ((terminated /\ tpos = 0)
           ~> (terminated /\ tpos = 0 /\ allWhite))
<1>. DEFINE P(n) == /\ terminated /\ n \in Nodes /\ tpos = n
                    /\ color[0] = "white" 
                    /\ \A m \in n+1 .. N-1 : color[m] = "white"
            Q == P(0)
            R(n) == BSpec => [](P(n) => <>Q)
<1>1. BSpec => ((terminated /\ tpos = 0) ~> \E n \in Nat : P(n))
  <2>. DEFINE S == terminated /\ tpos = 0
              T == P(N-1)
  <2>. USE DEF TypeOK, terminated, Nodes
  <2>1. TypeOK /\ S /\ [Next]_vars => S' \/ T'
    BY DEF Next, vars, System, Environment, InitiateProbe, PassToken, Deactivate, SendMsg
  <2>2. TypeOK /\ S /\ <<System>>_vars => T'
    BY DEF System, InitiateProbe, PassToken, vars
  <2>3. TypeOK /\ ~terminationDetected /\ S => ENABLED <<System>>_vars
    BY EnabledSystem DEF SystemEnabled, terminationDetected, Color
  <2>4. T => \E n \in Nat : P(n)
    BY N-1 \in Nat
  <2>. HIDE DEF T
  <2>5. QED  BY <2>1, <2>2, <2>3, <2>4, PTL DEF BSpec
<1>2. \A n \in Nat : R(n)
  <2>1. R(0)
    BY PTL
  <2>2. ASSUME NEW n \in Nat
        PROVE  R(n) => R(n+1)
    <3>. DEFINE Pn == P(n)  Pn1 == P(n+1)
    <3>. USE DEF TypeOK, terminated, Nodes
    <3>1. TypeOK /\ Pn1 /\ [Next]_vars => Pn1' \/ Pn'
      BY DEF Next, vars, System, Environment, InitiateProbe, PassToken, Deactivate, SendMsg
    <3>2. TypeOK /\ Pn1 /\ <<System>>_vars => Pn'
      BY DEF System, InitiateProbe, PassToken, vars
    <3>3. TypeOK /\ Pn1 => ENABLED <<System>>_vars
      BY EnabledSystem DEF SystemEnabled
    <3>. HIDE DEF Pn1
    <3>4. R(n) => (BSpec => [](Pn1 => <>Q))
      BY <3>1, <3>2, <3>3, PTL DEF BSpec
    <3>. QED  BY <3>4 DEF Pn1
  <2>. HIDE DEF R
  <2>. QED  BY <2>1, <2>2, NatInduction, Isa
<1>3. BSpec => []((\E n \in Nat : P(n)) => <>Q)
  <2>. HIDE DEF P, Q
  <2>1. BSpec => [](\A n \in Nat : P(n) => <>Q)
    BY <1>2
  <2>2. (\A n \in Nat : P(n) => <>Q) <=> ((\E n \in Nat : P(n)) => <>Q)
    OBVIOUS
  <2>. QED  BY <2>1, <2>2, PTL
<1>4. Q => terminated /\ tpos = 0 /\ allWhite
  BY DEF allWhite, Nodes
<1>. QED  BY <1>1, <1>3, <1>4, PTL

(***************************************************************************)
(* Finally, if all nodes are inactive and white, and the token is at       *)
(* node 0, eventually a white token will be at node 0 while all nodes are  *)
(* still white.                                                            *)
(***************************************************************************)
LEMMA TerminationRound3 ==
  BSpec => (terminated /\ tpos = 0 /\ allWhite) ~> terminationDetected
<1>. DEFINE P(n) == /\ terminated /\ n \in Nodes /\ tpos = n
                    /\ allWhite /\ tcolor = "white"
            Q == P(0)
            R(n) == BSpec => [](P(n) => <>Q)
<1>1. BSpec => ((terminated /\ tpos = 0 /\ allWhite) ~> \E n \in Nat : P(n))
  <2>. DEFINE S == terminated /\ tpos = 0 /\ allWhite
              T == P(N-1)
  <2>. USE DEF TypeOK, terminated, Nodes, allWhite
  <2>1. TypeOK /\ S /\ [Next]_vars => S' \/ T'
    BY DEF Next, vars, System, Environment, InitiateProbe, PassToken, Deactivate, SendMsg
  <2>2. TypeOK /\ S /\ <<System>>_vars => T'
    BY DEF System, InitiateProbe, PassToken, vars
  <2>3. TypeOK /\ ~terminationDetected /\ S => ENABLED <<System>>_vars
    BY EnabledSystem DEF SystemEnabled, terminationDetected, Color
  <2>4. T => \E n \in Nat : P(n)
    BY N-1 \in Nat
  <2>. HIDE DEF T
  <2>5. QED  BY <2>1, <2>2, <2>3, <2>4, PTL DEF BSpec
<1>2. \A n \in Nat : R(n)
  <2>1. R(0)
    BY PTL
  <2>2. ASSUME NEW n \in Nat
        PROVE  R(n) => R(n+1)
    <3>. DEFINE Pn == P(n)  Pn1 == P(n+1)
    <3>. USE DEF TypeOK, terminated, Nodes, allWhite
    <3>1. TypeOK /\ Pn1 /\ [Next]_vars => Pn1' \/ Pn'
      BY DEF Next, vars, System, Environment, InitiateProbe, PassToken, Deactivate, SendMsg
    <3>2. TypeOK /\ Pn1 /\ <<System>>_vars => Pn'
      BY DEF System, InitiateProbe, PassToken, vars
    <3>3. TypeOK /\ Pn1 => ENABLED <<System>>_vars
      BY EnabledSystem DEF SystemEnabled
    <3>. HIDE DEF Pn1
    <3>4. R(n) => (BSpec => [](Pn1 => <>Q))
      BY <3>1, <3>2, <3>3, PTL DEF BSpec
    <3>. QED  BY <3>4 DEF Pn1
  <2>. HIDE DEF R
  <2>. QED  BY <2>1, <2>2, NatInduction, Isa
<1>3. BSpec => []((\E n \in Nat : P(n)) => <>Q)
  <2>. HIDE DEF P, Q
  <2>1. BSpec => [](\A n \in Nat : P(n) => <>Q)
    BY <1>2
  <2>2. (\A n \in Nat : P(n) => <>Q) <=> ((\E n \in Nat : P(n)) => <>Q)
    OBVIOUS
  <2>. QED  BY <2>1, <2>2, PTL
<1>4. Q => terminationDetected
  BY DEF terminated, allWhite, terminationDetected, Nodes
<1>. QED  BY <1>1, <1>3, <1>4, PTL


(***************************************************************************)
(* The liveness property follows from the above lemmas by simple temporal  *)
(* reasoning.                                                              *)
(***************************************************************************)
THEOREM Live == Spec => Liveness
BY TypeCorrect, TerminationRound1, TerminationRound2, TerminationRound3, PTL
   DEF Spec, BSpec, Liveness


=============================================================================
\* Modification History
\* Last modified Fri Oct 08 11:42:37 CEST 2021 by merz
\* Created Wed Oct 06 09:29:30 CEST 2021 by merz
