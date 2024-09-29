module cpu_dp (clk, rst, mode, din, pc, ops, addr, dout, psw, R0, R1,R2,R3,R4,R5,R6,R7,R8); //dp, 2020ver
parameter BW = 8;

input clk, rst;
input [12:1] mode; //cword
input [BW-1:0] din;
input [8:0] ops;
input [BW-1:0] pc;

output [BW-1:0] addr;
output [BW-1:0] dout;
output [3:0] psw;
output [BW-1:0] R0, R1,R2,R3,R4,R5,R6,R7,R8;

wire [BW-1:0] busA, busB, busD, fout;
wire [BW-1:0] Bdata;
wire [4:0] FS;
wire [3:0] DA, AA, BA;
wire MB, RW, MD, MM;

//DP
assign DA = {mode[12], ops[8:6]}; //ops 8:6 DR
assign AA = {mode[11], ops[5:3]}; //ops 5:3 SA
assign BA = {mode[10], ops[2:0]}; //ops 2:0 SB
assign MB = mode[9];
assign FS = mode[8:4];
assign MD = mode[3];
assign RW = mode[2];
assign MM = mode[1];

assign dout = busB;

funit #(BW) U0 (clk, rst, busA, busB, FS, RW, fout, psw);
rfile #(BW) U1 (clk, rst, busD, DA,AA,BA,RW, busA, Bdata, R0, R1,R2,R3,R4,R5,R6,R7,R8);

assign busB = MB ? {13'b0, ops[2:0]} : Bdata;
assign busD = MD ? din : fout;
assign addr = MM ? pc : busA[8:0];

endmodule
