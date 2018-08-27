`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:56:33 01/22/2018 
// Design Name: 
// Module Name:    mix_columns 
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
//perform Mixcolumns
module mix_columns(
   input [7:0]  A0xDI,
   input [7:0]  A1xDI,
   input [7:0]  A2xDI,
   input [7:0]  A3xDI,
   output [7:0] B0xDO,
   output [7:0] B1xDO,
   output [7:0] B2xDO,
   output [7:0] B3xDO
);	

      wire [7:0]    a0_mul_2;
      wire [7:0]    a1_mul_2;
      wire [7:0]    a2_mul_2;
      wire [7:0]    a3_mul_2;
      wire [7:0]    a0_mul_3;
      wire [7:0]    a1_mul_3;
      wire [7:0]    a2_mul_3;
      wire [7:0]    a3_mul_3;
      assign a0_mul_2[0] = A0xDI[7];
      assign a0_mul_2[1] = A0xDI[0] ^ A0xDI[7];
      assign a0_mul_2[2] = A0xDI[1];
      assign a0_mul_2[3] = A0xDI[2] ^ A0xDI[7];
      assign a0_mul_2[4] = A0xDI[3] ^ A0xDI[7];
      assign a0_mul_2[5] = A0xDI[4];
      assign a0_mul_2[6] = A0xDI[5];
      assign a0_mul_2[7] = A0xDI[6];
      
      assign a1_mul_2[0] = A1xDI[7];
      assign a1_mul_2[1] = A1xDI[0] ^ A1xDI[7];
      assign a1_mul_2[2] = A1xDI[1];
      assign a1_mul_2[3] = A1xDI[2] ^ A1xDI[7];
      assign a1_mul_2[4] = A1xDI[3] ^ A1xDI[7];
      assign a1_mul_2[5] = A1xDI[4];
      assign a1_mul_2[6] = A1xDI[5];
      assign a1_mul_2[7] = A1xDI[6];
      
      assign a2_mul_2[0] = A2xDI[7];
      assign a2_mul_2[1] = A2xDI[0] ^ A2xDI[7];
      assign a2_mul_2[2] = A2xDI[1];
      assign a2_mul_2[3] = A2xDI[2] ^ A2xDI[7];
      assign a2_mul_2[4] = A2xDI[3] ^ A2xDI[7];
      assign a2_mul_2[5] = A2xDI[4];
      assign a2_mul_2[6] = A2xDI[5];
      assign a2_mul_2[7] = A2xDI[6];
      
      assign a3_mul_2[0] = A3xDI[7];
      assign a3_mul_2[1] = A3xDI[0] ^ A3xDI[7];
      assign a3_mul_2[2] = A3xDI[1];
      assign a3_mul_2[3] = A3xDI[2] ^ A3xDI[7];
      assign a3_mul_2[4] = A3xDI[3] ^ A3xDI[7];
      assign a3_mul_2[5] = A3xDI[4];
      assign a3_mul_2[6] = A3xDI[5];
      assign a3_mul_2[7] = A3xDI[6];
      
      assign a0_mul_3 = a0_mul_2 ^ A0xDI;   
      assign a1_mul_3 = a1_mul_2 ^ A1xDI;
      assign a2_mul_3 = a2_mul_2 ^ A2xDI;
      assign a3_mul_3 = a3_mul_2 ^ A3xDI;
		
      assign B0xDO = a0_mul_2 ^ a1_mul_3 ^ A2xDI ^ A3xDI;    
      assign B1xDO = A0xDI ^ a1_mul_2 ^ a2_mul_3 ^ A3xDI;
      assign B2xDO = A0xDI ^ A1xDI ^ a2_mul_2 ^ a3_mul_3;     
      assign B3xDO = a0_mul_3 ^ A1xDI ^ A2xDI ^ a3_mul_2;
   
endmodule