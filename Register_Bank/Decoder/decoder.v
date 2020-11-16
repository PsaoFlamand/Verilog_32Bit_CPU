// destination 4 bits to 16 enable decoder module decoder(clk, dest, enable);
module decoder(clk, dest, enable);
input clk;
input [3:0]dest; 
output enable;
reg [15:0]enable;

always@*
begin 
	case(dest)
	4'b0000: enable=16'b0000000000000001;
	4'b0001: enable=16'b0000000000000010;
	4'b0010: enable=16'b0000000000000100;
	4'b0011: enable=16'b0000000000001000;
	4'b0100: enable=16'b0000000000010000;
	4'b0101: enable=16'b0000000000100000;
	4'b0110: enable=16'b0000000001000000;
	4'b0111: enable=16'b0000000010000000;
	4'b1000: enable=16'b0000000100000000;
	4'b1001: enable=16'b0000001000000000;
	4'b1010: enable=16'b0000010000000000;
	4'b1011: enable=16'b0000100000000000;
	4'b1100: enable=16'b0001000000000000;
	4'b1101: enable=16'b0010000000000000;
	4'b1110: enable=16'b0100000000000000;
	4'b1111: enable=16'b1000000000000000;
	default: enable=16'b0000000000000000;
  	endcase 
end
endmodule 
