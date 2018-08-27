`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:14 01/22/2018 
// Design Name: 
// Module Name:    new_shared_mul_gf4 
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
//share gf2^4 multiplier with operations in gf2^4 using 4 input shares
module new_shared_mul_gf4(
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
 
	wire [3:0]   Xi_xor_Yj0;
	wire [3:0]   Xi_xor_Yj1;
	wire [3:0]   Xi_xor_Yj2;
	wire [3:0]   Xi_xor_Yj3;
	wire [3:0]   Xi_xor_Yj4;
	wire [3:0]   Xi_xor_Yj5;
   wire [3:0]   Xi_mul_Yj0;
   wire [3:0]   Xi_mul_Yj1;
	wire [3:0]   Xi_mul_Yj2;
	wire [3:0]   Xi_mul_Yj3;
	
	assign Xi_xor_Yj0 = XxDI2 ^XxDI3;
	assign Xi_xor_Yj1 = YxDI1 ^YxDI2;
	assign Xi_xor_Yj2 = XxDI0 ^XxDI2;
	assign Xi_xor_Yj3 = YxDI0 ^YxDI3;
	assign Xi_xor_Yj4 = XxDI1 ^XxDI3;
	assign Xi_xor_Yj5 = XxDI1 ^XxDI0;
	
   gf4_mul  gf4_mul5(.AxDI(Xi_xor_Yj0), .BxDI(Xi_xor_Yj1), .QxDO(Xi_mul_Yj0));
   gf4_mul  gf4_mul6(.AxDI(Xi_xor_Yj2), .BxDI(Xi_xor_Yj3), .QxDO(Xi_mul_Yj1));
	gf4_mul  gf4_mul7(.AxDI(Xi_xor_Yj4), .BxDI(Xi_xor_Yj3), .QxDO(Xi_mul_Yj2));
	gf4_mul  gf4_mul8(.AxDI(Xi_xor_Yj5), .BxDI(Xi_xor_Yj1), .QxDO(Xi_mul_Yj3));

   assign  QxDO0 = Xi_mul_Yj0;
   assign  QxDO1 = Xi_mul_Yj1;
   assign  QxDO2 = Xi_mul_Yj2;
	assign  QxDO3 = Xi_mul_Yj3;

endmodule
