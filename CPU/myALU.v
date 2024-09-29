module myALU  (opA, opB, sel, cpsw, aout);
parameter BW = 8;
input [BW-1:0] opA, opB;
input [3:0] sel; //s2, s1, s0 ,cin
output [3:0] cpsw; 
output [BW-1:0] aout;

reg [BW-1:0] lout;

wire [BW-1:0] rout;
wire z, n, cout, ov;
wire [2:0] asel;
wire [1:0] lsel;

assign aout = sel[3] ? lout : rout;
assign cpsw = {z, n, cout, ov};
assign asel = sel[2:0];
assign lsel = sel[2:1];
assign n = aout[BW-1];
assign z = ~| aout;

//logic unit
always @ (*)
case (lsel)
	2'b00 : lout = opA & opB;
	2'b01 : lout = opA | opB;
	2'b10 : lout = opA ^ opB;
	default : lout = ~opA;
endcase

// arith
arith #(BW) U1 (opA, opB, asel, cout, ov, rout);

endmodule
