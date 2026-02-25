`timescale 1ms/1us

module alarm_clk_tb();
  
  reg Clock_1Sec, reset, Loadtime, Loadalm, AlarmEnable, Set_AM_PM, Alarm_AM_PM_in;
  reg [5:0] SetSecs, SetMins, AlarmMins_in;
  reg [3:0] SetHoures, AlarmHours_in;

  alarm_clk_module ACM(Clock_1Sec, reset, Loadtime, Loadalm, AlarmEnable, Set_AM_PM, Alarm_AM_PM_in
			,SetSecs, SetMins, AlarmMins_in, SetHoures, AlarmHours_in, AM_PM, ALarm, 
			Hours_C, Mins_C, Secs_C, AM_PM_A, Mins_A, Hours_A);


  initial
  begin
  
   Clock_1Sec = 0; reset = 1; Loadtime = 0; Loadalm = 0; AlarmEnable = 1;		//reset
    #50 reset = 0;	//50ms
    #50 reset = 1;	//100ms
    #1800 Loadtime = 1; Set_AM_PM = 0; SetHoures = 4'd8; SetMins = 6'd30; SetSecs = 0;	//1900ms
    #50 Loadtime = 0;
    #50 Loadalm = 1; Alarm_AM_PM_in = 0; AlarmHours_in = 4'd8; AlarmMins_in = 6'd35;	//2000ms
    #50 Loadalm = 0;

  end

  always #500 Clock_1Sec = ~ Clock_1Sec;		//make 1Hz clk

endmodule
