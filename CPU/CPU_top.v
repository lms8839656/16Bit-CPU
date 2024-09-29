//////////////////////////
//16bit CPU CHIL-SAK-JO	//
//2020.12.13	report	//
//////////////////////////
module CPU_top(clk, rst, LCD_ON, LCD_EN, LCD_RS, LCD_RW, LCD_DATA);
parameter BW = 16;

input clk, rst;
output LCD_ON, LCD_EN, LCD_RS, LCD_RW;
output [7:0] LCD_DATA;

wire [BW-1:0] R0;
assign LCD_ON = 1'b1;
wire clk1M,clk10k,clk2k;
wire rstn = ~rst;
assign LCD_EN = R0[15];
assign LCD_RS = R0[9];
assign LCD_RW = R0[8];
assign LCD_DATA[7:0] = R0[7:0];

cpu16 #(BW) U0 (clk, rstn, R0);

clk_1k UC (
	.inclk0(clk),	// 50M
	.c0(clk1M),	// 1MHZ
	.c1(clk10k),	// 10k
	.c2(clk2k));	// 2k
	

//cwrom 27:0 cw 28 256 act 
//mm 15:0 app1 16 512 command save coding
endmodule
