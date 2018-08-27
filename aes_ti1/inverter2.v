`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:45:21 01/22/2018 
// Design Name: 
// Module Name:    inverter2 
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
//the second stage shared gf2^4 inverter 
module inverter2(
   input [3:0]  XxDI0,
	input [3:0]  XxDI1,
	input [3:0]  XxDI2,
	input [3:0]  XxDI3,
   input [3:0]  QxDO0,
	input [3:0]  QxDO2,
   output  [3:0] QxDO1,
	output  [3:0] QxDO3
	);
	
   assign QxDO1[3] = QxDO0[3] ^ (XxDI0[2] & (XxDI2[1] ^ XxDI3[1] ) & (XxDI2[0] ^ XxDI3[0] )) ^ (XxDI0[1] & (XxDI2[2] ^ XxDI3[2] ) & (XxDI2[0] ^ XxDI3[0] )) 
	   ^ (XxDI0[0] & (XxDI2[2] ^ XxDI3[2] ) & (XxDI2[1] ^ XxDI3[1] )) ^ (XxDI0[2] & XxDI0[1] & (XxDI2[0] ^ XxDI3[0] )) 
		^ (XxDI0[2] & XxDI0[0] & (XxDI2[1] ^ XxDI3[1] )) ^ (XxDI0[1] & XxDI0[0] & (XxDI2[2] ^ XxDI3[2] )) ^ (XxDI0[2] & XxDI0[1] & XxDI0[0]) 
	   ^ (XxDI0[2] & (XxDI2[1] ^ XxDI3[1] )) ^ (XxDI0[1] & (XxDI2[2] ^ XxDI3[2] )) ^ (XxDI0[2] & XxDI0[1]) ^ XxDI2[0]
	   ^ (XxDI0[3] & (XxDI2[1] ^ XxDI3[1] )) ^ (XxDI0[1] & (XxDI2[3] ^ XxDI3[3] )) ^ (XxDI0[3] & XxDI0[1]) ^XxDI2[1];
   assign QxDO3[3] = QxDO2[3] ^ (XxDI0[2] & XxDI1[1] & XxDI2[0]) ^ (XxDI0[2] & XxDI2[1] & XxDI1[0]) ^ (XxDI1[2] & XxDI0[1] & XxDI2[0]) 
	   ^ (XxDI1[2] & XxDI2[1] & XxDI0[0]) ^ (XxDI2[2] & XxDI0[1] & XxDI1[0]) ^ (XxDI2[2] & XxDI1[1] & XxDI0[0]) ^ XxDI0[0] ^ XxDI0[1];

   assign QxDO1[2] = QxDO0[2] ^(XxDI0[3] & (XxDI2[1] ^ XxDI3[1] ) & (XxDI2[0] ^ XxDI3[0] )) ^ (XxDI0[1] & (XxDI2[3] ^ XxDI3[3] ) & (XxDI2[0] ^ XxDI3[0] )) 
	   ^ (XxDI0[0] & (XxDI2[3] ^ XxDI3[3] ) & (XxDI2[1] ^ XxDI3[1] )) ^ (XxDI0[3] & XxDI0[1] & (XxDI2[0] ^ XxDI3[0] )) 
		^ (XxDI0[3] & XxDI0[0] & (XxDI2[1] ^ XxDI3[1] )) ^ (XxDI0[1] & XxDI0[0] & (XxDI2[3] ^ XxDI3[3] )) ^ (XxDI0[3] & XxDI0[1] & XxDI0[0]) 
	   ^ (XxDI0[3] & (XxDI2[1] ^ XxDI3[1] )) ^ (XxDI0[1] & (XxDI2[3] ^ XxDI3[3] )) ^ (XxDI0[3] & XxDI0[1]) ^ XxDI2[0]
	   ^ (XxDI0[2] & (XxDI2[0] ^ XxDI3[0] )) ^ (XxDI0[0] & (XxDI2[2] ^ XxDI3[2] )) ^ (XxDI0[2] & XxDI0[0]) 
	   ^ (XxDI0[2] & (XxDI2[1] ^ XxDI3[1] )) ^ (XxDI0[1] & (XxDI2[2] ^ XxDI3[2] )) ^ (XxDI0[2] & XxDI0[1]) ;
   assign QxDO3[2] = QxDO2[2] ^(XxDI0[3] & XxDI1[1] & XxDI2[0]) ^ (XxDI0[3] & XxDI2[1] & XxDI1[0]) ^ (XxDI1[3] & XxDI0[1] & XxDI2[0]) 
	   ^ (XxDI1[3] & XxDI2[1] & XxDI0[0]) ^ (XxDI2[3] & XxDI0[1] & XxDI1[0]) ^ (XxDI2[3] & XxDI1[1] & XxDI0[0]) ^ XxDI0[0];

	assign QxDO1[1] = QxDO0[1] ^(XxDI0[3] & (XxDI2[0] ^ XxDI3[0] ) & (XxDI2[2] ^ XxDI3[2] )) ^ (XxDI0[0] & (XxDI2[3] ^ XxDI3[3] ) & (XxDI2[2] ^ XxDI3[2] )) 
	   ^ (XxDI0[2] & (XxDI2[3] ^ XxDI3[3] ) & (XxDI2[0] ^ XxDI3[0] )) ^ (XxDI0[3] & XxDI0[0] & (XxDI2[2] ^ XxDI3[2] )) 
		^ (XxDI0[3] & XxDI0[2] & (XxDI2[0] ^ XxDI3[0] )) ^ (XxDI0[0] & XxDI0[2] & (XxDI2[3] ^ XxDI3[3] )) ^ (XxDI0[3] & XxDI0[0] & XxDI0[2]) 
	   ^ (XxDI0[3] & (XxDI2[0] ^ XxDI3[0] )) ^ (XxDI0[0] & (XxDI2[3] ^ XxDI3[3] )) ^ (XxDI0[3] & XxDI0[0]) ^ XxDI2[2]
	   ^ (XxDI0[3] & (XxDI2[1] ^ XxDI3[1] )) ^ (XxDI0[1] & (XxDI2[3] ^ XxDI3[3] )) ^ (XxDI0[3] & XxDI0[1]) ^ XxDI2[3];
   assign QxDO3[1] = QxDO2[1] ^ (XxDI0[3] & XxDI1[0] & XxDI2[2]) ^ (XxDI0[3] & XxDI2[0] & XxDI1[2]) ^ (XxDI1[3] & XxDI0[0] & XxDI2[2]) 
	   ^ (XxDI1[3] & XxDI2[0] & XxDI0[2]) ^ (XxDI2[3] & XxDI0[0] & XxDI1[2]) ^ (XxDI2[3] & XxDI1[0] & XxDI0[2]) ^ XxDI0[2]^ XxDI0[3];

	assign QxDO1[0] = QxDO0[0] ^(XxDI0[3] & (XxDI2[1] ^ XxDI3[1] ) & (XxDI2[2] ^ XxDI3[2] )) ^ (XxDI0[1] & (XxDI2[3] ^ XxDI3[3] ) & (XxDI2[2] ^ XxDI3[2] )) 
	   ^ (XxDI0[2] & (XxDI2[3] ^ XxDI3[3] ) & (XxDI2[1] ^ XxDI3[1] )) ^ (XxDI0[3] & XxDI0[1] & (XxDI2[2] ^ XxDI3[2] )) 
		^ (XxDI0[3] & XxDI0[2] & (XxDI2[1] ^ XxDI3[1] )) ^ (XxDI0[1] & XxDI0[2] & (XxDI2[3] ^ XxDI3[3] )) ^ (XxDI0[3] & XxDI0[1] & XxDI0[2]) 
	   ^ (XxDI0[3] & (XxDI2[1] ^ XxDI3[1] )) ^ (XxDI0[1] & (XxDI2[3] ^ XxDI3[3] )) ^ (XxDI0[3] & XxDI0[1]) ^ XxDI2[2]
	   ^ (XxDI0[3] & (XxDI2[0] ^ XxDI3[0] )) ^ (XxDI0[0] & (XxDI2[3] ^ XxDI3[3] )) ^ (XxDI0[3] & XxDI0[0]) 
	   ^ (XxDI0[2] & (XxDI2[0] ^ XxDI3[0] )) ^ (XxDI0[0] & (XxDI2[2] ^ XxDI3[2] )) ^ (XxDI0[2] & XxDI0[0]) ;
   assign QxDO3[0] = QxDO2[0] ^ (XxDI0[3] & XxDI1[1] & XxDI2[2]) ^ (XxDI0[3] & XxDI2[1] & XxDI1[2]) ^ (XxDI1[3] & XxDI0[1] & XxDI2[2]) 
	   ^ (XxDI1[3] & XxDI2[1] & XxDI0[2]) ^ (XxDI2[3] & XxDI0[1] & XxDI1[2]) ^ (XxDI2[3] & XxDI1[1] & XxDI0[2]) ^ XxDI0[2];

      
endmodule