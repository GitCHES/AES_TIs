`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:22:11 01/22/2018 
// Design Name: 
// Module Name:    square_scaler 
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
//square_scaler
module square_scaler( 
   input [3:0]  DataInxDI,
   output  [3:0] DataOutxDO
	);
	
   assign   DataOutxDO[3] = DataInxDI[0] ^ DataInxDI[2];
   assign   DataOutxDO[2] = DataInxDI[1] ^ DataInxDI[3];
   assign   DataOutxDO[1] = DataInxDI[1] ^ DataInxDI[0];
   assign   DataOutxDO[0] = DataInxDI[0];
   
endmodule
