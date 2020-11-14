
// testbench for address bus in mem control 
module test_address_bus;
reg LDR, STR;
reg [7:0] PC;
reg [31:0] Source_Register_1;
wire [31:0] Address ;

initial
begin
$display($time, " Test My Design");
end

initial
begin
$monitor($time, "LDR=%b, STR=%d, Source 1=%b, PC=%b, Address output=%b",LDR, STR, Source_Register_1, PC,Address);end

initial
begin
LDR=0; 
STR=0;
PC=8'b10001000;
Source_Register_1=16'b1111111111111111;
#10 LDR=0; 
STR=0;
#10 LDR=0; 
STR=1;
#10 LDR=1; 
STR=0;
#10 LDR=0; 
STR=0;
#10 LDR=1; 
STR=1;
#100 $finish; // Stop the simulation after 162 time units
end

 Address_bus MUT(Source_Register_1, PC, LDR, STR, Address);

endmodule