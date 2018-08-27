`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:14:25 01/22/2018 
// Design Name: 
// Module Name:    aes_top 
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
//top module of aes encryption core, 226 cycles
module aes_top(
   input        ClkxCI,
   input        RstxBI,
   input [7:0]  PTxDI0,    //plain text share0 P0=randombits
	input [7:0]  PTxDI1,    //plain text share1 P1=randombits xor plaintext
   input [7:0]  KxDI,    //key
	input [15:0] rmask,    //fresh randombits,16 bits per Sbox
   input        StartxSI,    //start the core
   output [7:0] CxDO0,    //cipher text share0
   output [7:0] CxDO1, 	 //cipher text share1
	output       DonexS    //cipher text is ready	
);  
   //state signals
   wire         StateIDLExS;    //waits for StartxSI signal
   wire         State1xS;    //at first cycle
   wire         StateKEYADDITION1o3xS;    // cycle 1  -> 4
	wire         forthcylies;    // cycle 4
   wire         StateKEYADDITION2o3xS;    //cycle 5  -> 12
   wire         StateKEYADDITION3o3xS;    //cycle 13 -> 16
   wire         StateKEYSCHEDULExS;    //cycle 17 -> 20
   wire         StateSHIFTROWSxS;    //cycle 21 , performs StateSHIFTROWSxS at S output
	wire         doMixColumnsxS;    //cycle 1,5,9,13, performs MixColumns every 4th cycle exept for the last round
	//RCON signals
   wire         LastRoundxS;    //round 10 started
   wire         FinishedxS;    //round 0(done with round 10)
   wire [7:0]   RCONxD;    //RCON value
	//controll signals
   wire         nextRCONxS;    //calculate next RCON value
   wire         showRCONxS;    //show or hide RCON 
   wire         moveKupxS;    //roll K vertically
	//shared data signals
   reg [7:0]    KeyInxD;    //K register input
   wire [7:0]   KeyOutxD;    //K register output
   wire [7:0]   KeyToSboxOutxD;    //K13 register output
	wire [7:0]   keySboxOutxD;    //K Sbox output
   wire [7:0]   K03xD;    // K03 register output
   wire [7:0]   StateInxD0;    //S register input share0
	wire [7:0]   StateInxD1;    //S register input share1
   wire [7:0]   StateOutxD0;    //S register output share0
	wire [7:0]   StateOutxD1;    //S register output share1
   wire [7:0]   SboxOutxD0;    //Sbox output share0
   wire [7:0]   SboxOutxD1;    //Sbox output share1
   reg [7:0]    SboxInxD0;    //Sbox input share0
   reg [7:0]    SboxInxD1;    //Sbox input share1

      assign nextRCONxS = StateSHIFTROWSxS;    //calculate next RCON value
      assign showRCONxS = State1xS;   //RCON value appears on output
		
		//input of Sbox
		always @( FinishedxS or KeyInxD  or KeyToSboxOutxD or StateOutxD0 or StateOutxD1  or PTxDI0 or PTxDI1 or KxDI)
      begin 
		if (FinishedxS == 1'b1)   //in preliminary round
      begin
         SboxInxD0 = PTxDI0 ^ KxDI;
         SboxInxD1 = PTxDI1;
      end
      else
      begin
         SboxInxD0 = StateOutxD0 ^ KeyInxD;
         SboxInxD1 = StateOutxD1;
      end
      end 
		
		//input of State register
      assign StateInxD0 = SboxOutxD0;
      assign StateInxD1 = SboxOutxD1;
      
		//input of Key register
		always @(FinishedxS or K03xD or KeyInxD or KeyOutxD or KeyToSboxOutxD or RCONxD  or keySboxOutxD or StateKEYADDITION1o3xS or KxDI )
      begin
      if (FinishedxS == 1'b1)   //in preliminary round
         KeyInxD = KxDI;
      else if (StateKEYADDITION1o3xS == 1'b1)   //in first 4 cycles
         KeyInxD = KeyOutxD ^ keySboxOutxD ^ RCONxD;
      else
         KeyInxD = KeyOutxD ^ K03xD;			
	   end
		
		//outputs last State xor last round key
      assign CxDO0 = SboxInxD0;
		assign CxDO1 = SboxInxD1;
		
		//move K register up during cycles 17 - 21
      assign moveKupxS = StateKEYSCHEDULExS | StateSHIFTROWSxS;
		//signal that calculations are finished and CT appears at output
		assign DonexS = State1xS & LastRoundxS;
   
	//unshared_sbox for aes key schedule
   unshared_sbox unshared_sbox(.text_in(KeyToSboxOutxD), .text_out(keySboxOutxD));

   //LSFR generates the state transitions
   aes_ctrl_lsfr aes_ctrl_lsfr(.ClkxCI(ClkxCI), .RstxBI(RstxBI),.StartxSI(StartxSI),  .LastRoundxSI(LastRoundxS), 
	.StateIDLExS(StateIDLExS), .StateSHIFTROWSxS(StateSHIFTROWSxS), .StateKEYADDITION1o3xS(StateKEYADDITION1o3xS), 
	.StateKEYADDITION2o3xS(StateKEYADDITION2o3xS), .StateKEYADDITION3o3xS(StateKEYADDITION3o3xS),
	.StateKEYSCHEDULExS(StateKEYSCHEDULExS), .State1xS(State1xS), .doMixColumnsxS(doMixColumnsxS),.forthcylies(forthcylies));
   
	//Round constant (RCON) calculation
   rcon rcon(.ClkxCI(ClkxCI), .RstxBI(RstxBI), .NextxSI(nextRCONxS), .ActivexSI(showRCONxS), 
	.LastRoundxSO(LastRoundxS), .FinishedxSO(FinishedxS),.RCONxDO(RCONxD));
   
   //shared sbox of aes
	aes_sbox aes_sbox(.clock(ClkxCI), .resetn(RstxBI), .mask_in(rmask), .text_in0(SboxInxD0),
	.text_in1(SboxInxD1), .text_out0(SboxOutxD0), .text_out1(SboxOutxD1));
   
   //key register 
	aes_key_regs aes_key_regs(.ClkxCI(ClkxCI), .RstxBI(RstxBI), .KeyInxDI(KeyInxD), .forthcylies(forthcylies),.KeySchedulexSI(moveKupxS),
	.KeyOutxDO(KeyOutxD), .KeyToSboxOutxDO(KeyToSboxOutxD), .K03xDO(K03xD));
  
  //state register 1
   aes_state_regs aes_state_regs1(.ClkxCI(ClkxCI), .RstxBI(RstxBI), .StateInxDI(StateInxD0), .ShiftRowsxSI(StateSHIFTROWSxS), 
	.MixColumnsxSI(doMixColumnsxS), .StateOutxDO(StateOutxD0));
     
	//state register 2  
   aes_state_regs aes_state_regs2(.ClkxCI(ClkxCI), .RstxBI(RstxBI), .StateInxDI(StateInxD1), .ShiftRowsxSI(StateSHIFTROWSxS), 
	.MixColumnsxSI(doMixColumnsxS), .StateOutxDO(StateOutxD1));
     	
endmodule
