`timescale 10us/1us		

module clock_generator_tb ();
  reg Clock_5k, reset;
  
  clock_gen_module CGM(Clock_5k, reset, Clock_1Sec, Clock_1mSec);
  
  initial
  begin
  
    Clock_5k = 1; reset = 1; 		//reset
    #50 reset = 0;
    #50 reset = 1;	

  end

  always #10 Clock_5k = ~Clock_5k;	//make 5kHz

endmodule
