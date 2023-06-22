`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:40 06/07/2023 
// Design Name: 
// Module Name:    control 
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
module control(
	input [1:0] I,
	output [7:0] Out);
	
	reg [7:0] O;
	assign Out = O;
	
	always@(I)
		begin
			case(I)
				2'b00 : O <= 8'b11000001;
				2'b01 : O <= 8'b01101010;
				2'b10 : O <= 8'bx01001x0;
				2'b11 : O <= 8'bx00100x0;
			endcase
		end

	
	


endmodule
