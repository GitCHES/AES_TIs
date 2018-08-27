`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:39 01/22/2018 
// Design Name: 
// Module Name:    inv_lin_map 
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
//linear mapping at output 
module inv_lin_map (
   input [7:0] C,
   output [7:0] D
   );
	
	wire T1, T2, T3, T4, T5,T6, T7, T8, T9;
	
	assign T1 = C[7] ^ C[3] ;
	assign T2 = C[6] ^ C[4] ;
	assign T3 = C[6] ^ C[0] ;
	assign T4 = C[5] ^ C[3] ;
	assign T5 = C[5] ^ T1 ;
	assign T6 = C[5] ^ C[1] ;
	assign T7 = C[4] ^ T6 ;
	assign T8 = C[2] ^ T4 ;
	assign T9 = C[1] ^ T2 ;
	assign D[7] = T4 ;
	assign D[6] = T1 ;
	assign D[5] = T3 ;
	assign D[4] = T5 ;
	assign D[3] = T2 ^ T5 ;
	assign D[2] = T3 ^ T8 ;
	assign D[1] = T7 ;
	assign D[0] = T9 ;

endmodule

