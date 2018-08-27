`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:52 01/22/2018 
// Design Name: 
// Module Name:    unshared_inv 
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
//unshared inverter in gf2^4
module unshared_inv(
   input [3:0]  XxDI0,
   output [3:0] QxDO0
	);
	
   wire [1:0] a, b, c, d, amuld,bmuld;
	wire sa, sb ,sd;
	
	//Canright variant
   assign a=XxDI0[3:2];
   assign b=XxDI0[1:0];
   assign sa=a[1] ^ a[0];
   assign sb=b[1] ^ b[0];
   assign c={~(a[1] | b[1]) ^ (~(sa & sb)),~(sa | sb) ^ (~(a[0] & b[0]))};
   assign d={c[0],c[1]};
   assign sd=d[1] ^ d[0];
   assign amuld[0]=(sa & sd) ^ (a[0] & d[0]);
   assign amuld[1]=(sa & sd) ^ (a[1] & d[1]);
   assign bmuld[0]=(sb & sd) ^ (b[0] & d[0]);
   assign bmuld[1]=(sb & sd) ^ (b[1] & d[1]);
   assign QxDO0= {bmuld,amuld};
  
endmodule