`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:10 01/22/2018 
// Design Name: 
// Module Name:    unshared_sbox 
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
//unshared_sbox for aes key schedule
module unshared_sbox(
  input  [7:0]  text_in,   //Sbox input 
  output [7:0]  text_out   //Sbox output
  );
  
   wire [7:0]   mappedxD0;
   wire [3:0]   Y1xD0;
   wire [3:0]   Y0xD0;
   wire [3:0]   Y0xorY1xD0;
   wire [3:0]   Y0mulY1xD0;
   wire [3:0]   InverterInxD0;
   wire [3:0]   InverterOutxD0;
   wire [3:0]   InverseMSBxD0;
   wire [3:0]   InverseLSBxD0;
   wire [7:0]   InvUnmappedxD0;
   wire [7:0]   InvMappedxD0;
	wire [3:0]   Y0xorY12xD0;           
	
	//linear mapping at input
	lin_map input_mapping7(.A(text_in), .B(mappedxD0));
	
	//input is split up in Y1 and Y0
	assign  Y1xD0[3:0] = mappedxD0[7:4];
   assign  Y0xD0[3:0] = mappedxD0[3:0];
	
	assign  Y0xorY1xD0 = Y1xD0 ^ Y0xD0;
	
	//square_scaler
	square_scaler square_scaler(.DataInxDI(Y0xorY1xD0), .DataOutxDO(Y0xorY12xD0));
	
	//multiply Y1 and Y0 (GF 2^4)
	gf4_mul  gf4_mul7(.AxDI(Y1xD0), .BxDI(Y0xD0), .QxDO(Y0mulY1xD0));
  
   assign  InverterInxD0 = Y0xorY12xD0 ^ Y0mulY1xD0;
	
	//unshared inverter in gf2^4
	unshared_inv unshared_inv(.XxDI0(InverterInxD0), .QxDO0(InverterOutxD0));
	
	//multiply Inv and Y0
	gf4_mul  gf4_mul8(.AxDI(InverterOutxD0), .BxDI(Y0xD0), .QxDO(InverseMSBxD0));
	
	//multiply Inv and Y1
	gf4_mul  gf4_mul9(.AxDI(InverterOutxD0), .BxDI(Y1xD0), .QxDO(InverseLSBxD0));
				 
   assign InvUnmappedxD0 = {InverseMSBxD0, InverseLSBxD0};
	
 	//linear mapping at output        
   inv_lin_map output_mapping7(.C(InvUnmappedxD0), .D(InvMappedxD0));   
				
	assign  text_out[ 7:  0] = InvMappedxD0  ^ 8'b01100011;

endmodule
