`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:59:51 06/07/2023 
// Design Name: 
// Module Name:    register 
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
module register(
    input [1:0] ReadReg1Add,
    input [1:0] ReadReg2Add,
    input [1:0] WriteRegAdd,
    input [7:0] WriteData,
	 input RegWrite,
	 input CLK,
	 input Reset,
    output reg [7:0] ReadData,
    output reg [7:0] ReadData2
    );
	 
	 reg [7:0] Register[3:0];
	 
	 initial begin
		Register[0] = 0;
		Register[1] = 0;
		Register[2] = 0;
		Register[3] = 0;
	 end
	 
	 always@(posedge Reset or posedge CLK)
		 begin
				if(Reset) begin
					Register[0] = 0;
					Register[1] = 0;
					Register[2] = 0;
					Register[3] = 0;
				end
				else begin
					ReadData = Register[ReadReg1Add];
					ReadData2 = Register[ReadReg2Add];
					begin
						if(RegWrite)
							Register[WriteRegAdd] = WriteData;
				end
			end
		end 
endmodule
