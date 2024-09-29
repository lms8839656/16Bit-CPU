module cpu_cont (clk, rst, psw, din, mode, PC, IR_ops);
parameter BW = 8;

input clk, rst;
input [3:0] psw;
input [BW-1:0] din;

output [12:0] mode;
output [BW-1:0] PC;
output [16:0] IR_ops; 		//15:9, 8:0

wire [27:0] cw;				//control word
wire [2:0] MS;
wire [7:0] mcout, naddr;
wire [7:0] INST_FET;
wire [7:0] ADDR_FET;
wire [8:0] PC_EXT;

reg [7:0] car_in;
reg [7:0] car;
reg [BW-1:0] IR;
reg [BW-1:0] PC;

wire PL, PI, IL, MC, z,n,c,v;
reg mout;

assign z= psw[3];
assign n= psw[2];
assign c= psw[1];
assign v= psw[0];

assign mode = cw[12:0];
assign PL = cw[13];
assign PI = cw[14];
assign IL = cw[15];
assign MC = cw[16];
assign MS = cw[19:17];
assign naddr = cw[27:20];

assign ADDR_FET = 8'b0;
assign PC_EXT = IR_ops[8:0];
assign INST_FET = 8'd192;
assign IR_ops = {1'b0, IR[15:0]};

always @ *
case (MS)
	3'b000 : mout = 1'b0;
	3'b001 : mout = 1'b1;
	3'b010 : mout = c;
	3'b011 : mout = v;
	3'b100 : mout = z;
	3'b101 : mout = n;
	3'b110 : mout = !c;
	3'b111 : mout = !z;
	default : mout = 1'b0;
endcase


assign mcout = MC ? {IR_ops[16:9]} : naddr;

always @ (posedge clk)
	if (IL) IR <= din;

/*
always @ (posedge clk)
	if (rst) PC <= ADDR_FET; // start addr
	else if (PI) PC <= PC + 1'b1;
	else if (PL) PC <= PC + PC_EXT; // JMP, BR
*/


always @ (posedge rst, posedge clk) begin
	if (rst) PC <= ADDR_FET;
	else if (PI) PC <= PC + 1'b1;
	else if (PL) case(IR[13:9])
				5'b00000 : 	 if(c == 1'b0) PC <= PC_EXT;
							    else PC <= PC + 1'b1;
				5'b00001 : 	 if(c == 1'b1) PC <= PC_EXT;
							    else PC <= PC + 1'b1;
				5'b00010 : 	 if(z == 1'b0) PC <= PC_EXT;
								 else PC <= PC + 1'b1;
				5'b00011 : 	 if(z == 1'b1) PC <= PC_EXT;
								 else PC <= PC + 1'b1;		 
				5'b00101 : 	 if(n == 1'b1) PC <= PC_EXT;
								 else PC <= PC + 1'b1;
				5'b00111 : 	 if(v == 1'b1) PC <= PC_EXT;
								 else PC <= PC + 1'b1;
				5'b10000 : 	 PC <= PC_EXT;
				default : PC <= PC + 1'b1;
		endcase
end
	
	
	
	
	
	
always @ *
	if (rst) car_in = INST_FET; //ex 8'd192
	else if (mout) car_in = mcout;
	else car_in = car + 1'b1;

always @ (posedge clk)
	car <= car_in;

//cw, rom 256*28
cwrom U0 (
	.address(car_in),
	.clock(clk),
	.q(cw));

endmodule
