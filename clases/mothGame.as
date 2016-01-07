package  clases

{
	import clases.Bat
	import clases.Moth
	import flash.display.MovieClip
	import flash.display.Stage;
	import flash.text.TextField
	import flash.utils.Timer
	import flash.events.TimerEvent
	import flash.ui.Mouse
	import flash.events.MouseEvent
	import eventos.MothEvent
	
	public class mothGame extends MovieClip
	{
		public var gameTimer:Timer;
		public var batTimer:Timer;
		public var calmTimer:Timer;
		public var moth:Moth;
		public var flock:Array;
		public var points:Number;
		public var speed:Number;
		public var calma:Boolean;
		public var restart:Restart;
		

		
		
		
		public function mothGame(stage:Stage) 
		{
			moth = new Moth(stage);
			addChild(moth);
			restart = new Restart();
			restart.x = 275;
			restart.y = 200;
			addChild(restart);
			restart.addEventListener(MouseEvent.CLICK, reset);
            

			 
		}
		
		public function playGame() {
			
			
				
			speed = 10;
			points = 0;
			moth.energy = true;
			score.text ="Score: "+ points;
			clouds.play();
			
			flock= new Array;
						
			batTimer = new Timer(400);
			batTimer.addEventListener(TimerEvent.TIMER, batFactory);
			batTimer.start();
			
			gameTimer = new Timer(40);
			gameTimer.addEventListener( TimerEvent.TIMER, onTick );
			gameTimer.start();
			
			calmTimer = new Timer(4000);
			calma = false;
			calmTimer.addEventListener(TimerEvent.TIMER, finCalma);

		}
		
		public function onTick(timerEvent:TimerEvent ):void {
			
			if (moth.energy == true) {
				power.x = 20;
				power.y = 20;	
								
			}else 
			{
				power.x = -400;
				power.y = -400;
			}
			
			
			for each(var bat:Bat in flock)
			{
				
				
				bat.mover(speed);
				
				
				if ( (( (bat.specie==0) && (bat.y < -10))    ||     (  (bat.specie==1)  &&  (bat.x > 600)  ) ) && (bat==flock[0]) ) {
					removeChild(bat);
					flock.shift();
					givePoints();
					speed = speed + 0.7;		
					
			
				}
				if ( moth.hitTestObject(bat.hitCross) && !moth.dodge) 
			    {
					
					gameTimer.stop();
					batTimer.stop();
					moth.gotoAndStop(25);
					clouds.stop();
					
					dispatchEvent( new MothEvent( MothEvent.DEAD));


					
					for each(var bat:Bat in flock)
					{
						bat.sonar.gotoAndPlay(31);
						bat.sonar.stop();
						
					}
					//restart = new Restart();
					restart.x = 275;
					restart.y = 200;
					addChild(restart);
					restart.addEventListener(MouseEvent.CLICK, reset);
					
					
			    }

				
			}
			

		}
		public function batFactory(timerEvent:TimerEvent):void {
			
			if(!calma){
				var specie:Number = Math.random()*2;
				if ( ((points<30)||(specie <0.8)) && !((points>30) && (points<60))) 
				{
					specie = 0;
				} 
				else 
				{	
					/*if ((!((points > 60) && (points < 90)))|| (specie<1.5)|| (points<60))
					{*/
					specie = 1;
					}/*
					else 
					{
						specie = 2;
						
					}
				}*/
				var newBat: Bat = new Bat(specie,stage);
				flock.push(newBat);
				addChild(newBat);
				//givePoints();
			}	
			
		}
		
		public function givePoints():void
		{
		  points += 1;
		  
		 /* if (!(points%10) && (speed!=25)) {
			  speed+=5;
		  }*/
		 

		  if (!(points%30)) {
			  calma = true;
			  calmTimer.start();
		  }
		  
			
		  score.text = "Score: " + String(points);
		  
		}
		public function reset(event:MouseEvent) {
			
			for each(var bat:Bat in flock)
			{
				removeChild(bat);			
						
			}
			removeChild(restart);
			moth.gotoAndPlay(1);

			playGame();
			
		}
		public function finCalma(timerEvent:TimerEvent):void {
			
			calma = false;
			calmTimer.stop();
	        speed = 10;

		}

    }
}