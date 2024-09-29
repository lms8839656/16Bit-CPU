//////////////////
//TB_cpu
//////////////////
`timescale 1 ns / 100 ps
module tb_cpu;

parameter BW = 16;
reg clk, rst;
wire [BW-1:0] R0, R1,R2,R3,R4,R5,R6,R7,R8, PC;
wire [3:0] psw;
cpu16 #(BW) TEST (clk, rst, R0, R1,R2,R3,R4,R5,R6,R7,R8, psw, PC);


always #100 clk = ~clk;

initial begin
	 clk = 1'b0;
  	 rst = 1'b1; 
	
	 #150
	 rst = 1'b0;
	 
	 #500000
	$stop;
 end
 endmodule