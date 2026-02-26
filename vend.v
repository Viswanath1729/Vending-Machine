`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2025 11:02:17
// Design Name: 
// Module Name: vend
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


module vend(clk,rst,in,out,ch);
input clk,rst;
input [2:0]in;//000-0rs; 001-1rs; 010-2rs; 101-5rs;
output reg out;
output reg [2:0]ch;//000-0rs; 001-1rs; 010-2rs; 011-3rs; 100-4rs;
reg [2:0]ps,ns;
parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4;
always@ (posedge clk)
 begin
  if(rst) begin
   ps<=s0;
   ch<=3'b000;
   out<=0;
  end
  else
   ps<=ns;
 end
always@ (ps,in)
 begin
  ns=s0;
  out=0;
  ch=3'b000;
  case(ps)
   s0://0rs
    begin
     if(in==3'b000) begin//ors
      ns=s0;
      out=0;
      ch=3'b000;
     end
     else if(in==3'b001) begin//1rs
      ns=s1;
      out=0;
      ch=3'b000;
     end
     else if(in==3'b010) begin//2rs
      ns=s2;
      out=0;
      ch=3'b000;
     end
     else if(in==3'b101) begin//5rs
      ns=s0;
      out=1;
      ch=3'b000;
     end
    end
    
   s1://1rs
    begin
     if(in==3'b000) begin//ors
      ns=s1;
      out=0;
      ch=3'b001;
     end
     else if(in==3'b001) begin//1rs
      ns=s2;
      out=0;
      ch=3'b000;
     end
     else if(in==3'b010) begin//2rs
      ns=s3;
      out=0;
      ch=3'b000;
     end
     else if(in==3'b101) begin//5rs
      ns=s0;
      out=1;
      ch=3'b001;
     end
    end
    
   s2://2rs
    begin
     if(in==3'b000) begin//ors
      ns=s2;
      out=0;
      ch=3'b010;
     end
     else if(in==3'b001) begin//1rs
      ns=s3;
      out=0;
      ch=3'b000;
     end
     else if(in==3'b010) begin//2rs
      ns=s4;
      out=0;
      ch=3'b000;
     end
     else if(in==3'b101) begin//5rs
      ns=s0;
      out=1;
      ch=3'b010;
     end
    end
   
   s3://3rs
    begin
     if(in==3'b000) begin//ors
      ns=s3;
      out=0;
      ch=3'b011;
     end
     else if(in==3'b001) begin//1rs
      ns=s4;
      out=0;
      ch=3'b000;
     end
     else if(in==3'b010) begin//2rs
      ns=s0;
      out=1;
      ch=3'b000;
     end
     else if(in==3'b101) begin//5rs
      ns=s0;
      out=1;
      ch=3'b011;
     end
    end
    
   s4://4rs
    begin
     if(in==3'b000) begin//ors
      ns=s4;
      out=0;
      ch=3'b100;
     end
     else if(in==3'b001) begin//1rs
      ns=s0;
      out=1;
      ch=3'b000;
     end
     else if(in==3'b010) begin//2rs
      ns=s0;
      out=1;
      ch=3'b001;
     end
     else if(in==3'b101) begin//5rs
      ns=s0;
      out=1;
      ch=3'b100;
     end
    end    
    
   default:
    begin
     ns=s0;
     out=0;
     ch=3'b000;
    end 
  endcase
 end 
endmodule
