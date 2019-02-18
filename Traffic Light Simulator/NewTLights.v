module Traffic_SensorA(resetA,clkA,Ta);
      input resetA;
      input clkA;
      output reg Ta;
      reg [4:0] LFSRA;
      reg [4:0] FollowA;
      reg fdbckA ;
      always@(clkA,resetA)
          if(resetA==1)
                  begin
   	            LFSRA[0]=$urandom%2;
	            LFSRA[1]=$urandom%2;
  		    LFSRA[2]=$urandom%2;
   		    LFSRA[3]=$urandom%2;
   		    LFSRA[4]=$urandom%2;
        	    fdbckA<=LFSRA[2]^LFSRA[3];
                    Ta=LFSRA[4]&LFSRA[3];
                  end

          else
              LFSRA<=FollowA;
      always@(*)
         begin
          
          fdbckA=LFSRA[2]^LFSRA[4];
          FollowA={LFSRA[3:0],fdbckA};
          Ta= LFSRA[2]&fdbckA;
         end



endmodule


module Traffic_SensorB(resetB,clkB,Tb);
      input resetB;
      input clkB;
      output reg Tb;
      reg [4:0] LFSRB ;
      reg [4:0] FollowB;
      reg fdbckB ;
      always@(clkB,resetB)
          if(resetB==1)
                  begin
   	            LFSRB[0]<=$urandom%2;
	            LFSRB[1]<=$urandom%2;
  		    LFSRB[2]<=$urandom%2;
   		    LFSRB[3]<=$urandom%2;
   		    LFSRB[4]<=$urandom%2;
        	    fdbckB<=LFSRB[2]^LFSRB[4];
                    Tb=LFSRB[4];

                  end
     	   else
              LFSRB<=FollowB;
      always@(*)
         begin
          Tb=LFSRB[4];
          fdbckB=LFSRB[3]^LFSRB[1]|LFSRB[0];
          FollowB = {fdbckB,LFSRB[4:1]};
         end


endmodule



module Traffic_Light_Controller(clk,rst,Ra,Ga,Ya,Rb,Gb,Yb);

input clk,rst;

output reg Ra,Ga,Ya,Rb,Gb,Yb;

parameter S0 = 2'b00,S1 = 2'b01,S2 = 2'b10,S3 = 2'b11;

reg [1:0] state,nextstate;

wire Ta;
Traffic_SensorA traffic_sensora(
            .resetA(rst),
            .clkA(clk),
            .Ta(Ta));
wire Tb;
Traffic_SensorB traffic_sensorb(
            .resetB(rst),
            .clkB(clk),
            .Tb(Tb));

always@(posedge clk,posedge rst)
  begin
    if(rst==1)
      begin
            state<=S0;
      end
    else
      state<=nextstate;
  end

always@(*)
 case(state)
      S0:
            if(Ta)
                  nextstate<=S0;
            else if(!Ta)
                  nextstate<=S1;
      S1:
            nextstate<=S2;
      S2:
            if(Tb)
                  nextstate<=S2;
            else if(!Tb)
                  nextstate<=S3;
      S3:
            nextstate<=S0;
endcase

always@(*)
   case(state)
      S0:
         begin
            Ga=1;
            Gb=0;
            Ra=0;
            Rb=1;
            Ya=0;
            Yb=0;
          end
       S1:
          begin
            Ga=0;
            Gb=0;
            Ra=0;
            Rb=1;
            Ya=1;
            Yb=0;
          end
        S2:
           begin
            Ga=0;
            Gb=1;
            Ra=1;
            Rb=0;
            Ya=0;
            Yb=0;
          end
        S3:
          begin
            Ga=0;
            Gb=0;
            Ra=0;
            Rb=1;
            Ya=0;
            Yb=1;
          end
    endcase
endmodule
