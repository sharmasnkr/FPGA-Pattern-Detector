# Reconfigurable Syetem Design
Create a single state-machine module to find the a pattern of an 8-bit input stream – the characters “boab” 
(98,111,97, 98) – and produce an output signal when an end ’b’ is found within an instance the pattern. 
Once an end ’b’ in the a pattern is found, the output signal should stay high until the input ack signal 
goes from low to high (for instance, if the ack signal was high when the ’b’ arrived it must go low first). 
Your state machine should not start searching for the pattern again once it is found until the ack signal falls back to low.
It should start the searching the input again on the same cycle ack is first low 
(i.e. a new starting ’b’ in the same cycle as the first low value value of ack should be noticed).

(a) From Paper Section 2.1 – Two always block style with combinational outputs Your implementation should be able to output a high value in response to the found_pattern signal within the same clock cycle that the final “b” input arrives, earlier than the next two registered-output implementations. It should also goto low in response to the ack signal immediately as well.
(b) From Paper Section 2.3 – Three always block style with registered outputs. This and the previous registered-output style implementation should produce the exact same responses
(c) From Paper Section 2.2 – One sequential always block style with registered outputs This and the next two registered-output style implementation should produce the exact same responses
(d) From Paper Section 2.1 – Two always block style with combinational outputs. Modify your combinatorial-output state machine so that its output matches the like the registered output versions with respect to the value of the output at various clock edges.



***For part B, just make a small change to part a
