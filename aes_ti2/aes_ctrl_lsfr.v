`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:54:06 01/22/2018 
// Design Name: 
// Module Name:    aes_ctrl_lsfr 
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
//LSFR generates the state transitions
module aes_ctrl_lsfr(
   input           ClkxCI,
   input           RstxBI,
   input           StartxSI,   //start signal
   input           LastRoundxSI,      //last round
   output reg      StateIDLExS,   //IDLE State
   output reg      State1xS,   //State 1 is active
   output reg      StateKEYADDITION1o3xS,   // cycle 1  -> 4
   output reg      StateKEYADDITION2o3xS,   //cycle 5  -> 12
   output reg      StateKEYADDITION3o3xS,   //cycle 13 -> 16
   output reg      StateKEYSCHEDULExS,   //cycle 17 -> 19
   output reg      StateSHIFTROWSxS,   //cycle 20 , performs StateSHIFTROWSxS at S output
   output reg      doMixColumnsxS,   //cycle 21 -> 24, performs MixColumns at S output
	output reg      forthcylies,   //cycle 4
	output reg      lastcycle   //cycle 24
);
   
   parameter [4:0] STATE_0 = 5'b00000;
   parameter [4:0] STATE_1 = 5'b00001;
   parameter [4:0] STATE_2 = 5'b00010;
   parameter [4:0] STATE_3 = 5'b00011;
   parameter [4:0] STATE_4 = 5'b00100;
   parameter [4:0] STATE_5 = 5'b00101;
   parameter [4:0] STATE_6 = 5'b00110;
   parameter [4:0] STATE_7 = 5'b00111;
   parameter [4:0] STATE_8 = 5'b01000;
   parameter [4:0] STATE_9 = 5'b01001;
   parameter [4:0] STATE_10 = 5'b01010;
   parameter [4:0] STATE_11 = 5'b01011;
   parameter [4:0] STATE_12 = 5'b01100;
   parameter [4:0] STATE_13 = 5'b01101;
   parameter [4:0] STATE_14 = 5'b01110;
   parameter [4:0] STATE_15 = 5'b01111;
   parameter [4:0] STATE_16 = 5'b10000;
   parameter [4:0] STATE_17 = 5'b10001;
   parameter [4:0] STATE_18 = 5'b10010;
   parameter [4:0] STATE_19 = 5'b10011;
   parameter [4:0] STATE_20 = 5'b10100;
	parameter [4:0] STATE_21 = 5'b10101;
	parameter [4:0] STATE_22 = 5'b10110;
	parameter [4:0] STATE_23 = 5'b10111;
	parameter [4:0] STATE_24 = 5'b11000;
	
   reg [4:0]       LSFRxDN;   //LSFR registers
   reg [4:0]       LSFRxDP;
	
   always @(LSFRxDP or LastRoundxSI)
   begin  
	   //default assignments
      StateIDLExS = 1'b0;
      State1xS = 1'b0;
      StateKEYADDITION1o3xS = 1'b0;
      StateKEYADDITION2o3xS = 1'b0;
      StateKEYADDITION3o3xS = 1'b0;
      StateKEYSCHEDULExS = 1'b0;
      StateSHIFTROWSxS = 1'b0;
      doMixColumnsxS = 1'b0;
		forthcylies= 1'b0;
		lastcycle= 1'b0;
		
		// cycle 4
		if (LSFRxDP == STATE_4)
         forthcylies = 1'b1;
			
		// cycle 1	
      if (LSFRxDP == STATE_1)
         State1xS = 1'b1;
			
		// cycle 24	
      if (LSFRxDP == STATE_24)
         lastcycle = 1'b1;

      case (LSFRxDP)
         STATE_0 :
            StateIDLExS = 1'b1;
         STATE_1, STATE_2, STATE_3, STATE_4 :
            StateKEYADDITION1o3xS = 1'b1;
         STATE_5, STATE_6, STATE_7, STATE_8, STATE_9, STATE_10, STATE_11, STATE_12 :
            StateKEYADDITION2o3xS = 1'b1;
         STATE_13, STATE_14, STATE_15, STATE_16 :
            StateKEYADDITION3o3xS = 1'b1;
         STATE_17, STATE_18, STATE_19 :
            StateKEYSCHEDULExS = 1'b1;
         STATE_20  :
            StateSHIFTROWSxS = 1'b1;
			STATE_21,  STATE_22, STATE_23, STATE_24 : 
            doMixColumnsxS = 1'b1;
         default :
            ;
      endcase
   end
  
  //state transitions
   always @(LSFRxDP or LastRoundxSI or StartxSI)
   begin
      LSFRxDN = LSFRxDP;
      
      case (LSFRxDP)
         STATE_0 :
            if (StartxSI == 1'b1)
               LSFRxDN = STATE_1;
				else LSFRxDN = STATE_0;
         STATE_1:
				LSFRxDN = STATE_2;
         STATE_2 :
            LSFRxDN = STATE_3;
         STATE_3 :
            LSFRxDN = STATE_4;
         STATE_4 :
            LSFRxDN = STATE_5;
         STATE_5 :
            LSFRxDN = STATE_6;
         STATE_6 :
            LSFRxDN = STATE_7;
         STATE_7 :
            LSFRxDN = STATE_8;
         STATE_8 :
            LSFRxDN = STATE_9;
         STATE_9 :
            LSFRxDN = STATE_10;
         STATE_10 :
            LSFRxDN = STATE_11;
         STATE_11 :
            LSFRxDN = STATE_12;
         STATE_12 :
            LSFRxDN = STATE_13;
         STATE_13 :
            LSFRxDN = STATE_14;
         STATE_14 :
            LSFRxDN = STATE_15;
         STATE_15 :
            LSFRxDN = STATE_16;
         STATE_16 :
            LSFRxDN = STATE_17;
         STATE_17 :
            LSFRxDN = STATE_18;
         STATE_18 :
            LSFRxDN = STATE_19;
			STATE_19 :
            LSFRxDN = STATE_20;
			STATE_20 :
            LSFRxDN = STATE_21;
			STATE_21 :
            LSFRxDN = STATE_22;
			STATE_22 :
            LSFRxDN = STATE_23;
			STATE_23 :
            LSFRxDN = STATE_24;
			STATE_24 :
               if (LastRoundxSI == 1'b1)
                  LSFRxDN = STATE_0;
				   else LSFRxDN = STATE_1;
         default :
            ;
      endcase
   end
   
   always @(posedge ClkxCI or negedge RstxBI)
   begin
      if (RstxBI == 1'b0 )
         LSFRxDP <= STATE_0;
      else 
         LSFRxDP <= LSFRxDN;
   end
   
endmodule