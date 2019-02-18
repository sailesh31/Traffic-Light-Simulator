module zero_one_detector_tb;

     reg A;
     reg rst;
     reg clk;

     wire Y;

     zero_one_detector uut(
     .A(A),
     .rst(rst),
     .clk(clk),
     .Y(Y)
     );
      
     initial begin
       $dumpfile("sequencedetector.vcd");
       $dumpvars(0,zero_one_detector_tb);
     end
     initial begin
          
        rst=1;
        #100
        rst=0;   //Initial time required for setup.
        clk=0;
        #100
        A=1;
        clk=1;
        #100
        A=0;
        clk=0;
        #100
        clk=1;
        #100
        A=1;
        clk=0;
        #100
        clk=1;
        #100
        A=1;
        clk=0;
        #100
        clk=1;
        #100
        clk=0;
        rst=1;
        #100
        clk=1;
        rst=0;
        #100
        clk=0;
   


      end
always@(*)
  $display("time=%d: clk=%b,A=%b,rst=%b Y=%b\n",$time,clk,A,rst,Y);

endmodule
