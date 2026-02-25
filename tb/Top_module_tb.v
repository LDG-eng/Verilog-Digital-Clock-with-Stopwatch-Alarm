`timescale 10us/1us

module Top_tb();

  reg Clock_5k, reset, control, Start_S, Stop_S, Reset_S, Loadtime, Loadalm, AlarmEnable, Set_AM_PM, Alarm_AM_PM_in;
  reg [3:0] SetHoures, AlarmHours_in;
  reg [5:0] SetSecs, SetMins, AlarmMins_in;

  wire [3:0] Hours;
  wire [5:0] Mins, Secs;
  wire [9:0] mSecs;

  Top TM(Clock_5k, reset, control, Start_S, Stop_S, Reset_S, AM_PM, Hours, Mins, Secs, mSecs, ALarm, SW_state
	,Loadtime, Loadalm, AlarmEnable, Set_AM_PM, Alarm_AM_PM_in, SetSecs, SetMins, AlarmMins_in, SetHoures, AlarmHours_in); 	//instantiation

  always #10 Clock_5k = ~Clock_5k; 		//make clk

  initial
  begin

  Clock_5k = 0; reset = 1; control = 1; Start_S = 0; Stop_S = 0; Reset_S = 0; Loadtime = 0; Loadalm = 0; AlarmEnable = 1;	//reset
  #50000 reset = 0;
  #50000 reset = 1;									//1000ms
  #10000 Loadtime = 1; Set_AM_PM = 0; SetHoures = 4'd11; SetMins = 6'd59; SetSecs = 0;	//1100ms
  #500 Loadtime = 0;
  #50000 Loadalm = 1; Alarm_AM_PM_in = 1; AlarmHours_in = 4'd12; AlarmMins_in = 6'd0;	//1605ms
  #500 Loadalm = 0;

  #5000000 control = 0;  								//51610ms
  #55000 Start_S = 1;									
  #20000 Start_S = 0;
  #10000 Start_S = 1;
  #11000 Stop_S = 1;
  #60000 Reset_S = 1;	
  #50000 Stop_S = 0;	
  #500 Reset_S = 0;	
  #10000 control = 1;									//53770ms

  end
endmodule
