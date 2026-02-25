module stop_module(Clock_1mSec, reset, Start_S, Stop_S, Reset_S, Hours_S, Mins_S, Secs_S, mSecs_S, control);

  input Clock_1mSec, reset, Start_S, Stop_S, Reset_S, control;		//set input, output
  output Hours_S, Mins_S, Secs_S, mSecs_S;
  
  reg [3:0] Hours_S;				//0~11 -> 4bit need
  reg [5:0] Mins_S, Secs_S;			//0~59 -> 6bit need
  reg [9:0] mSecs_S;				//0~999 -> 10bit need
  reg stop;					//stop butten detecter
  
  always@(posedge Clock_1mSec or negedge reset)begin           //module start when posedge Clock_1mSec or negedge reset
    if(!reset)begin                        	   //start when reset = 0
      Hours_S = 0;
      Mins_S = 0;
      Secs_S = 0;
      mSecs_S = 0;  	  //reset everything
      stop = 0;
    end
    else if(control == 0)begin                            //start when reest = 0 & control = 0 (stopwatch op)

      if(Stop_S == 1)begin		//when stop_s operate
	stop = 1;			//save operation
        if (Reset_S == 1)begin			//start when reset_s = 1 
      	  Hours_S = 0;
      	  Mins_S = 0;
      	  Secs_S = 0;
      	  mSecs_S = 0;  	  //reset everything
      	  stop = 0;
      end
      end
      
      else if (stop == 1)begin		//when stop button press
	if (Reset_S == 1)begin		//when reset button press
     	  Hours_S = 0;
      	  Mins_S = 0;
      	  Secs_S = 0;
      	  mSecs_S = 0;  	  //reset everything
      	  stop = 0;
      end
      end

      else if((Start_S == 1)&(stop == 0))begin	//start stopwatch
	mSecs_S = mSecs_S + 1;

	if(mSecs_S == 1000)begin	//display time
	  Secs_S = Secs_S + 1;
	  mSecs_S = 0;
	end
	if(Secs_S == 60)begin
	  Mins_S = Mins_S + 1;
	  Secs_S = 0;
	end
	if(Mins_S == 60)begin
	  Hours_S = Hours_S + 1;
	  Mins_S = 0;
	end

      end
    end
  end
endmodule
