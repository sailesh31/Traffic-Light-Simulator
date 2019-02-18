module Traffic_Sensor(T,clk,rst);

input clk,rst;

output T;

reg [4:0] LFSR=5'b10110;
reg temp1;
reg temp2;
reg temp3;
reg temp4;
reg temp5;


reg fdbck=1'b1;

always@(posedge clk,posedge rst)
  if(rst)
     begin
   	LFSR[0]<=$urandom%1;
   	LFSR[1]<=$urandom%1;
  	LFSR[2]<=$urandom%1;
   	LFSR[3]<=$urandom%1;
   	LFSR[4]<=$urandom%1;
        fdbck<=LFSR[2]^LFSR[4];
     end
       
  else
    begin
     LFSR[0]<=fdbck;
     LFSR[1]<=LFSR[0];
     LFSR[2]<=LFSR[1];
     LFSR[3]<=LFSR[2];
     LFSR[4]<=LFSR[3];
     fdbck<=LFSR[2]^LFSR[4];
    end 
  assign T=LFSR[4]&LFSR[5];
 
endmodule
