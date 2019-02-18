
module Traffic_Light_Controller(Ta,Tb,clk,rst,Ra,Ga,Ya,Rb,Gb,Yb);

input clk,rst,Ta,Tb;

output Ra,Ga,Ya,Rb,Gb,Yb;

parameter S0 = 2'b00,S1 = 2'b01,S2 = 2'b10,S3 = 2'b11;

reg [1:0] state=S0,nextstate;

always@(posedge clk,posedge rst)
    if(rst)
      state<=S0;

    else
       begin
         if(state==S0)
           begin
             if(Ta)
             	nextstate=S0;

             else if(!Ta)
             	nextstate=S1;
           end
         else if(state==S1)
            nextstate=S2;

         else if(state==S2)
           begin
              if(Tb)
             	nextstate=S3;
              else if(!Tb)
             	nextstate=S2;
           end

         else if(state==S3)
           nextstate=S0;
       
       state<=nextstate;
       end

     assign Ra= (state==S3|S2);
     assign Ga= state==S0;
     assign Ya= state==S1;
     assign Rb= (state==S0|S1);
     assign Gb= state==S2;
     assign Yb= state==S3;
 
endmodule
