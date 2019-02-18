module test_TLC0;

reg clk,rst,Ta,Tb;

wire Ra,Ga,Ya,Rb,Gb,Yb;

Traffic_Light_Controller dut(Ta,Tb,clk,rst,Ra,Ga,Ya,Rb,Gb,Yb);
 initial begin
  $dumpfile("TrafficLights.vcd");
  $dumpvars(0,test_TLC0);
 end
 initial begin
 $display("Started");
  Ta=0;
  Tb=0;
  clk=0;
  rst=0;

  #100
  clk=1;

  #100
  clk=0;

  #100
  Ta=1;
  Tb=1;
  clk=1;
  
  #100 
  Ta=1;
  Tb=0;
  clk=0;
 
  #100
  clk=1;
  
  #100
  clk=0;
 end

always@(!clk)
  if($time!=0)
  $display("time=%d Ra=%b Ya=%b Ga=%b Rb=%b Yb=%b Gb=%b",$time-100,Ra,Ya,Ga,Rb,Yb,Gb);

endmodule
