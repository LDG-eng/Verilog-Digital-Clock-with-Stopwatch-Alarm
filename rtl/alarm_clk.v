module alarm_clk_module(Clock_1Sec, reset, Loadtime, Loadalm, AlarmEnable, Set_AM_PM, Alarm_AM_PM_in
			,SetSecs, SetMins, AlarmMins_in, SetHoures, AlarmHours_in, AM_PM, ALarm, Hours_C, Mins_C, Secs_C
			, AM_PM_A, Mins_A, Hours_A);     //alarm_clk module define

  input Clock_1Sec, reset, Loadtime, Loadalm, AlarmEnable, Set_AM_PM, Alarm_AM_PM_in;		//set input, output
  input [5:0] SetSecs, SetMins, AlarmMins_in;
  input [3:0] SetHoures, AlarmHours_in;
  output AM_PM, ALarm, Hours_C, Mins_C, Secs_C, AM_PM_A, Mins_A, Hours_A;
  
  reg [3:0] Hours_C, Hours_A;				//0~11 -> 4bit need
  reg [5:0] Mins_C, Secs_C, Mins_A;			//0~59 -> 6bit need
  reg AM_PM, ALarm, AM_PM_A;
  
  always@(negedge Clock_1Sec or negedge reset)begin           //module start when negedge Clock_1Sec or negedge reset
    if(!reset)begin                        	   //start when reset = 0
      Hours_C = 4'd1;
      Mins_C = 0;
      Secs_C = 0; 	 			//reset everything
      AM_PM = 1;
    end
    else begin					//start when reset = 1
      Secs_C = Secs_C + 1;			//count start

      if(Secs_C >= 60)begin			//display time
	Mins_C = Mins_C + 1;
	Secs_C = 0;
      end
      if(Mins_C >= 60)begin
	Hours_C = Hours_C + 1;
	Mins_C = 0;
      end
      if((Hours_C == 12)&(Mins_C == 0)&(Secs_C == 0)) 		//every 12 o'clock change AM,PM
	AM_PM = ~AM_PM;

      if(Hours_C >= 13)		//reset hours parameter
	Hours_C = 1;

      end
    end

  always@(Loadtime)begin			
    if(Loadtime == 1)begin			//when Loadtime = 1, time setting
      AM_PM = Set_AM_PM;
      Secs_C = SetSecs;
      Mins_C = SetMins;
      Hours_C = SetHoures;
    end
  end

  always@(Clock_1Sec or reset or Loadalm)begin		
    if(Loadalm == 1)begin				//when Loadalm = 1, alarm setting
      AM_PM_A = Alarm_AM_PM_in;
      Hours_A = AlarmHours_in;
      Mins_A = AlarmMins_in;
    end

    if(reset == 0)begin				//when reset = 0, reset alarm setting
      ALarm = 0;
      AM_PM_A = 0;
      Hours_A = 4'd13;
      Mins_A = 6'd61;
    end

    if(AlarmEnable == 1)begin						//alarming 1mins
      if((Hours_C == Hours_A)&(Mins_C == Mins_A)&(AM_PM == AM_PM_A))
	ALarm = 1;
      if((Hours_C == Hours_A)&(Mins_C == Mins_A + 1)&(AM_PM == AM_PM_A))
	ALarm = 0;
    end
  end
endmodule
