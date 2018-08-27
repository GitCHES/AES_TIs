`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:27:29 01/24/2018 
// Design Name: 
// Module Name:    muls 
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
//share the gf2^4 multiplier with operations in gf2 using 4 input shares
module muls(
   input [3:0]  XxDI0,
	input [3:0]  XxDI1,
	input [3:0]  XxDI2,
	input [3:0]  XxDI3,
   input [3:0]  YxDI0,
   input [3:0]  YxDI1,
	input [3:0]  YxDI2,
	input [3:0]  YxDI3,
   output [3:0] QxDO0,
   output [3:0] QxDO1,
	output [3:0] QxDO2,
	output [3:0] QxDO3
 );  
	
	assign QxDO0[3]=((XxDI2[3]^XxDI3[3])&(YxDI1[3]^YxDI2[3]))^((XxDI2[1]^XxDI3[1])&(YxDI1[3]^YxDI2[3]))^((XxDI2[0]^XxDI3[0])&(YxDI1[3]^YxDI2[3]))
	^((XxDI2[2]^XxDI3[2])&(YxDI1[2]^YxDI2[2]))^((XxDI2[1]^XxDI3[1])&(YxDI1[2]^YxDI2[2]))^((XxDI2[3]^XxDI3[3])&(YxDI1[1]^YxDI2[1]))
	^((XxDI2[2]^XxDI3[2])&(YxDI1[1]^YxDI2[1]))^((XxDI2[1]^XxDI3[1])&(YxDI1[1]^YxDI2[1]))^((XxDI2[0]^XxDI3[0])&(YxDI1[1]^YxDI2[1]))
	^((XxDI2[3]^XxDI3[3])&(YxDI1[0]^YxDI2[0]))^((XxDI2[1]^XxDI3[1])&(YxDI1[0]^YxDI2[0]))^XxDI1[2]^YxDI1[2]^XxDI1[0]^YxDI1[0];
	assign QxDO0[2]=((XxDI2[2]^XxDI3[2])&(YxDI1[3]^YxDI2[3]))^((XxDI2[1]^XxDI3[1])&(YxDI1[3]^YxDI2[3]))^((XxDI2[3]^XxDI3[3])&(YxDI1[2]^YxDI2[2]))
	^((XxDI2[2]^XxDI3[2])&(YxDI1[2]^YxDI2[2]))^((XxDI2[0]^XxDI3[0])&(YxDI1[2]^YxDI2[2]))^((XxDI2[3]^XxDI3[3])&(YxDI1[1]^YxDI2[1]))
	^((XxDI2[1]^XxDI3[1])&(YxDI1[1]^YxDI2[1]))^((XxDI2[2]^XxDI3[2])&(YxDI1[0]^YxDI2[0]))^((XxDI2[0]^XxDI3[0])&(YxDI1[0]^YxDI2[0]))^XxDI1[3]^YxDI1[3]
	^XxDI1[1]^YxDI1[1];
	assign QxDO0[1]=((XxDI2[3]^XxDI3[3])&(YxDI1[3]^YxDI2[3]))^((XxDI2[2]^XxDI3[2])&(YxDI1[3]^YxDI2[3]))^((XxDI2[1]^XxDI3[1])&(YxDI1[3]^YxDI2[3]))
	^((XxDI2[0]^XxDI3[0])&(YxDI1[3]^YxDI2[3]))^((XxDI2[3]^XxDI3[3])&(YxDI1[2]^YxDI2[2]))^((XxDI2[1]^XxDI3[1])&(YxDI1[2]^YxDI2[2]))
	^((XxDI2[3]^XxDI3[3])&(YxDI1[1]^YxDI2[1]))^((XxDI2[2]^XxDI3[2])&(YxDI1[1]^YxDI2[1]))^((XxDI2[1]^XxDI3[1])&(YxDI1[1]^YxDI2[1]))
	^((XxDI2[3]^XxDI3[3])&(YxDI1[0]^YxDI2[0]))^((XxDI2[0]^XxDI3[0])&(YxDI1[0]^YxDI2[0]))^XxDI1[1]^YxDI1[1]^XxDI1[0]^YxDI1[0];
	assign QxDO0[0]=((XxDI2[3]^XxDI3[3])&(YxDI1[3]^YxDI2[3]))^((XxDI2[1]^XxDI3[1])&(YxDI1[3]^YxDI2[3]))^((XxDI2[2]^XxDI3[2])&(YxDI1[2]^YxDI2[2]))
	^((XxDI2[0]^XxDI3[0])&(YxDI1[2]^YxDI2[2]))^((XxDI2[3]^XxDI3[3])&(YxDI1[1]^YxDI2[1]))^((XxDI2[0]^XxDI3[0])&(YxDI1[1]^YxDI2[1]))
	^((XxDI2[2]^XxDI3[2])&(YxDI1[0]^YxDI2[0]))^((XxDI2[1]^XxDI3[1])&(YxDI1[0]^YxDI2[0]))^((XxDI2[0]^XxDI3[0])&(YxDI1[0]^YxDI2[0]))^XxDI1[0]^YxDI1[0];

	assign QxDO1[3]=((XxDI0[3]^XxDI2[3])&(YxDI0[3]^YxDI3[3]))^((XxDI0[1]^XxDI2[1])&(YxDI0[3]^YxDI3[3]))^((XxDI0[0]^XxDI2[0])&(YxDI0[3]^YxDI3[3]))
	^((XxDI0[2]^XxDI2[2])&(YxDI0[2]^YxDI3[2]))^((XxDI0[1]^XxDI2[1])&(YxDI0[2]^YxDI3[2]))^((XxDI0[3]^XxDI2[3])&(YxDI0[1]^YxDI3[1]))
	^((XxDI0[2]^XxDI2[2])&(YxDI0[1]^YxDI3[1]))^((XxDI0[1]^XxDI2[1])&(YxDI0[1]^YxDI3[1]))^((XxDI0[0]^XxDI2[0])&(YxDI0[1]^YxDI3[1]))
	^((XxDI0[3]^XxDI2[3])&(YxDI0[0]^YxDI3[0]))^((XxDI0[1]^XxDI2[1])&(YxDI0[0]^YxDI3[0]))^XxDI0[2]^YxDI0[2]^XxDI0[0]^YxDI0[0];
	assign QxDO1[2]=((XxDI0[2]^XxDI2[2])&(YxDI0[3]^YxDI3[3]))^((XxDI0[1]^XxDI2[1])&(YxDI0[3]^YxDI3[3]))^((XxDI0[3]^XxDI2[3])&(YxDI0[2]^YxDI3[2]))
	^((XxDI0[2]^XxDI2[2])&(YxDI0[2]^YxDI3[2]))^((XxDI0[0]^XxDI2[0])&(YxDI0[2]^YxDI3[2]))^((XxDI0[3]^XxDI2[3])&(YxDI0[1]^YxDI3[1]))
	^((XxDI0[1]^XxDI2[1])&(YxDI0[1]^YxDI3[1]))^((XxDI0[2]^XxDI2[2])&(YxDI0[0]^YxDI3[0]))^((XxDI0[0]^XxDI2[0])&(YxDI0[0]^YxDI3[0]))^XxDI0[3]^YxDI0[3]
	^XxDI0[1]^YxDI0[1];
	assign QxDO1[1]=((XxDI0[3]^XxDI2[3])&(YxDI0[3]^YxDI3[3]))^((XxDI0[2]^XxDI2[2])&(YxDI0[3]^YxDI3[3]))^((XxDI0[1]^XxDI2[1])&(YxDI0[3]^YxDI3[3]))
	^((XxDI0[0]^XxDI2[0])&(YxDI0[3]^YxDI3[3]))^((XxDI0[3]^XxDI2[3])&(YxDI0[2]^YxDI3[2]))^((XxDI0[1]^XxDI2[1])&(YxDI0[2]^YxDI3[2]))
	^((XxDI0[3]^XxDI2[3])&(YxDI0[1]^YxDI3[1]))^((XxDI0[2]^XxDI2[2])&(YxDI0[1]^YxDI3[1]))^((XxDI0[1]^XxDI2[1])&(YxDI0[1]^YxDI3[1]))
	^((XxDI0[3]^XxDI2[3])&(YxDI0[0]^YxDI3[0]))^((XxDI0[0]^XxDI2[0])&(YxDI0[0]^YxDI3[0]))^XxDI0[1]^YxDI0[1]^XxDI0[0]^YxDI0[0];
	assign QxDO1[0]=((XxDI0[3]^XxDI2[3])&(YxDI0[3]^YxDI3[3]))^((XxDI0[1]^XxDI2[1])&(YxDI0[3]^YxDI3[3]))^((XxDI0[2]^XxDI2[2])&(YxDI0[2]^YxDI3[2]))
	^((XxDI0[0]^XxDI2[0])&(YxDI0[2]^YxDI3[2]))^((XxDI0[3]^XxDI2[3])&(YxDI0[1]^YxDI3[1]))^((XxDI0[0]^XxDI2[0])&(YxDI0[1]^YxDI3[1]))
	^((XxDI0[2]^XxDI2[2])&(YxDI0[0]^YxDI3[0]))^((XxDI0[1]^XxDI2[1])&(YxDI0[0]^YxDI3[0]))^((XxDI0[0]^XxDI2[0])&(YxDI0[0]^YxDI3[0]))^XxDI0[0]^YxDI0[0];

	assign QxDO2[3]=((XxDI1[3]^XxDI3[3])&(YxDI0[3]^YxDI3[3]))^((XxDI1[1]^XxDI3[1])&(YxDI0[3]^YxDI3[3]))^((XxDI1[0]^XxDI3[0])&(YxDI0[3]^YxDI3[3]))
	^((XxDI1[2]^XxDI3[2])&(YxDI0[2]^YxDI3[2]))^((XxDI1[1]^XxDI3[1])&(YxDI0[2]^YxDI3[2]))^((XxDI1[3]^XxDI3[3])&(YxDI0[1]^YxDI3[1]))
	^((XxDI1[2]^XxDI3[2])&(YxDI0[1]^YxDI3[1]))^((XxDI1[1]^XxDI3[1])&(YxDI0[1]^YxDI3[1]))^((XxDI1[0]^XxDI3[0])&(YxDI0[1]^YxDI3[1]))
	^((XxDI1[3]^XxDI3[3])&(YxDI0[0]^YxDI3[0]))^((XxDI1[1]^XxDI3[1])&(YxDI0[0]^YxDI3[0]))^XxDI3[2]^YxDI3[2]^XxDI3[0]^YxDI3[0];
	assign QxDO2[2]=((XxDI1[2]^XxDI3[2])&(YxDI0[3]^YxDI3[3]))^((XxDI1[1]^XxDI3[1])&(YxDI0[3]^YxDI3[3]))^((XxDI1[3]^XxDI3[3])&(YxDI0[2]^YxDI3[2]))
	^((XxDI1[2]^XxDI3[2])&(YxDI0[2]^YxDI3[2]))^((XxDI1[0]^XxDI3[0])&(YxDI0[2]^YxDI3[2]))^((XxDI1[3]^XxDI3[3])&(YxDI0[1]^YxDI3[1]))
	^((XxDI1[1]^XxDI3[1])&(YxDI0[1]^YxDI3[1]))^((XxDI1[2]^XxDI3[2])&(YxDI0[0]^YxDI3[0]))^((XxDI1[0]^XxDI3[0])&(YxDI0[0]^YxDI3[0]))^XxDI3[3]^YxDI3[3]
	^XxDI3[1]^YxDI3[1];
	assign QxDO2[1]=((XxDI1[3]^XxDI3[3])&(YxDI0[3]^YxDI3[3]))^((XxDI1[2]^XxDI3[2])&(YxDI0[3]^YxDI3[3]))^((XxDI1[1]^XxDI3[1])&(YxDI0[3]^YxDI3[3]))
	^((XxDI1[0]^XxDI3[0])&(YxDI0[3]^YxDI3[3]))^((XxDI1[3]^XxDI3[3])&(YxDI0[2]^YxDI3[2]))^((XxDI1[1]^XxDI3[1])&(YxDI0[2]^YxDI3[2]))
	^((XxDI1[3]^XxDI3[3])&(YxDI0[1]^YxDI3[1]))^((XxDI1[2]^XxDI3[2])&(YxDI0[1]^YxDI3[1]))^((XxDI1[1]^XxDI3[1])&(YxDI0[1]^YxDI3[1]))
	^((XxDI1[3]^XxDI3[3])&(YxDI0[0]^YxDI3[0]))^((XxDI1[0]^XxDI3[0])&(YxDI0[0]^YxDI3[0]))^XxDI3[1]^YxDI3[1]^XxDI3[0]^YxDI3[0];
	assign QxDO2[0]=((XxDI1[3]^XxDI3[3])&(YxDI0[3]^YxDI3[3]))^((XxDI1[1]^XxDI3[1])&(YxDI0[3]^YxDI3[3]))^((XxDI1[2]^XxDI3[2])&(YxDI0[2]^YxDI3[2]))
	^((XxDI1[0]^XxDI3[0])&(YxDI0[2]^YxDI3[2]))^((XxDI1[3]^XxDI3[3])&(YxDI0[1]^YxDI3[1]))^((XxDI1[0]^XxDI3[0])&(YxDI0[1]^YxDI3[1]))
	^((XxDI1[2]^XxDI3[2])&(YxDI0[0]^YxDI3[0]))^((XxDI1[1]^XxDI3[1])&(YxDI0[0]^YxDI3[0]))^((XxDI1[0]^XxDI3[0])&(YxDI0[0]^YxDI3[0]))^XxDI3[0]^YxDI3[0];

	assign QxDO3[3]=((XxDI0[3]^XxDI1[3])&(YxDI1[3]^YxDI2[3]))^((XxDI0[1]^XxDI1[1])&(YxDI1[3]^YxDI2[3]))^((XxDI0[0]^XxDI1[0])&(YxDI1[3]^YxDI2[3]))
	^((XxDI0[2]^XxDI1[2])&(YxDI1[2]^YxDI2[2]))^((XxDI0[1]^XxDI1[1])&(YxDI1[2]^YxDI2[2]))^((XxDI0[3]^XxDI1[3])&(YxDI1[1]^YxDI2[1]))
	^((XxDI0[2]^XxDI1[2])&(YxDI1[1]^YxDI2[1]))^((XxDI0[1]^XxDI1[1])&(YxDI1[1]^YxDI2[1]))^((XxDI0[0]^XxDI1[0])&(YxDI1[1]^YxDI2[1]))
	^((XxDI0[3]^XxDI1[3])&(YxDI1[0]^YxDI2[0]))^((XxDI0[1]^XxDI1[1])&(YxDI1[0]^YxDI2[0]))^XxDI2[2]^YxDI2[2]^XxDI2[0]^YxDI2[0];
	assign QxDO3[2]=((XxDI0[2]^XxDI1[2])&(YxDI1[3]^YxDI2[3]))^((XxDI0[1]^XxDI1[1])&(YxDI1[3]^YxDI2[3]))^((XxDI0[3]^XxDI1[3])&(YxDI1[2]^YxDI2[2]))
	^((XxDI0[2]^XxDI1[2])&(YxDI1[2]^YxDI2[2]))^((XxDI0[0]^XxDI1[0])&(YxDI1[2]^YxDI2[2]))^((XxDI0[3]^XxDI1[3])&(YxDI1[1]^YxDI2[1]))
	^((XxDI0[1]^XxDI1[1])&(YxDI1[1]^YxDI2[1]))^((XxDI0[2]^XxDI1[2])&(YxDI1[0]^YxDI2[0]))^((XxDI0[0]^XxDI1[0])&(YxDI1[0]^YxDI2[0]))^XxDI2[3]^YxDI2[3]
	^XxDI2[1]^YxDI2[1];
	assign QxDO3[1]=((XxDI0[3]^XxDI1[3])&(YxDI1[3]^YxDI2[3]))^((XxDI0[2]^XxDI1[2])&(YxDI1[3]^YxDI2[3]))^((XxDI0[1]^XxDI1[1])&(YxDI1[3]^YxDI2[3]))
	^((XxDI0[0]^XxDI1[0])&(YxDI1[3]^YxDI2[3]))^((XxDI0[3]^XxDI1[3])&(YxDI1[2]^YxDI2[2]))^((XxDI0[1]^XxDI1[1])&(YxDI1[2]^YxDI2[2]))
	^((XxDI0[3]^XxDI1[3])&(YxDI1[1]^YxDI2[1]))^((XxDI0[2]^XxDI1[2])&(YxDI1[1]^YxDI2[1]))^((XxDI0[1]^XxDI1[1])&(YxDI1[1]^YxDI2[1]))
	^((XxDI0[3]^XxDI1[3])&(YxDI1[0]^YxDI2[0]))^((XxDI0[0]^XxDI1[0])&(YxDI1[0]^YxDI2[0]))^XxDI2[1]^YxDI2[1]^XxDI2[0]^YxDI2[0];
	assign QxDO3[0]=((XxDI0[3]^XxDI1[3])&(YxDI1[3]^YxDI2[3]))^((XxDI0[1]^XxDI1[1])&(YxDI1[3]^YxDI2[3]))^((XxDI0[2]^XxDI1[2])&(YxDI1[2]^YxDI2[2]))
	^((XxDI0[0]^XxDI1[0])&(YxDI1[2]^YxDI2[2]))^((XxDI0[3]^XxDI1[3])&(YxDI1[1]^YxDI2[1]))^((XxDI0[0]^XxDI1[0])&(YxDI1[1]^YxDI2[1]))
	^((XxDI0[2]^XxDI1[2])&(YxDI1[0]^YxDI2[0]))^((XxDI0[1]^XxDI1[1])&(YxDI1[0]^YxDI2[0]))^((XxDI0[0]^XxDI1[0])&(YxDI1[0]^YxDI2[0]))^XxDI2[0]^YxDI2[0];

endmodule
