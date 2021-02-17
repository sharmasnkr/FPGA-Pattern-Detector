`timescale 1ns / 1ns

module PatternDetector_tb ();

logic [7:0] data;
logic reset_sync;
logic clk;
logic ack;
logic found_pattern;

string inputs = "pbbboabzboabzboabz";
int cycle_count;
PatternDetector uut (.data(data), .reset_sync(reset_sync), .clk(clk), .ack(ack), .found_pattern(found_pattern));

always #1 clk = ~clk;
always #2 cycle_count=cycle_count+1;

always @ (cycle_count) begin 
data=inputs[cycle_count];
end

initial begin 
$dumpfile("hw4.vcd");
      $dumpvars;

reset_sync=1;
clk=0;
ack=0;
cycle_count=0;

$monitor("%t reset=%d data=%c ack=%d pattern found= %d", $time, reset_sync, data, ack, found_pattern);
#2
reset_sync=0;
#15
ack=1;
#2
ack=0;
#19

$finish;

end
endmodule 
