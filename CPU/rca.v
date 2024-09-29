
module rca (A, Y, ci, aout, cout_F, ov);

parameter BW = 8;

input wire [BW-1:0] A, Y;
input wire ci;

output wire cout_F, ov;
output wire [BW-1:0] aout;

wire [BW-1:0] cout;
wire [BW:0] cin;

// FA1 (x, y, ci, co, s);

assign cin[0] = ci;
assign cout_F = cout[BW-1];
assign ov = cout[BW-2] ^ cout[BW-1];

generate 
	genvar i;
		for (i = 0; i < BW; i = i+1) begin: xi
			FA1 U (A[i], Y[i], cin[i], cout[i], aout[i]);
			assign cin[i+1] = cout[i];
		end 
endgenerate
		
endmodule


