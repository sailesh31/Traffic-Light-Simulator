module zero_one_detector(A,Y,clk,rst);
   input A;
   input clk;
   input rst;
   output  Y;

   parameter S0=2'b00;
   parameter S1=2'b01;
   parameter S2=2'b10;

   reg [1:0] currentstate;
   reg [1:0] nextstate;
 
always@(posedge clk,posedge rst)
      if(rst)
       begin
        currentstate<=S0;
        nextstate<=S0;
       end
      else
        begin
         if(A)
           begin
             if(currentstate==S1)
                  nextstate<=S2;
             else if(currentstate==S2) 
                  nextstate<=S0;
             else if(currentstate==S0)
                  nextstate<=S0;
           end
         else if(!A)
           begin
            if(currentstate==S1)
             nextstate<=S1;
            else if (currentstate==S2)
             nextstate<=S1;
            else if(currentstate==S0)
             nextstate<=S1;
           end
        currentstate<=nextstate;
        end     
     assign Y=(currentstate[0]);
endmodule
