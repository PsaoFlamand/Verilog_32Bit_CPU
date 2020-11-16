// testbench for memory control 
module test_memory;
reg [31:0]SR1, SR2;
reg [3:0] op_code;
reg Reset, Clk;
reg [31:0] LDR_out,alu_result;
wire RW, LDR, STR, STR_in;
wire [31:0]address_out;
wire [31:0]reg_data;
wire Counter,add_bus;

wire mux_out, address_input;
wire [7:0]pc;



initial
begin
$display($time, " Test My Design");
end

initial
begin
//$monitor($time, " Inputs: OP Code=%b, LDR=%b, STR=%b, RW=%b, Source 1=%d,Source 2=%d, ALU result=%d",op_code, LDR, STR, RW,SR1, SR2, alu_result );
//$monitor(" Outputs: Address to RAM=%d, Data to register bank=%d",address_out, reg_data);

$monitor($time, " Inputs: Clock=%d, Reset=%d, OP Code=%b, LDR=%b, STR=%b, RW=%b, Source 1=%d,Source 2=%d, ALU result=%d, Data from Ram; Outputs: Address to RAM=%d, Data to register bank=%d ",Clk, Reset, op_code, LDR, STR, RW,SR1, SR2, alu_result, STR_in, address_out, reg_data );
end 

initial
begin
SR1=32'b00000000000000000000000000010000;
SR2=32'b00000000000000000000000000001000;
alu_result=32'b00000000000000000000000000001000;
//pc=4'b0000;
//SR1= 30; SR2=20; 
LDR_out=32'b00000000000000000000000000010000;
Clk=0;
#10 op_code=4'b1101;
#10 op_code=4'b1110; 
#10 op_code=4'b1101; 
#10 op_code=4'b1110; 
#10 op_code=4'b1111; Reset=0;
#10 op_code=4'b1101; Reset=1;
#10 op_code=4'b1100; 
#10 op_code=4'b1101; 
#10 op_code=4'b1110; 
#10 op_code=4'b1111; 
#160 $finish; // Stop the simulation after 162 time units
end

always #10 Clk=~Clk; // How to create a clock pulses of period 10
memory_control MUT(SR1, SR2, op_code, RW, address_out, reg_data, LDR, STR ,LDR_out,STR_in,Counter, Reset,Clk,pc,alu_result);
endmodule