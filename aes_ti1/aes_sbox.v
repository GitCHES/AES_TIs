`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:48:06 01/22/2018 
// Design Name: 
// Module Name:    aes_sbox 
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
//shsred sbox of aes
module aes_sbox(
   input        resetn,      
   input        clock,        
   input [15:0] mask_in,      //16 random bits
   input [7:0]  text_in0,      //input share0
   input [7:0]  text_in1,     //input share0
   output [7:0] text_out0,     //output share0 
   output [7:0] text_out1     //output share0 
   );
  
   wire [3:0]   Zmul1xDI;    //mask for y1*y0
   wire [3:0]   Zmul2xDI;    //mask for y1*y0
   wire [3:0]   Zmul3xDI;    //mask for inv*y0
   wire [3:0]   Zmul4xDI;    //mask for inv*y1
   wire [7:0]   mappedxD0;
	wire [7:0]   mappedxD1;
   wire [3:0]   Y1xD0;
   wire [3:0]   Y1xD1;
   wire [3:0]   Y0xD0;
	wire [3:0]   Y0xD1;
   wire [3:0]   Y0xorY1xD0;
	wire [3:0]   Y0xorY1xD1;
   wire [3:0]   Y0xorY12xD0;
   wire [3:0]   Y0xorY12xD1;
   wire [3:0]   Y0mulY1xD0;
	wire [3:0]   Y0mulY1xD1;
	wire [3:0]   Y0mulY1xD2;
	wire [3:0]   Y0mulY1xD3;
   wire [3:0]   InverterInxD0;
	wire [3:0]   InverterInxD1;
	wire [3:0]   InverterInxD2;
	wire [3:0]   InverterInxD3;
   wire [3:0]   InverterOutxD0;
	wire [3:0]   InverterOutxD1;
	wire [3:0]   InverterOutxD2;
	wire [3:0]   InverterOutxD3;
   wire [3:0]   MulInxD0;
	wire [3:0]   MulInxD1;
   wire [3:0]   InverseMSBxD0;
	wire [3:0]   InverseMSBxD1;
	wire [3:0]   InverseMSBxD2;
	wire [3:0]   InverseMSBxD3;
   wire [3:0]   InverseLSBxD0;
	wire [3:0]   InverseLSBxD1;
	wire [3:0]   InverseLSBxD2;
	wire [3:0]   InverseLSBxD3;
   wire [7:0]   InvUnmappedxD0;
	wire [7:0]   InvUnmappedxD1;
   wire [7:0]   InvMappedxD0;
	wire [7:0]   InvMappedxD1;
	//pipelining registers
	reg [7:0]    mappedxDP0;
	reg [7:0]    mappedxDP1;
   reg [3:0]    Y0_0xDP0;
	reg [3:0]    Y0_0xDP1;
   reg [3:0]    Y0_1xDP0;
   reg [3:0]    Y0_1xDP1;
   reg [3:0]    Y0_2xDP0;
	reg [3:0]    Y0_2xDP1;
   reg [3:0]    Y1_0xDP0;
   reg [3:0]    Y1_0xDP1;
   reg [3:0]    Y1_1xDP0;
	reg [3:0]    Y1_1xDP1;
   reg [3:0]    Y1_2xDP0;
   reg [3:0]    Y1_2xDP1;
   reg [3:0]    Y0xorY12xDP0;
	reg [3:0]    Y0xorY12xDP1;
	reg [3:0]    Y0xorY12xDP2;
   reg [3:0]    Y0mulY1xDP0;
	reg [3:0]    Y0mulY1xDP1;
	reg [3:0]    Y0mulY1xDP2;
	reg [3:0]    Y0mulY1xDP3;
	reg [3:0]    InverterInxDP0;
	reg [3:0]    InverterInxDP1;
	reg [3:0]    InverterInxDP2;
	reg [3:0]    InverterInxDP3;
   reg [3:0]    InverterOutxDP0;
	reg [3:0]    InverterOutxDP1;
	reg [3:0]    InverterOutxDP2;
	reg [3:0]    InverterOutxDP3;
   reg [3:0]    InverseMSBxDP0;
	reg [3:0]    InverseMSBxDP1;
	reg [3:0]    InverseMSBxDP2;
	reg [3:0]    InverseMSBxDP3;
   reg [3:0]    InverseLSBxDP0;
   reg [3:0]    InverseLSBxDP1;
	reg [3:0]    InverseLSBxDP2;
	reg [3:0]    InverseLSBxDP3;
   
   //Add pipelining stage after every stage 
	always @(posedge clock or negedge resetn)
   begin
      if (resetn == 1'b0)  
		begin		
		      mappedxDP0 <= {8{1'b0}};
	         mappedxDP1<= {8{1'b0}};
				Y0xorY12xDP0 <= {4{1'b0}};
				Y0xorY12xDP1 <= {4{1'b0}};  
            Y0xorY12xDP2 <= {4{1'b0}};      
            Y0mulY1xDP0 <= {4{1'b0}};
				Y0mulY1xDP1 <= {4{1'b0}};
				Y0mulY1xDP2 <= {4{1'b0}};
				Y0mulY1xDP3 <= {4{1'b0}};
				InverterInxDP0 <= {4{1'b0}};
				InverterInxDP1 <= {4{1'b0}};
				InverterInxDP2 <= {4{1'b0}};
				InverterInxDP3 <= {4{1'b0}};
            InverterOutxDP0 <= {4{1'b0}};
				InverterOutxDP1 <= {4{1'b0}};
				InverterOutxDP2 <= {4{1'b0}};
				InverterOutxDP3 <= {4{1'b0}};
            InverseMSBxDP0 <= {4{1'b0}};
				InverseMSBxDP1 <= {4{1'b0}};
				InverseMSBxDP2 <= {4{1'b0}};
				InverseMSBxDP3 <= {4{1'b0}};
            InverseLSBxDP0 <= {4{1'b0}};				
            InverseLSBxDP1 <= {4{1'b0}};
            InverseLSBxDP2 <= {4{1'b0}};
				InverseLSBxDP3 <= {4{1'b0}};
      end
      else 
      begin    
            mappedxDP0 <= mappedxD0;
	         mappedxDP1<= mappedxD1;		
            Y0xorY12xDP0 <= Y0xorY12xD0;
            Y0xorY12xDP1 <= Y0xorY12xD1;
				Y0xorY12xDP2 <= Zmul1xDI ^ Zmul2xDI;       
            Y0mulY1xDP0 <= Y0mulY1xD0;
				Y0mulY1xDP1 <= Y0mulY1xD1;
				Y0mulY1xDP2 <= Y0mulY1xD2;
				Y0mulY1xDP3 <= Y0mulY1xD3;
				InverterInxDP0 <= InverterInxD0;
				InverterInxDP1 <= InverterInxD1;
				InverterInxDP2 <= InverterInxD2;
				InverterInxDP3 <= InverterInxD3;
            InverterOutxDP0 <= InverterOutxD0;
				InverterOutxDP1 <= InverterOutxD1;
				InverterOutxDP2 <= InverterOutxD2;
				InverterOutxDP3 <= InverterOutxD3;
            InverseMSBxDP0 <= InverseMSBxD0;
				InverseMSBxDP1 <= InverseMSBxD1;
				InverseMSBxDP2 <= InverseMSBxD2;
				InverseMSBxDP3 <= InverseMSBxD3;
            InverseLSBxDP0 <= InverseLSBxD0;       
            InverseLSBxDP1 <= InverseLSBxD1;
            InverseLSBxDP2 <= InverseLSBxD2;
            InverseLSBxDP3 <= InverseLSBxD3;
      end
   end
   
   //pipelining stage for Y0 and Y1
   always @(posedge clock or negedge resetn)
   begin
      if (resetn == 1'b0)
         begin
            Y0_0xDP0 <= {4{1'b0}};
				Y0_0xDP1 <= {4{1'b0}};
            Y0_1xDP0 <= {4{1'b0}};
				Y0_1xDP1 <= {4{1'b0}};
            Y0_2xDP0 <= {4{1'b0}};
				Y0_2xDP1 <= {4{1'b0}};
            Y1_0xDP0 <= {4{1'b0}};
				Y1_0xDP1 <= {4{1'b0}};
            Y1_1xDP0 <= {4{1'b0}};
				Y1_1xDP1 <= {4{1'b0}};
            Y1_2xDP0 <= {4{1'b0}};		
            Y1_2xDP1 <= {4{1'b0}};
         end
      else 
         begin
            Y0_2xDP0 <= Y0_1xDP0;
            Y0_1xDP0 <= Y0_0xDP0;
            Y0_0xDP0 <= Y0xD0;
            Y1_2xDP0 <= Y1_1xDP0;
            Y1_1xDP0 <= Y1_0xDP0;
            Y1_0xDP0 <= Y1xD0;		
			   Y0_2xDP1 <= Y0_1xDP1;
            Y0_1xDP1 <= Y0_0xDP1;
            Y0_0xDP1 <= Y0xD1;
            Y1_2xDP1 <= Y1_1xDP1;
            Y1_1xDP1 <= Y1_0xDP1;
            Y1_0xDP1 <= Y1xD1;
         end
   end
	
	//randombits
	assign  Zmul1xDI=mask_in[15:12];
   assign  Zmul2xDI=mask_in[11:8];
   assign  Zmul3xDI=mask_in[7:4];
   assign  Zmul4xDI=mask_in[3:0];
    
	//linear mapping at input 
   lin_map input_mapping0(.A(text_in0), .B(mappedxD0));
   lin_map input_mapping1(.A(text_in1), .B(mappedxD1));
	
	//input is split up in Y1 and Y0
	assign  Y1xD0[3:0] = mappedxDP0[7:4];
   assign  Y0xD0[3:0] = mappedxDP0[3:0];
	assign  Y1xD1[3:0] = mappedxDP1[7:4];
   assign  Y0xD1[3:0] = mappedxDP1[3:0];
	
	assign Y0xorY1xD0 = Y1xD0 ^ Y0xD0;
   assign Y0xorY1xD1 = Y1xD1 ^ Y0xD1;
	
   //square_scaler
	square_scaler square_scaler0(.DataInxDI(Y0xorY1xD0), .DataOutxDO(Y0xorY12xD0));
   square_scaler square_scaler1(.DataInxDI(Y0xorY1xD1), .DataOutxDO(Y0xorY12xD1));
   
	//multiply Y1 and Y0 (GF 2^4)
	shared_mul_gf4 mul_y0y1(.XxDI0(Y1xD0),.XxDI1(Y1xD1), .YxDI0(Y0xD0),.YxDI1(Y0xD1), .ZxDI(Zmul1xDI),  .QxDO0(Y0mulY1xD0), .QxDO1(Y0mulY1xD1),
	.QxDO2(Y0mulY1xD2), .QxDO3(Y0mulY1xD3));
 
   //mask the multiplier by 2 4-bit random numbers, and add the xor of the 2 random numbers to one output share of square_scaler 
   assign  InverterInxD0 = Y0xorY12xDP0;
   assign  InverterInxD1 = Y0xorY12xDP1 ^ Y0xorY12xDP2;
   assign  InverterInxD2 = Y0mulY1xDP0 ^ Y0mulY1xDP1 ^ Y0xorY12xDP2;
   assign  InverterInxD3 = Y0mulY1xDP2 ^ Y0mulY1xDP3;

   //the first stage of shared inverter in gf2^4 
   inverter1 inverter_h1(.XxDI0(InverterInxD0),.XxDI1(InverterInxD1),.XxDI2(InverterInxD2),.XxDI3(InverterInxD3), .QxDO0(InverterOutxD0), 
	.QxDO2(InverterOutxD2));
   //the second stage of shared inverter in gf2^4
   inverter2 inverter_h2(.XxDI0(InverterInxDP0),.XxDI1(InverterInxDP1),.XxDI2(InverterInxDP2),.XxDI3(InverterInxDP3), .QxDO0(InverterOutxDP0),
	.QxDO2(InverterOutxDP2), .QxDO1(InverterOutxD1), .QxDO3(InverterOutxD3));
  
   assign    MulInxD0 = InverterOutxDP1;
   assign    MulInxD1 = InverterOutxDP3;

   //shared multiply Inv and Y0
   shared_mul_gf4 mult_msb(.XxDI0(MulInxD0), .XxDI1(MulInxD1), .YxDI0(Y0_2xDP0), .YxDI1(Y0_2xDP1), .ZxDI(Zmul3xDI), .QxDO0(InverseMSBxD0),
	.QxDO1(InverseMSBxD1), .QxDO2(InverseMSBxD2), .QxDO3(InverseMSBxD3));
	//shared multiply Inv and Y1
   shared_mul_gf4 mult_lsb(.XxDI0(MulInxD0), .XxDI1(MulInxD1), .YxDI0(Y1_2xDP0), .YxDI1(Y1_2xDP1), .ZxDI(Zmul4xDI),  .QxDO0(InverseLSBxD0),
	.QxDO1(InverseLSBxD1), .QxDO2(InverseLSBxD2), .QxDO3(InverseLSBxD3));
   
   assign InvUnmappedxD0 = {(InverseMSBxDP0 ^ InverseMSBxDP1), (InverseLSBxDP0 ^ InverseLSBxDP1)};
   assign InvUnmappedxD1 = {(InverseMSBxDP2 ^ InverseMSBxDP3), (InverseLSBxDP2 ^ InverseLSBxDP3)};
   
   //linear mapping at output	
   inv_lin_map output_mapping0(.C(InvUnmappedxD0), .D(InvMappedxD0));       
   inv_lin_map output_mapping1(.C(InvUnmappedxD1), .D(InvMappedxD1));
							
   assign  text_out0[ 7:  0] = InvMappedxD0;
   assign  text_out1[ 7:  0] = InvMappedxD1 ^ 8'b01100011;
   
endmodule