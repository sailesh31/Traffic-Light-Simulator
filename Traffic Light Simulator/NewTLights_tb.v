module test_TLC;

reg clk,rst;

wire Ra,Ga,Ya,Rb,Gb,Yb;

wire Ta,Tb;
Traffic_SensorA uut(
                    .resetA(rst),
                    .clkA(clk),
                    .Ta(Ta));

Traffic_SensorB utu(.resetB(rst),
                    .clkB(clk),
                    .Tb(Tb));

Traffic_Light_Controller dut(clk,rst,Ra,Ga,Ya,Rb,Gb,Yb);

initial begin
  $dumpfile("NewTLights.vcd");
  $dumpvars(0,test_TLC);
end
 initial begin
 $display("Started");
      clk=0;
      rst = 1;  //Initial Time for setup.
      #5000
      rst = 0;
      #5000
      clk=1;
      #5000
      clk=0;
      #5000
      clk=1;
      #5000
      clk=0;
      #5000
      clk=1;
      #5000
      clk=0;
      #5000
      clk=1;
      #5000
      clk=0;
      #5000
      clk=1;
      #5000
      clk=0;
      #5000
      clk=1;
      #5000
      clk=0;
      #5000
      clk=1;
      #5000
      clk=0;
      #5000
      clk=1;
      #5000
      clk=0;
 end

/*always@(!clk)
  $display("time=%d Ra=%b Ya=%b Ga=%b Rb=%b Yb=%b Gb=%b",$time,Ra,Ya,Ga,Rb,Yb,Gb);
*/
always@(!clk)
            if($time!=0)
            $display("Time:%d,clk:%b,Ta=%b,Tb=%b,Ra=%b,Rb=%b,Ya=%b,Yb=%b,Ga=%b,GB=%b\n",$time-10000,clk,Ta,Tb,Ra,Rb,Ya,Yb,Ga,Gb);
endmodule
