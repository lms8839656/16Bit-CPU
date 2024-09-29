module shifter (din, sel, inR, inL, dout);
parameter BW = 8;
input [BW-1:0] din;
input [2:0] sel;
input inR, inL;
output [BW-1:0] dout;

reg [BW-1:0] dout;

always @ *
case (sel)
3'b001 : dout = {din[BW-1], din[BW-1:1]}; //arith
3'b010 : dout = {inR, din[BW-1:1]};			//logic r
3'b011 : dout = {din[BW-2:0], inL};			//logic l
3'b100 : dout = {din[0], din[BW-1:1]}; 	//sh r
3'b101 : dout = {din[BW-2:0], din[BW-1]};	//sh l
3'b110 : dout = {din[BW-1:8], din[3:0] ,din[7:4]};//7-4 3-0 swap
default : dout = din;
endcase

endmodule
