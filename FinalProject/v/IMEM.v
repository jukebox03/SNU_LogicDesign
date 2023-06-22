`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:45:29 06/07/2023 
// Design Name: 
// Module Name:    IMEM 
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
module IMEM(
	input [7:0] Read_Address,
	output [7:0] instruction
    );
	 
	 
	wire [7:0] MemByte[255:0];
	
	assign MemByte[0] = {2'b01, 2'b00, 2'b10, 2'b01}; // $S2 = MEM[$S0+1] = 1
	assign MemByte[1] = {2'b00, 2'b10, 2'b10, 2'b10}; // $S2 = $S2 + $S2 = 2 
	assign MemByte[2] = {2'b01, 2'b10, 2'b10, 2'b10}; // $S2 = MEM[$S2+2] = 4
	assign MemByte[3] = {2'b00, 2'b01, 2'b10, 2'b01}; // $S1 = $S1 + $S2 = 4
	assign instruction = MemByte[Read_Address];

endmodule
