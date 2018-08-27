`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:57:14 01/22/2018 
// Design Name: 
// Module Name:    aes_state_regs1 
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
//state register 
module aes_state_regs(
   input        ClkxCI,
   input        RstxBI,
   input [7:0]  StateInxDI,   //state in
   input        ShiftRowsxSI,   //do StateSHIFTROWSxS
   input        MixColumnsxSI,   //do MixColumns
   output reg[7:0] StateOutxDO   //state output
	);
	
   reg [7:0]    S00xDN;
   reg [7:0]    S00xDP;
   reg [7:0]    S01xDN;
   reg [7:0]    S01xDP;
   reg [7:0]    S02xDN;
   reg [7:0]    S02xDP;
   reg [7:0]    S03xDN;
   reg [7:0]    S03xDP;
   reg [7:0]    S10xDN;
   reg [7:0]    S10xDP;
   reg [7:0]    S11xDN;
   reg [7:0]    S11xDP;
   reg [7:0]    S12xDN;
   reg [7:0]    S12xDP;
   reg [7:0]    S13xDN;
   reg [7:0]    S13xDP;
   reg [7:0]    S20xDN;
   reg [7:0]    S20xDP;
   reg [7:0]    S21xDN;
   reg [7:0]    S21xDP;
   reg [7:0]    S22xDN;
   reg [7:0]    S22xDP;
   reg [7:0]    S23xDN;
   reg [7:0]    S23xDP;
   reg [7:0]    S30xDN;
   reg [7:0]    S30xDP;
   reg [7:0]    S31xDN;
   reg [7:0]    S31xDP;
   reg [7:0]    S32xDN;
   reg [7:0]    S32xDP;
   reg [7:0]    S33xDN;
   reg [7:0]    S33xDP;
   wire [7:0]   MixColumnsS0xD;
   wire [7:0]   MixColumnsS1xD;
   wire [7:0]   MixColumnsS2xD;
   wire [7:0]   MixColumnsS3xD;
   
   always @(MixColumnsS0xD or MixColumnsS1xD or MixColumnsS2xD or MixColumnsS3xD or MixColumnsxSI or S00xDP or S01xDP or S02xDP or S03xDP 
	   or S10xDP or S11xDP or S12xDP or S13xDP or S20xDP or S21xDP or S22xDP or S23xDP or S30xDP or S31xDP or S32xDP or S33xDP or ShiftRowsxSI
		or StateInxDI)
   begin
	   StateOutxDO = S00xDP;
		
		//ShiftRows movement (one cycle before last byte is written)
      if (ShiftRowsxSI == 1'b1)
      begin		   
         S00xDN = S10xDP;
         S01xDN = S11xDP;
         S02xDN = S12xDP;
         S03xDN = S13xDP;
         S10xDN = S21xDP;
         S11xDN = S22xDP;
         S12xDN = S23xDP;
         S13xDN = S20xDP;
         S20xDN = S32xDP;
         S21xDN = S33xDP;
         S22xDN = S30xDP;
         S23xDN = S31xDP;
         S30xDN = StateInxDI;
         S31xDN = S01xDP;
         S32xDN = S02xDP;
         S33xDN = S03xDP;
      end
      else if (MixColumnsxSI == 1'b1)
      begin
		   //MixColumns movement
         StateOutxDO = MixColumnsS0xD;
         S00xDN = MixColumnsS1xD;
         S01xDN = S11xDP;
         S02xDN = S12xDP;
         S03xDN = S13xDP;
         S10xDN = MixColumnsS2xD;
         S11xDN = S21xDP;
         S12xDN = S22xDP;
         S13xDN = S23xDP;
         S20xDN = MixColumnsS3xD;
         S21xDN = S31xDP;
         S22xDN = S32xDP;
         S23xDN = S33xDP;
         S30xDN = S01xDP;
         S31xDN = S02xDP;
         S32xDN = S03xDP;
         S33xDN = StateInxDI;
      end
      else
      begin
		   //Normal register movement
         S00xDN = S10xDP;
         S01xDN = S11xDP;
         S02xDN = S12xDP;
         S03xDN = S13xDP;
         S10xDN = S20xDP;
         S11xDN = S21xDP;
         S12xDN = S22xDP;
         S13xDN = S23xDP;
         S20xDN = S30xDP;
         S21xDN = S31xDP;
         S22xDN = S32xDP;
         S23xDN = S33xDP;
         S30xDN = S01xDP;
         S31xDN = S02xDP;
         S32xDN = S03xDP;
         S33xDN = StateInxDI;
      end
   end
   
   //perform Mixcolumns
   mix_columns mix_columns_1(.A0xDI(S00xDP), .A1xDI(S10xDP), .A2xDI(S20xDP), .A3xDI(S30xDP), .B0xDO(MixColumnsS0xD), .B1xDO(MixColumnsS1xD),
	.B2xDO(MixColumnsS2xD), .B3xDO(MixColumnsS3xD)); 
   
   always @(posedge ClkxCI or negedge RstxBI)
   begin
      if (RstxBI == 1'b0)
      begin
         S00xDP <= {8{1'b0}};
         S01xDP <= {8{1'b0}};
         S02xDP <= {8{1'b0}};
         S03xDP <= {8{1'b0}};
         S10xDP <= {8{1'b0}};
         S11xDP <= {8{1'b0}};
         S12xDP <= {8{1'b0}};
         S13xDP <= {8{1'b0}};
         S20xDP <= {8{1'b0}};
         S21xDP <= {8{1'b0}};
         S22xDP <= {8{1'b0}};
         S23xDP <= {8{1'b0}};
         S30xDP <= {8{1'b0}};
         S31xDP <= {8{1'b0}};
         S32xDP <= {8{1'b0}};
         S33xDP <= {8{1'b0}};
      end
      else 
      begin
         S00xDP <= S00xDN;
         S01xDP <= S01xDN;
         S02xDP <= S02xDN;
         S03xDP <= S03xDN;
         S10xDP <= S10xDN;
         S11xDP <= S11xDN;
         S12xDP <= S12xDN;
         S13xDP <= S13xDN;
         S20xDP <= S20xDN;
         S21xDP <= S21xDN;
         S22xDP <= S22xDN;
         S23xDP <= S23xDN;
         S30xDP <= S30xDN;
         S31xDP <= S31xDN;
         S32xDP <= S32xDN;
         S33xDP <= S33xDN;
      end
   end
   
endmodule