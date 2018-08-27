`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:42:38 01/22/2018 
// Design Name: 
// Module Name:    inverter 
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
//the first stage shared gf2^4 inverter 
module inverter1(
   input [3:0]  XxDI0,
	input [3:0]  XxDI1,
	input [3:0]  XxDI2,
	input [3:0]  XxDI3,
   output  [3:0] QxDO0,
	output  [3:0] QxDO2
	);
	
	assign QxDO0[3] = ((XxDI1[2] ^ XxDI2[2] ^ XxDI3[2] ) & (XxDI1[1] ^ XxDI2[1] ^ XxDI3[1] ) & (XxDI1[0] ^ XxDI2[0] ^ XxDI3[0] )) 
	   ^ ((XxDI1[2] ^ XxDI2[2] ^ XxDI3[2] ) & (XxDI1[1] ^ XxDI2[1] ^ XxDI3[1] )) ^ XxDI1[0] 
	   ^((XxDI1[3] ^ XxDI2[3] ^ XxDI3[3] ) & (XxDI1[1] ^ XxDI2[1] ^ XxDI3[1] )) ^ XxDI1[1];
   assign QxDO2[3] = (XxDI0[2] & XxDI0[1] & XxDI1[0]) ^ (XxDI0[2] & XxDI1[1] & XxDI0[0]) ^ (XxDI1[2] & XxDI0[1] & XxDI0[0]) 
	   ^ (XxDI0[2] & XxDI1[1] & XxDI1[0]) ^ (XxDI1[2] & XxDI0[1] & XxDI1[0]) ^ (XxDI1[2] & XxDI1[1] & XxDI0[0]) 
		^ (XxDI0[2] & XxDI1[1] & XxDI3[0]) ^ (XxDI1[2] & XxDI0[1] & XxDI3[0]) ^ (XxDI0[2] & XxDI3[1] & XxDI1[0]) 
		^ (XxDI1[2] & XxDI3[1] & XxDI0[0]) ^ (XxDI3[2] & XxDI0[1] & XxDI1[0]) ^ (XxDI3[2] & XxDI1[1] & XxDI0[0]) 
		^ (XxDI0[2] & XxDI1[1]) ^ (XxDI0[1] & XxDI1[2]) ^ XxDI3[0] ^ (XxDI0[3] & XxDI1[1]) ^ (XxDI0[1] & XxDI1[3]) ^ XxDI3[1];
 
   assign QxDO0[2]  = ((XxDI1[3] ^ XxDI2[3] ^ XxDI3[3] ) & (XxDI1[1] ^ XxDI2[1] ^ XxDI3[1] ) & (XxDI1[0] ^ XxDI2[0] ^ XxDI3[0] )) 
	   ^ ((XxDI1[3] ^ XxDI2[3] ^ XxDI3[3] ) & (XxDI1[1] ^ XxDI2[1] ^ XxDI3[1] )) ^ XxDI1[0]
      ^((XxDI1[2] ^ XxDI2[2] ^ XxDI3[2] ) & (XxDI1[0] ^ XxDI2[0] ^ XxDI3[0] )) 
		^((XxDI1[2] ^ XxDI2[2] ^ XxDI3[2] ) & (XxDI1[1] ^ XxDI2[1] ^ XxDI3[1] )) ;
   assign QxDO2[2]= (XxDI0[3] & XxDI0[1] & XxDI1[0]) ^ (XxDI0[3] & XxDI1[1] & XxDI0[0]) ^ (XxDI1[3] & XxDI0[1] & XxDI0[0]) 
	   ^ (XxDI0[3] & XxDI1[1] & XxDI1[0]) ^ (XxDI1[3] & XxDI0[1] & XxDI1[0]) ^ (XxDI1[3] & XxDI1[1] & XxDI0[0]) 
		^ (XxDI0[3] & XxDI1[1] & XxDI3[0]) ^ (XxDI1[3] & XxDI0[1] & XxDI3[0]) ^ (XxDI0[3] & XxDI3[1] & XxDI1[0]) 
		^ (XxDI1[3] & XxDI3[1] & XxDI0[0]) ^ (XxDI3[3] & XxDI0[1] & XxDI1[0]) ^ (XxDI3[3] & XxDI1[1] & XxDI0[0]) 
		^ (XxDI0[3] & XxDI1[1]) ^ (XxDI0[1] & XxDI1[3]) ^ XxDI3[0] ^ (XxDI0[2] & XxDI1[0]) ^ (XxDI0[0] & XxDI1[2]) 
		^ (XxDI0[2] & XxDI1[1]) ^ (XxDI0[1] & XxDI1[2]) ;
 
	assign QxDO0[1] = ((XxDI1[3] ^ XxDI2[3] ^ XxDI3[3] ) & (XxDI1[0] ^ XxDI2[0] ^ XxDI3[0] ) & (XxDI1[2] ^ XxDI2[2] ^ XxDI3[2] )) 
	   ^ ((XxDI1[3] ^ XxDI2[3] ^ XxDI3[3] ) & (XxDI1[0] ^ XxDI2[0] ^ XxDI3[0] )) ^ XxDI1[2]
      ^((XxDI1[3] ^ XxDI2[3] ^ XxDI3[3] ) & (XxDI1[1] ^ XxDI2[1] ^ XxDI3[1] )) ^ XxDI1[3];
   assign QxDO2[1] = (XxDI0[3] & XxDI0[0] & XxDI1[2]) ^ (XxDI0[3] & XxDI1[0] & XxDI0[2]) ^ (XxDI1[3] & XxDI0[0] & XxDI0[2]) 
	   ^ (XxDI0[3] & XxDI1[0] & XxDI1[2]) ^ (XxDI1[3] & XxDI0[0] & XxDI1[2]) ^ (XxDI1[3] & XxDI1[0] & XxDI0[2]) 
		^ (XxDI0[3] & XxDI1[0] & XxDI3[2]) ^ (XxDI1[3] & XxDI0[0] & XxDI3[2]) ^ (XxDI0[3] & XxDI3[0] & XxDI1[2]) 
		^ (XxDI1[3] & XxDI3[0] & XxDI0[2]) ^ (XxDI3[3] & XxDI0[0] & XxDI1[2]) ^ (XxDI3[3] & XxDI1[0] & XxDI0[2]) 
		^ (XxDI0[3] & XxDI1[0]) ^ (XxDI0[0] & XxDI1[3]) ^ XxDI3[2] ^ (XxDI0[3] & XxDI1[1]) ^ (XxDI0[1] & XxDI1[3]) ^ XxDI3[3];
  
	assign QxDO0[0] = ((XxDI1[3] ^ XxDI2[3] ^ XxDI3[3] ) & (XxDI1[1] ^ XxDI2[1] ^ XxDI3[1] ) & (XxDI1[2] ^ XxDI2[2] ^ XxDI3[2] )) 
	   ^ ((XxDI1[3] ^ XxDI2[3] ^ XxDI3[3] ) & (XxDI1[1] ^ XxDI2[1] ^ XxDI3[1] )) ^ XxDI1[2]
      ^((XxDI1[3] ^ XxDI2[3] ^ XxDI3[3] ) & (XxDI1[0] ^ XxDI2[0] ^ XxDI3[0] )) 
		^((XxDI1[2] ^ XxDI2[2] ^ XxDI3[2] ) & (XxDI1[0] ^ XxDI2[0] ^ XxDI3[0] )) ;
   assign QxDO2[0] = (XxDI0[3] & XxDI0[1] & XxDI1[2]) ^ (XxDI0[3] & XxDI1[1] & XxDI0[2]) ^ (XxDI1[3] & XxDI0[1] & XxDI0[2]) 
	   ^ (XxDI0[3] & XxDI1[1] & XxDI1[2]) ^ (XxDI1[3] & XxDI0[1] & XxDI1[2]) ^ (XxDI1[3] & XxDI1[1] & XxDI0[2]) 
		^ (XxDI0[3] & XxDI1[1] & XxDI3[2]) ^ (XxDI1[3] & XxDI0[1] & XxDI3[2]) ^ (XxDI0[3] & XxDI3[1] & XxDI1[2]) 
		^ (XxDI1[3] & XxDI3[1] & XxDI0[2]) ^ (XxDI3[3] & XxDI0[1] & XxDI1[2]) ^ (XxDI3[3] & XxDI1[1] & XxDI0[2]) 
		^ (XxDI0[3] & XxDI1[1]) ^ (XxDI0[1] & XxDI1[3]) ^ XxDI3[2] ^ (XxDI0[3] & XxDI1[0]) ^ (XxDI0[0] & XxDI1[3]) 
		^ (XxDI0[2] & XxDI1[0]) ^ (XxDI0[0] & XxDI1[2]) ;
   
endmodule
