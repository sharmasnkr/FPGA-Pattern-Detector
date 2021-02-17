`timescale 1ns/1ns
module PatternDetector (input [7:0] data, input reset_sync, input clk, input ack, output logic found_pattern);							
parameter init= 3'd0,    //initial state, looking for b
			 s_b=3'd1,		//b found, looking for o
			 s_o=3'd2,		//o found, looking for a
			 s_a=3'd3,		//a found, looking for b
			 s_bl=3'd4,		//b found when ack low
			 s_bh=3'd5;	   //b found when ack hign			 
logic [2:0] cs, ns;

always @ (posedge clk)                 begin
	if(reset_sync) begin cs<=init; end
	else begin cs<=ns; end	            end
								
always @ (data) begin
	case(cs) 
	init: begin	if ((data==98) & (ack==0)) begin ns<= s_b; end
					else begin ns <= init; end
			end
	s_b: begin
					if (data==111) begin ns<= s_o; end //"bo" found so far, looking for a
					else if (data==98) begin ns<= s_b; end //"bb" found, looking for o
					else begin ns <= init; end //the pattern is broken
			end
	s_o: begin
					if (data==97) begin ns<= s_a; end
					else if (data==98) begin ns<= s_b; end
					else begin ns <= init; end
			end
	s_a: begin  if ((data==98) && (ack==0)) begin 
					ns<= s_bl;	end
					else if ((data==98) && (ack==1)) begin
					ns<= s_bh; 					
					end					
					else begin ns <= init; end
			end 
	s_bl: begin if (ack==1) begin ns<= init; end
					else begin ns <= s_bl; end
			end
	s_bh: begin if (ack==0) begin ns<= init; end
					else begin ns <= s_bh; end
			end 			endcase 			end	
			
always @(posedge clk) begin
	case(ns) 
	init: begin  found_pattern <=0;	
			end
	s_b: begin   found_pattern <=0;	
			end
	s_o: begin   found_pattern <=0;	
			end
	s_a: begin  found_pattern <=0; 	
			end 
	s_bl: begin   if (data!=98) begin found_pattern <=1; end
			else 	begin found_pattern <=0; end
			end
	s_bh: begin  if (data!=98) begin found_pattern <=1; end
			else 	begin found_pattern <=0; end
			end
	endcase
end

endmodule
