`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:11:35 06/07/2023
// Design Name:   EntireMicroprocessor
// Module Name:   /csehome/jukebox/FINAL/TestEntireMicroprocessor.v
// Project Name:  FINAL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: EntireMicroprocessor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestEntireMicroprocessor;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [6:0] seg1;
	wire [6:0] seg2;
	wire [7:0] current;
	wire [7:0] Sum;
	wire [7:0] MemoryReadData;
	wire [7:0] instruction;
	wire CLK_1;
	wire CLK_2;
	wire CLK_3;
	wire CLK_4;
	// Instantiate the Unit Under Test (UUT)
	EntireMicroprocessor uut (
		.clk(clk), 
		.reset(reset), 
		.seg1(seg1), 
		.seg2(seg2),
		.current(current),
		.Sum(Sum),
		.MemoryReadData(MemoryReadData),
		.instruction(instruction),
		.CLK_1(CLK_1),
		.CLK_2(CLK_2),
		.CLK_3(CLK_3),
		.CLK_4(CLK_4)
	);
	
	always #10 clk=~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		
		#550000000;#550000000;#550000000;
		
		reset = 1;
		
		#500000;
		
		reset = 0;
        
		// Wait 100 ns for global reset to finish
				

	end
      
endmodule

