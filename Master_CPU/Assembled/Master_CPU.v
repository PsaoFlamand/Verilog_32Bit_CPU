module TEST_MASTER_CPU;

wire [31:0] instruction;
reg Clk;

wire [3:0] Cond; //ALU
wire [3:0] OpCode; //Memory, ALU
wire S; //ALU
wire [3:0] destination; //Register Bank
wire [3:0] source_1, source_2; //Register Bank
wire [4:0] IV_ShiftRor; //ALU
reg signed [31:0] Reg1, Reg2; //ALU
reg [3:0] Flag; //ALU
wire [15:0] IV_Mov;

wire [7:0] pc; // mem
wire [31:0] reg_data;// mem


reg Enable; //RAM STUFF
reg RW_ram;
wire RW_mem;
reg [15:0] Address_in; //Ram Address
wire [15:0] Address_out; //mem Address
wire [31:0] Out;  //Ram output

wire signed [31:0] Result,Result_mem; // ALU wires
wire [3:0] New_Flag; //ALU Wires

//Register bank part 
wire [31:0] LDR_out; //Register Bank
wire [31:0] Result_1,  Result_2; //Memory

wire [31:0] r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15;
//split the instruction part

reg Reset;
RAM ram(Enable,RW_ram,Address_in,In,Out);
Register_bank regbank(destination, source_1, source_2, reg_data, Clk, Result_1, Result_2);
memory_control memcontrol(Result_1, Result_2, OpCode, RW_mem, Address_out, reg_data, LDR, STR ,LDR_out, STR_in, Counter, Reset, Clk, pc, Result);
MASTER_ALU master(Result_1, Result_2, IV_Shiftror, IV_Mov, OpCode, Cond, S, Result, Flag, New_Flag);

//always @(posedge Clk)
//assign LDR_out=Result;
//assign Result_mem=Result;
assign instruction=Out;
assign Cond = instruction[31:28]; 
assign OpCode =  instruction[27:24];
assign S =  instruction[23];
assign destination = instruction[22:19];
//
assign source_2 = instruction[18:15];
assign source_1 = instruction[14:11];
assign IV_ShiftRor = instruction[10:6];
//
assign IV_Mov=instruction[18:3];


initial
begin  
Clk=1;
Reset=1;
//Reg1=Result_1;
//Reg2=Result_2;
$readmemh("data_h.txt", ram.Mem);
   Enable =0;   RW_ram=1;	Address_in=32'd0;	
#5 Enable =1;   RW_ram=1;	Address_in=32'd0;	
#5 Enable =1;   RW_ram=1;	Address_in=32'd1;	
#5 Enable =1;   RW_ram=1;	Address_in=32'd2;	
#5 Enable =1;   RW_ram=1;	Address_in=32'd3;	
#5 Enable =1;   RW_ram=1;	Address_in=32'd4;	
#5 Enable =1;   RW_ram=1;	Address_in=32'd5;	
#5 Enable =1;   RW_ram=1;	Address_in=32'd6;	
#5 Enable =1;   RW_ram=1;	Address_in=32'd7;	
#5 Enable =1;   RW_ram=1;	Address_in=32'd8;	
#5 Enable =1;   RW_ram=1;	Address_in=32'd9;

end

initial
begin

$monitor($time, "reg_data:%d Reg1:%d Reg2:%d Cond:%b S:%b destination:%b source_2:%b source_1:%b IV_ShiftRor:%d IV_Mov:%d address:%b OpCode:%b Result:%d flag :%b \n \n \n R0=%d, R1=%d, R2=%d, R3=%d, R4=%d R5=%d, R6=%d, R7=%d, R8=%d, R9=%d, R10=%d, R11=%d, R12=%d, R13=%d, R14=%d,R15=%d \n \n ",

 reg_data, Result_1, Result_2,Cond,S,destination,source_2, source_1, IV_ShiftRor, IV_Mov,Address_in, Out, Result,New_Flag, r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);

end 

endmodule

