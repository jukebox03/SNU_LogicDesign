`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:48:41 06/07/2023 
// Design Name: 
// Module Name:    ProgramCounter 
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
module ProgramCounter(
	input [7:0] value,
	input clk,
	input Reset,
	output [7:0] current
    );
	
	reg [7:0] current_reg;
	
	initial begin
		current_reg = 8'd0;
	end
	
	assign current = current_reg;
	
	always@(posedge Reset or posedge clk)
			begin
				if(Reset) begin
					current_reg = 8'd0;
				end
				else begin
					current_reg = value;
				end
			end


endmodule
