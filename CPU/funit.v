module funit (clk, rst, opA, opB, FS, RW, fout, psw);
parameter BW = 8;

input clk, rst;
input [BW-1:0] opA, opB;
input [4:0] FS;
input RW;

output [BW-1:0] fout;
output reg [3:0] psw;

wire MF;
wire [3:0] Gsel;
wire [2:0] Hsel;
wire [BW-1:0] gout, hout;
wire [3:0] cpsw;
wire inR;
wire inL;

assign inR = 1'b0;
assign inL = 1'b0;

assign MF = FS[4];
assign Gsel = FS[3:0];
assign Hsel = FS[3:1];

always @ (posedge rst, negedge clk)	// register PSW
if (rst) psw <= 4'b0;
else if (RW) psw <= cpsw;

myALU #(BW) U0 (opA, opB, Gsel, cpsw, gout);

shifter #(BW) U1 (opB, Hsel, inR, inL, hout);

assign fout = MF ? hout : gout;

endmodule
