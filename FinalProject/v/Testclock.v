`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:42:36 06/09/2023
// Design Name:   clock
// Module Name:   /csehome/jukebox/FINAL/Testclock.v
// Project Name:  FINAL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Testclock;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire clkout_1;
	wire clkout_2;
	wire clkout_3;
	wire clkout_4;

	// Instantiate the Unit Under Test (UUT)
	clock uut (
		.clk(clk), 
		.Reset(reset),
		.clkout_1(clkout_1), 
		.clkout_2(clkout_2),
		.clkout_3(clkout_3),
		.clkout_4(clkout_4)
	);

	always #10 clk=~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		#550000000;
		
		reset = 1;
		
		#500000000;
		
		reset = 0;
        
		// Add stimulus here

	end
      
endmodule

