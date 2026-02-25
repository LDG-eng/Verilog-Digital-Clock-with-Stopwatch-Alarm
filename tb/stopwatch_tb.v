`timescale 10us/1us

module stop_module_tb();

  reg Clock_1mSec, reset, Start_S, Stop_S, Reset_S, control;
  wire [3:0] Hours_S;				//0~11 -> 4bit need
  wire [5:0] Mins_S, Secs_S;			//0~59 -> 6bit need
  wire [9:0] mSecs_S;				//0~999 -> 10bit need

  stop_module SWM(Clock_1mSec, reset, Start_S, Stop_S, Reset_S, Hours_S, Mins_S, Secs_S, mSecs_S, control);

  initial
  begin

    Clock_1mSec = 0; reset = 1; Start_S = 0; Stop_S = 0; Reset_S = 0; control = 0; 	//reset
    #50 reset = 0;
    #50 reset = 1;	//1ms
    #300 Start_S = 1;	//4ms
    #100 Reset_S = 1;	//5ms
    #200 Reset_S = 0;	//7ms
    #200 Start_S = 0;	//9ms
    #200 Start_S = 1;	//11ms
    #200 Stop_S = 1;	//13ms
    #100 Start_S = 0;	//14ms
    #100 Stop_S = 0;	//15ms
    #100 Start_S = 1;	//16ms
    #100 Start_S = 0; Stop_S = 1;	//17ms
    #100 Stop_S = 0;	//18ms
    #100 Reset_S = 1;	//19ms
    #100 Reset_S = 0; Start_S = 1;	//20ms
  
  end

  always #50 Clock_1mSec = ~ Clock_1mSec;	//make Clock

endmodule
