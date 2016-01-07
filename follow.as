package  
{
	import clases.Bat
	import clases.Moth
	import flash.display.MovieClip
	import flash.text.TextField
	import flash.utils.Timer
	import flash.events.TimerEvent
	import flash.ui.Mouse
	import flash.events.MouseEvent
	

	/**
	 * ...
	 * @author Daniela
	 */
	public class follow extends MovieClip
	{
		public var gameTimer:Timer;
		
		public var moth:Moth;
		
		public var restart:Restart;
		public var bat:Bat;
		public var antX:Number;
		public var antY:Number;
		public var quieto:Boolean;

		public function follow() 
		{
			moth = new Moth(stage);
			moth.width /= 1.5;
			moth.height /= 1.5;
			
			bat = new Bat(10, stage);
			bat.x = 500;
			bat.y = 0;
			bat.height /= 1.2;
			bat.width /= 1.2;
			addChild(bat);
			
			addChild(moth);
			restart = new Restart();
			restart.x = 275;
			restart.y = 200;
			addChild(restart);
			
			restart.addEventListener(MouseEvent.CLICK, reset);

		}
		
		
		public function playGame() {
			
					
			bat.sonar.gotoAndPlay(1);
			bat.x = 100;
			bat.y = 200;
			antX = Math.floor(Math.random() * 600)-100;
			antY = Math.floor(Math.random() * 400); 

			moth.energy = true;
			power.x = 20;
			power.y = 20;	
			quieto = true;

			
			
			gameTimer = new Timer(40);
			gameTimer.addEventListener( TimerEvent.TIMER, onTick );
			gameTimer.start();
			

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
			if (bat.sonar.hitTestObject(moth)) {
				quieto = false;
			}	
			
			if ((quieto == true) && ((bat.x-antX) <= 10) && ((bat.y-antY) <= 10)) {
			
						antX = Math.floor(Math.random() * 500);
						antY = Math.floor(Math.random() * 400); 

				}


			if((quieto!=true) && (moth.dodge!=true)){
			
				bat.seguir(moth.x, moth.y);
				antX = moth.x;
				antY = moth.y;
				
			}else
			
			{
						
				bat.seguir(antX, antY);
				quieto=true;

								
			}	
				
				if (( moth.hitTestObject(bat.hitCross)) && !moth.dodge) 
			    {
					
					gameTimer.stop();
					
					moth.gotoAndStop(25);
										
							
					bat.sonar.gotoAndPlay(31);
					bat.sonar.stop();
					
					//restart = new Restart();
					restart.x = 275;
					restart.y = 200;
					addChild(restart);
					restart.addEventListener(MouseEvent.CLICK, reset);
					
					
			    }

				
			}

		
		public function reset(event:MouseEvent) {
			
			
					
			removeChild(restart);
			moth.gotoAndPlay(1);

			playGame();
			
		}

		
	}

}