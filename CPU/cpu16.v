module cpu16 (clk, rst, R0, R1,R2,R3,R4,R5,R6,R7,R8, psw, pc_out );
parameter BW = 16;

input clk, rst;

output [BW-1:0] R0, R1,R2,R3,R4,R5,R6,R7,R8;
//
output [3:0] psw;
output [BW-1:0] pc_out; //must pcout wire change
//
wire [BW-1:0] din;
wire [12:0] cword;
wire [3:0] psw;
wire [BW-1:0] dout;
wire [8:0] addr;
wire [16:0] IR_ops;
wire MW;
wire [12:1] mode;

assign MW = cword[0];
assign mode = cword[12:1];

//Data Pate
cpu_dp #(BW) U0 (clk, rst, mode, din, pc_out, IR_ops[8:0], addr, dout, psw, R0, R1,R2,R3,R4,R5,R6,R7,R8);

//Control
cpu_cont #(BW) U1 (clk, rst, psw, din, cword, pc_out, IR_ops);

//Application
MM U2 (
	.address(addr[8:0]),
	.clock(clk),
	.data(dout),
	.wren(MW),
	.q(din));


endmodule
