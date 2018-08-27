`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:55 01/22/2018 
// Design Name: 
// Module Name:    lin_map 
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
//linear mapping at input
module lin_map ( 
   input [7:0] A,
   output [7:0] B
   );
  
  wire R1, R2, R3, R4, R5, R6, R7, R8, R9;
  
  assign R1 = A[7] ^ A[5] ;
  assign R2 = A[7] ^ A[4] ;
  assign R3 = A[6] ^ A[0] ;
  assign R4 = A[5] ^ R3 ;
  assign R5 = A[4] ^ R4 ;
  assign R6 = A[3] ^ A[0] ;
  assign R7 = A[2] ^ R1 ;
  assign R8 = A[1] ^ R3 ;
  assign R9 = A[3] ^ R8 ;
  assign B[7] = R7 ^ R8 ;
  assign B[6] = R5 ;
  assign B[5] = A[1] ^ R4 ;
  assign B[4] = R1 ^ R3 ;
  assign B[3] = A[1] ^ R2 ^ R6 ;
  assign B[2] =  A[0] ;
  assign B[1] = R4 ;
  assign B[0] = A[2] ^ R9 ;
  
endmodule 
