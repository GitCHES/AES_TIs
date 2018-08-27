`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:37 01/22/2018 
// Design Name: 
// Module Name:    shared_mul_gf4 
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
//shared gf2^4 multiplier using 2 shares
module shared_mul_gf4(
   input [3:0]  XxDI0,
	input [3:0]  XxDI1,
   input [3:0]  YxDI0,
   input [3:0]  YxDI1,
   input [3:0]  ZxDI,
   output [3:0] QxDO0,
   output [3:0] QxDO1,
	output [3:0] QxDO2,
	output [3:0] QxDO3
	);
   
   wire [3:0]   Xi_mul_Yj0;
   wire [3:0]   Xi_mul_Yj1;
	wire [3:0]   Xi_mul_Yj2;
	wire [3:0]   Xi_mul_Yj3;
	
   gf4_mul  gf4_mul1(.AxDI(XxDI0), .BxDI(YxDI0), .QxDO(Xi_mul_Yj0));
   gf4_mul  gf4_mul2(.AxDI(XxDI0), .BxDI(YxDI1), .QxDO(Xi_mul_Yj1));
	gf4_mul  gf4_mul3(.AxDI(XxDI1), .BxDI(YxDI0), .QxDO(Xi_mul_Yj2));
	gf4_mul  gf4_mul4(.AxDI(XxDI1), .BxDI(YxDI1), .QxDO(Xi_mul_Yj3));
	
   assign  QxDO0 = Xi_mul_Yj0;
   assign  QxDO1 = Xi_mul_Yj1 ^ ZxDI;
   assign  QxDO2 = Xi_mul_Yj2 ^ ZxDI;
   assign  QxDO3 = Xi_mul_Yj3;

endmodule
