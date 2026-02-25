module Top(Clock_5k, reset, control, Start_S, Stop_S, Reset_S, AM_PM, Hours, Mins, Secs, mSecs, ALarm, SW_state
	   , Loadtime, Loadalm, AlarmEnable, Set_AM_PM, Alarm_AM_PM_in, SetSecs, SetMins, AlarmMins_in, SetHoures, AlarmHours_in);

  input Clock_5k, reset, control, Start_S, Stop_S, Reset_S, Loadtime, Loadalm, AlarmEnable, Set_AM_PM, Alarm_AM_PM_in;
  input [3:0] SetHoures, AlarmHours_in;
  input [5:0] SetSecs, SetMins, AlarmMins_in;

  output AM_PM, Hours, Mins, Secs, mSecs, ALarm, SW_state;		//SW_state is check control op

  reg [3:0] Hours;
  reg [5:0] Mins, Secs;
  reg [9:0] mSecs;
  reg SW_state;

  wire Clock_1mSec, Clock_1Sec;
  wire [3:0] Hours_C, Hours_S;
  wire [5:0] Mins_C, Secs_C, Mins_S, Secs_S;
  wire [9:0] mSecs_S;

  clock_gen_module CGM(Clock_5k, reset, Clock_1Sec, Clock_1mSec);		//instantiation
 
  stop_module SWM(Clock_1mSec, reset, Start_S, Stop_S, Reset_S, Hours_S, Mins_S, Secs_S, mSecs_S, control);	//instantiation

  alarm_clk_module ACM(Clock_1Sec, reset, Loadtime, Loadalm, AlarmEnable, Set_AM_PM, Alarm_AM_PM_in
			,SetSecs, SetMins, AlarmMins_in, SetHoures, AlarmHours_in, AM_PM, ALarm, Hours_C, Mins_C, Secs_C
			, AM_PM_A, Mins_A, Hours_A);								//instantiation


  always@(posedge Clock_5k)begin
    SW_state = 0;

    if(control == 1)begin			//start when control = 1, op alarm 
      Hours = Hours_C;				//print time
      Mins = Mins_C;
      Secs = Secs_C;
      mSecs = 0;
    end
    else begin					//start when control = 0, op stopwatch
      Hours = Hours_S;				//print stopwatch time
      Mins = Mins_S;					
      Secs = Secs_S;
      mSecs = mSecs_S;
    end
  end

  always@(control)begin				//SW_state change when control change
    if(SW_state == 0)
      SW_state = 1;
  end

endmodule
