`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:55:55 01/22/2018 
// Design Name: 
// Module Name:    aes_key_regs 
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
//key register 
module aes_key_regs(
   input        ClkxCI,
   input        RstxBI,
   input [7:0]  KeyInxDI,   //key in
	input        forthcylies,   //cycle 4
   input        KeySchedulexSI,   //do Sbox 
   output reg [7:0] KeyOutxDO,   //key out
   output reg [7:0] KeyToSboxOutxDO,   //enter Sbox 
   output reg [7:0] K03xDO   //for key schedule
	);
   
   reg [7:0]    K00xDN;
   reg [7:0]    K00xDP;
   reg [7:0]    K01xDN;
   reg [7:0]    K01xDP;
   reg [7:0]    K02xDN;
   reg [7:0]    K02xDP;
   reg [7:0]    K03xDN;
   reg [7:0]    K03xDP;
   reg [7:0]    K10xDN;
   reg [7:0]    K10xDP;
   reg [7:0]    K11xDN;
   reg [7:0]    K11xDP;
   reg [7:0]    K12xDN;
   reg [7:0]    K12xDP;
   reg [7:0]    K13xDN;
   reg [7:0]    K13xDP;
   reg [7:0]    K20xDN;
   reg [7:0]    K20xDP;
   reg [7:0]    K21xDN;
   reg [7:0]    K21xDP;
   reg [7:0]    K22xDN;
   reg [7:0]    K22xDP;
   reg [7:0]    K23xDN;
   reg [7:0]    K23xDP;
   reg [7:0]    K30xDN;
   reg [7:0]    K30xDP;
   reg [7:0]    K31xDN;
   reg [7:0]    K31xDP;
   reg [7:0]    K32xDN;
   reg [7:0]    K32xDP;
   reg [7:0]    K33xDN;
   reg [7:0]    K33xDP;
   
   
   always @(K00xDP or K01xDP or K02xDP or K03xDP or K10xDP or K11xDP or K12xDP or K13xDP or K20xDP or K21xDP or K22xDP or K23xDP
      or K30xDP or K31xDP or K32xDP or K33xDP or KeyInxDI or KeySchedulexSI or forthcylies)
   begin
      KeyOutxDO = K00xDP;	
     
	   //output for key schedule
      K03xDO = K03xDP;
      
		//output for Sbox
		if (forthcylies == 1'b1)
		KeyToSboxOutxDO = K12xDP;
		else 
      KeyToSboxOutxDO = K13xDP;
				
      //do key schedule
      if (KeySchedulexSI == 1'b1)
      begin
         K00xDN = K00xDP;
         K01xDN = K01xDP;
         K02xDN = K02xDP;
         K03xDN = K03xDP;
         K10xDN = K10xDP;
         K11xDN = K11xDP;
         K12xDN = K12xDP;
         K13xDN = K13xDP;
         K20xDN = K20xDP;
         K21xDN = K21xDP;
         K22xDN = K22xDP;
         K23xDN = K23xDP;
         K30xDN = K30xDP;
         K31xDN = K31xDP;
         K32xDN = K32xDP;
         K33xDN = K33xDP;
      end
      else
      begin
		//Normal register movement
         K00xDN = K10xDP;
         K01xDN = K11xDP;
         K02xDN = K12xDP;
         K03xDN = K13xDP;
         K10xDN = K20xDP;
         K11xDN = K21xDP;
         K12xDN = K22xDP;
         K13xDN = K23xDP;
         K20xDN = K30xDP;
         K21xDN = K31xDP;
         K22xDN = K32xDP;
         K23xDN = K33xDP;
         K30xDN = K01xDP;
         K31xDN = K02xDP;
         K32xDN = K03xDP;
         K33xDN = KeyInxDI;
      end
   end
    
   always @(posedge ClkxCI or negedge RstxBI)
   begin
      if (RstxBI == 1'b0)
      begin
         K00xDP <= {8{1'b0}};
         K01xDP <= {8{1'b0}};
         K02xDP <= {8{1'b0}};
         K03xDP <= {8{1'b0}};
         K10xDP <= {8{1'b0}};
         K11xDP <= {8{1'b0}};
         K12xDP <= {8{1'b0}};
         K13xDP <= {8{1'b0}};
         K20xDP <= {8{1'b0}};
         K21xDP <= {8{1'b0}};
         K22xDP <= {8{1'b0}};
         K23xDP <= {8{1'b0}};
         K30xDP <= {8{1'b0}};
         K31xDP <= {8{1'b0}};
         K32xDP <= {8{1'b0}};
         K33xDP <= {8{1'b0}};
      end
      else 
      begin
         K00xDP <= K00xDN;
         K01xDP <= K01xDN;
         K02xDP <= K02xDN;
         K03xDP <= K03xDN;
         K10xDP <= K10xDN;
         K11xDP <= K11xDN;
         K12xDP <= K12xDN;
         K13xDP <= K13xDN;
         K20xDP <= K20xDN;
         K21xDP <= K21xDN;
         K22xDP <= K22xDN;
         K23xDP <= K23xDN;
         K30xDP <= K30xDN;
         K31xDP <= K31xDN;
         K32xDP <= K32xDN;
         K33xDP <= K33xDN;
      end
   end
   
endmodule
