`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:23 06/07/2023 
// Design Name: 
// Module Name:    microprocessor 
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
module microprocessor(
		input [7:0] instruction,
		input clk,
		input reset,
		output [6:0] seg1,
		output [6:0] seg2,
		output [7:0] current
	);
	
	wire CLK_1;
	wire CLK_2;
	wire CLK_3;
	wire CLK_4;
	wire [7:0] signal;
	
	
	clock CLOCK_1(.clk(clk), .Reset(reset), .clkout_1(CLK_1), .clkout_2(CLK_2), .clkout_3(CLK_3), .clkout_4(CLK_4));
	control CONTROL_1(.I(instruction[7:6]), .Out(signal));
	
	wire RegDst = signal[7];
	wire RegWrite = signal[6];
	wire ALUSrc	= signal[5];
	wire Branch = signal[4];
	wire MemRead = signal[3];
	wire MemWrite = signal[2];
	wire MemtoReg	= signal[1];
	wire ALUOp = signal[0];
	
	wire [1:0] ReadReg1Add;
   wire [1:0] ReadReg2Add;
   wire [1:0] WriteRegAdd;
   wire [7:0] WriteData;
   wire [7:0] ReadData;
   wire [7:0] ReadData2;
	
	assign ReadReg1Add = instruction[5:4];
	assign ReadReg2Add = instruction[3:2];	
	
	assign WriteRegAdd = (RegDst==0) ? instruction[3:2] : instruction[1:0];
	
	register REGISTER_1 (.ReadReg1Add(ReadReg1Add),
	.ReadReg2Add(ReadReg2Add),
   .WriteRegAdd(WriteRegAdd),
   .WriteData(WriteData),
	.RegWrite(RegWrite),
	.CLK(CLK_3),
	.Reset(reset),
   .ReadData(ReadData),
   .ReadData2(ReadData2));
	
	wire [7:0] Sum;
	wire [7:0] signed_signal;
	wire [5:0] extend_sign;
	assign extend_sign = (instruction[1]==1'b1) ? 6'b111111 : 6'b000000;
	assign signed_signal = {extend_sign, instruction[1:0]};
	ALU ALU_1 (.ALUOp(ALUOp), .Rs(ReadData), .Rt((ALUSrc==0) ? ReadData2 : signed_signal), .R(Sum));
	
	wire [7:0] MemoryReadData;
	DataMemory DATAMEMORY_1 (.Address(Sum),
	.WriteData(ReadData2),
	.MemRead(MemRead),
	.MemWrite(MemWrite),
	.Reset(reset),
	.clk(CLK_1),
	.ReadData(MemoryReadData));
	
	assign WriteData = (MemtoReg==0) ? Sum : MemoryReadData;
	

	assign Sum_t = Sum;
	assign MemoryReadData_t = MemoryReadData;
	
	wire [7:0] value;
	wire [7:0] current_t;

	assign value = (Branch==0) ? current+1: (reset==0)? current+1+signed_signal : 8'd0;
	
	ProgramCounter PC (.value(value), .clk(CLK_2), .Reset(reset), .current(current_t));
	
	assign current = current_t;

	Segment7 SEGMENT_1(.bcd(WriteData[7:4]), .clk(CLK_4), .seg(seg1));
	Segment7 SEGMENT_2(.bcd(WriteData[3:0]), .clk(CLK_4), .seg(seg2));	
endmodule