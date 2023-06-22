`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:34 06/07/2023 
// Design Name: 
// Module Name:    EntireMicroprocessor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
 module EntireMicroprocessor(
	input clk,
	input reset,
	output [6:0] seg1,
	output [6:0] seg2,
	output [6:0] seg3,
	output [6:0] seg4,
	output [7:0] current,
	output [7:0] Sum,
	output [7:0] MemoryReadData,
	output [7:0] instruction,
	output CLK_1,
	output CLK_2,
	output CLK_3,
	output CLK_4
    );
	 
	 
	 microprocessor T1(.instruction(instruction),
		.clk(clk),
		.reset(reset),
		.seg1(seg1),
		.seg2(seg2),
		.current(current),
		.Sum(Sum),
		.MemoryReadData(MemoryReadData),
		.CLK_1(CLK_1),
		.CLK_2(CLK_2),
		.CLK_3(CLK_3),
		.CLK_4(CLK_4)
		);
		
	IMEM T2(.Read_Address(current),
	.instruction(instruction), .seg1(seg3), .seg2(seg4));


endmodule