`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2025 22:51:46
// Design Name: 
// Module Name: vend_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vend_tb;
reg clk,rst;
reg[2:0]in;
wire out;
wire[2:0]ch;
vend uut(.clk(clk),.rst(rst),.in(in),.out(out),.ch(ch));
initial clk=1'b0;
always #50 clk=~clk;
initial begin
  rst=1;
  #100 rst=0;
  
  // Scenario 1: 1 + 2 + 5 => change=3, out=1
  in=3'b001; #100;
  in=3'b010; #100;
  in=3'b101; #100;
  
  // Scenario 2: 5 => change=0, out=1
  in=3'b101; #100;
  
  //Scenario 3: 2 + 2 => change=4, out=0
  in=3'b010; #100;
  in=3'b010; #100;
  
  #1000 $finish;
 end
initial
 $monitor("%t: in=%3b, out=%b, change=%3b",$time,in,out,ch);
endmodule
