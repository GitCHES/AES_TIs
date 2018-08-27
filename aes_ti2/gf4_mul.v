`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:31:43 01/22/2018 
// Design Name: 
// Module Name:    gf4_mul 
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
//multiplier in gf2^4 
module gf4_mul(
   input [3:0]  AxDI,
   input [3:0]  BxDI,
   output reg[3:0] QxDO
	);
	
	reg [3:0]      A;
	reg [3:0]      B;
	reg [3:0]      Q_norm;
	reg [1:0]      PH;
	reg [1:0]      PL;
	reg [1:0]      P;
	reg [1:0]      AA;
	reg [1:0]      BB;
	
	always @(AxDI or BxDI)
	begin
	   A[3] = AxDI[3];
		A[2] = AxDI[2];
		A[1] = AxDI[1];
      A[0] = AxDI[0];
            
      B[3] = BxDI[3];
      B[2] = BxDI[2];
      B[1] = BxDI[1];
      B[0] = BxDI[0];
      
      //Canright:      
      PH[0] = ((A[3] ^ A[2]) & (B[3] ^ B[2])) ^ (A[2] & B[2]);
      PH[1] = ((A[3] ^ A[2]) & (B[3] ^ B[2])) ^ (A[3] & B[3]);
            
      PL[0] = ((A[1] ^ A[0]) & (B[1] ^ B[0])) ^ (A[0] & B[0]);
      PL[1] = ((A[1] ^ A[0]) & (B[1] ^ B[0])) ^ (A[1] & B[1]);
            
      AA = ({A[3], A[2]}) ^ ({A[1], A[0]});
      BB = ({B[3], B[2]}) ^ ({B[1], B[0]});
            
      P[1] = ((AA[1] ^ AA[0]) & (BB[1] ^ BB[0])) ^ (AA[0] & BB[0]);
      P[0] = ((AA[1] ^ AA[0]) & (BB[1] ^ BB[0])) ^ (AA[1] & BB[1]) ^ P[1];
            
      Q_norm = {(PH ^ P), (PL ^ P)};
            
		//Bilgin:
      //Q_norm(3) := (A(3) and B(3) ) xor ( A(1) and B(3) ) xor ( A(0) and B(3) ) xor ( A(2) and B(2) ) xor ( A(1) and B(2)) xor (A(3) and B(1) ) xor ( A(2) and B(1) ) xor ( A(1) and B(1) ) xor ( A(0) and B(1) ) xor ( A(3) and B(0)) xor (A(1) and B(0) );
      //Q_norm(2) := (A(2) and B(3) ) xor ( A(1) and B(3) ) xor ( A(3) and B(2) ) xor ( A(2) and B(2) ) xor ( A(0) and B(2)) xor (A(3) and B(1) ) xor ( A(1) and B(1) ) xor ( A(2) and B(0) ) xor ( A(0) and B(0) );
      //Q_norm(1) := (A(3) and B(3) ) xor ( A(2) and B(3) ) xor ( A(1) and B(3) ) xor ( A(0) and B(3) ) xor ( A(3) and B(2)) xor (A(1) and B(2) ) xor ( A(3) and B(1) ) xor ( A(2) and B(1) ) xor ( A(1) and B(1) ) xor ( A(3) and B(0)) xor (A(0) and B(0) );
      //Q_norm(0) := (A(3) and B(3) ) xor ( A(1) and B(3) ) xor ( A(2) and B(2) ) xor ( A(0) and B(2) ) xor ( A(3) and B(1)) xor (A(0) and B(1) ) xor ( A(2) and B(0) ) xor ( A(1) and B(0) ) xor ( A(0) and B(0) );
		
      QxDO[3] = Q_norm[3];
      QxDO[2] = Q_norm[2];
      QxDO[1] = Q_norm[1];
      QxDO[0] = Q_norm[0];
   end
  
endmodule
