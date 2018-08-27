`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:55:02 01/22/2018 
// Design Name: 
// Module Name:    rcon 
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
//Round constant (RCON) calculation
module rcon(
   input        ClkxCI,
   input        RstxBI,
   input        NextxSI,   //calculate next RCON value
   input        ActivexSI,   //show RCON at output
   output reg   LastRoundxSO,   //round 10 started
   output reg   FinishedxSO,   //round 0 (done with round 10)
   output reg [7:0] RCONxDO
	);
   
	//RCON registers
   reg [7:0]    RCONxDN;
   reg [7:0]    RCONxDP;
	
   always @(ActivexSI or NextxSI or RCONxDP)
   begin
      RCONxDN = RCONxDP;
      
		//RCON calculation
      if (NextxSI == 1'b1)
      begin
         if ((RCONxDP[6] & RCONxDP[3]) == 1'b1)
            RCONxDN = 8'b00000001;
         else
         begin
            RCONxDN[0] = RCONxDP[7];
            RCONxDN[1] = RCONxDP[0] ^ RCONxDP[7];
            RCONxDN[2] = RCONxDP[1];
            RCONxDN[3] = RCONxDP[2] ^ RCONxDP[7];
            RCONxDN[4] = RCONxDP[3] ^ RCONxDP[7];
            RCONxDN[5] = RCONxDP[4];
            RCONxDN[6] = RCONxDP[5];
            RCONxDN[7] = RCONxDP[6];
         end
      end
      
		//output RCON
      if (ActivexSI == 1'b1)
         RCONxDO = RCONxDP;
      else 
         RCONxDO = 8'b00000000;
      
      LastRoundxSO = RCONxDP[5] & RCONxDP[2] & RCONxDP[4];
      FinishedxSO = RCONxDP[6] & RCONxDP[3];
   end
   
   
   always @(posedge ClkxCI or negedge RstxBI)
   begin
      if (RstxBI == 1'b0)
         RCONxDP <= 8'b01101100;
      else 
         RCONxDP <= RCONxDN;
   end
   
endmodule
