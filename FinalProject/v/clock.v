`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:08 06/07/2023 
// Design Name: 
// Module Name:    clock 
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
module clock(
	input clk,
	input Reset,
	output reg clkout_1, 
	output reg clkout_2, 
	output reg clkout_3,
	output reg clkout_4
	);
	
	reg [31:0] cnt_1;
	reg [31:0] cnt_2;
	reg [31:0] cnt_3;
	reg [31:0] cnt_4;
	reg [31:0] cnt_t;
	reg [31:0] cnt_s;

	initial begin
		cnt_1 <= 32'd0;
		cnt_2 <= 32'd0;
		cnt_3 <= 32'd0;
		cnt_4 <= 32'd0;
		cnt_t <= 32'd0;
		cnt_s <= 32'd0;
		clkout_1 <= 1'b0;
		clkout_2 <= 1'b0;
		clkout_3 <= 1'b0;
		clkout_4 <= 1'b0;
	end

	always@(posedge Reset or posedge clk)
		begin
			if (Reset) begin
				cnt_1 <= 32'd0;
				cnt_2 <= 32'd0;
				cnt_3 <= 32'd0;
				cnt_4 <= 32'd0;
				cnt_t <= 32'd0;
				cnt_s <= 32'd0;
				clkout_1 <= 1'b0;
				clkout_2 <= 1'b0;
				clkout_3 <= 1'b0;
				clkout_4 <= 1'b0;
			end
			else begin
				
				if (cnt_t != 32'd25000000)
					begin
						cnt_t <= cnt_t + 1;
					end
				else
					begin
						cnt_2 <= cnt_2 + 1;
					end
				
				if (cnt_s != 32'd10000000)
					begin
						cnt_s <= cnt_s + 1;
					end
				else
					begin
						cnt_4 <= cnt_4 + 1;
					end
					
					
				if (cnt_1 == 32'd25000000)
					begin
						cnt_1 <= 32'd0;
						clkout_1 <= ~clkout_1;
					end
				else if (cnt_2 == 32'd25000000)
					begin
						cnt_2 <= 32'd0;
						clkout_2 <= ~clkout_2;
					end
				else if (cnt_3 == 32'd12500000)
					begin
						cnt_3 <= 32'd0;
						clkout_3 <= ~clkout_3;
					end
				else if (cnt_4 == 32'd25000000)
					begin
						cnt_4 <= 32'd0;
						clkout_4 <= ~clkout_4;
					end
				else
					begin
						cnt_1 <= cnt_1 + 1;
						cnt_3 <= cnt_3 + 1;
					end
			end
		end

	endmodule
