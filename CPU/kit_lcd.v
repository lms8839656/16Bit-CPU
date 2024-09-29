module kit_lcd ( clk, rstn,
			LCD_DATA, LCD_RW, LCD_EN, LCD_RS, LCD_ON, SW );
input	 clk, rstn;
input [15:0] SW;
output wire [7:0] LCD_DATA;
output wire LCD_RW, LCD_EN, LCD_RS, LCD_ON;
wire   clk1M;

assign LCD_ON = 1'b1;

clk_1k U0(
	.inclk0(clk),		//50Mhz
	.c0(clk1M),		//1khz
	.c1(),			//10khz
	.c2() );			//2khz

	


	

 lcd2 U2 (
	.resetn (rstn),
	.lcdclk (clk),
	.lcd_rs (LCD_RS),
	.lcd_rw (LCD_RW),
	.lcd_en (LCD_EN),
	.lcd_data (LCD_DATA),
	.CPU_R0(SW[15:0]),
	.CPU_R1({14'b0,SW[1:0]}) );
		
endmodule

