---- MODULE Foundation ----
CONSTANT Projects, People
VARIABLES tools, community
vars == <<tools, community>>

Init == tools = {} /\ community = {}

Fund == \E p \in Projects :
          tools' = tools \cup {p}
Grow == \E u \in People :
          community' = community \cup {u}

Next == \/ Fund /\ UNCHANGED community
        \/ Grow /\ UNCHANGED tools
Spec == Init /\ [][Next]_vars /\ WF_vars(Next)

Thrives == <>(vars = <<Projects, People>>)
====
