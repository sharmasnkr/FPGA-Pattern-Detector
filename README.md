# RSD
Create a single state-machine module to find the a pattern of an 8-bit input stream – the characters “boab” 
(98,111,97, 98) – and produce an output signal when an end ’b’ is found within an instance the pattern. 
Once an end ’b’ in the a pattern is found, the output signal should stay high until the input ack signal 
goes from low to high (for instance, if the ack signal was high when the ’b’ arrived it must go low first). 
Your state machine should not start searching for the pattern again once it is found until the ack signal falls back to low.
It should start the searching the input again on the same cycle ack is first low 
(i.e. a new starting ’b’ in the same cycle as the first low value value of ack should be noticed).
