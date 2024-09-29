module arith (A, B, sel, cout, OV, aout);

parameter BW = 8;
input [BW-1:0] A, B;
input [2:0] sel;
output cout, OV;
output [BW-1:0] aout;

wire [BW-1:0] Y;

assign Y=B & {BW{sel[1]}} | ~B & {BW{sel[2]}};



rca #(BW) U0 (A, Y, sel[0], aout, cout, OV); //rca 직접 제작 리플캐리 에더 , FA 제작

endmodule