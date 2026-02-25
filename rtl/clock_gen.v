module clock_gen_module(Clock_5k, reset, Clock_1Sec, Clock_1mSec);     //clk gen module define

  input Clock_5k , reset;
  output Clock_1Sec, Clock_1mSec;
  
  reg Clock_1Sec, Clock_1mSec;            //output & inner counter set reg
  reg [12:0] count;                	//5000 => 13bit need
  
  always@(Clock_5k or reset)begin           //module start when Clock_5k or reset
    if(!reset)begin                         //start when reset = 0, clk reset
      Clock_1mSec = 0;
      Clock_1Sec = 0;
      count = 0;
    end
    else begin                            //start reset = 1
      count = count + 1;		  //count start
      
      if (count == 4999)begin
        Clock_1Sec = ~Clock_1Sec;		//make Clock_1S
        count = 0;				//reset counter
      end
      
      if ((count % 5) == 0)begin		//when rest of the division = 0
        Clock_1mSec = ~Clock_1mSec;		//make Clock_1mS
      end
    end
  end
endmodule
  
