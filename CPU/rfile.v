module rfile (clk, rst, din, DA,AA,BA,RW, Adata, Bdata, R0, R1,R2,R3,R4,R5,R6,R7,R8);
parameter BW = 8;

input clk, rst;
input [BW-1:0] din;
input [3:0] DA, AA, BA;
input RW;

output [BW-1:0] Adata, Bdata;
output [BW-1:0] R0, R1,R2,R3,R4,R5,R6,R7,R8;

reg [BW-1:0] Adata, Bdata;
reg [BW-1:0] R0, R1, R2, R3;
reg [BW-1:0] R4, R5, R6, R7, R8;

always @ (posedge rst, posedge clk)
if (rst)
begin
	R0 <= {BW {1'b0}};
	R1 <= {BW {1'b0}};
	R2 <= {BW {1'b0}};
	R3 <= {BW {1'b0}};
	R4 <= {BW {1'b0}};
	R5 <= {BW {1'b0}};
	R6 <= {BW {1'b0}};
	R7 <= {BW {1'b0}};
	R8 <= {BW {1'b0}};
end

else if(RW)
begin
	case(DA)
		4'b0000 : R0 <= din;
		4'b0001 : R1 <= din;
		4'b0010 : R2 <= din;
		4'b0011 : R3 <= din;		
		4'b0100 : R4 <= din;
		4'b0101 : R5 <= din;		
		4'b0110 : R6 <= din;
		4'b0111 : R7 <= din;
		4'b1000 : R8 <= din;
		default : R0 <= din;
	endcase
end


		
always @ (*)
case (AA)
	4'b0000 : Adata = R0;
	4'b0001 : Adata = R1;
	4'b0010 : Adata = R2;
	4'b0011 : Adata = R3;
	4'b0100 : Adata = R4;
	4'b0101 : Adata = R5;
	4'b0110 : Adata = R6;
	4'b0111 : Adata = R7;
	4'b1000 : Adata = R8;
	default : Adata = R0;
endcase

always @ (*)
case (BA)
	4'b0000 : Bdata = R0;
	4'b0001 : Bdata = R1;
	4'b0010 : Bdata = R2;
	4'b0011 : Bdata = R3;
	4'b0100 : Bdata = R4;
	4'b0101 : Bdata = R5;
	4'b0110 : Bdata = R6;
	4'b0111 : Bdata = R7;
	4'b1000 : Bdata = R8;
	default : Bdata = R0;
endcase
endmodule