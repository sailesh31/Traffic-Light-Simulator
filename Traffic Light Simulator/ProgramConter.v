module ProgramCounter(input clk,input cp, input clr,input Ep,output PC):
output [3:0] PC
wire [3:0] n1
if(Ep): 
   PC=4'b0
