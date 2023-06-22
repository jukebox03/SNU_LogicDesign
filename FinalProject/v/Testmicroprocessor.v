`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:49:32 06/07/2023
// Design Name:   microprocessor
// Module Name:   /csehome/jukebox/FINAL/Testmicroprocessor.v
// Project Name:  FINAL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: microprocessor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Testmicroprocessor;

	// Inputs
	reg [7:0] instruction;
	reg clk;
	reg reset;

	// Outputs
	wire [6:0] seg1;
	wire [6:0] seg2;
	wire [7:0] current;

	// Instantiate the Unit Under Test (UUT)
	microprocessor uut (
		.instruction(instruction), 
		.clk(clk), 
		.reset(reset), 
		.seg1(seg1), 
		.seg2(seg2), 
		.current(current)
	);

	initial begin
		// Initialize Inputs
		instruction = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		instruction = {2'b01, 2'b00, 2'b10, 2'b01};
		
		#1000000000;
        
		// Add stimulus here

	end
      
endmodule

