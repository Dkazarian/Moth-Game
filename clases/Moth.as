package clases 
{
	import flash.display.Sprite
	import flash.events.MouseEvent
	import flash.geom.Point
	import flash.display.MovieClip
	import flash.ui.Mouse
	import flash.display.Stage
	import flash.utils.Timer
	import flash.events.TimerEvent

	
	
	public class Moth extends MovieClip
	{  		
		private var stageRef:Stage;
		public var dodge:Boolean;
		public var energy:Boolean;
		public var energyTimer:Timer;
		private var dodgeTimer:Timer;
		
		
		public function Moth(stage:Stage) {
			

            energy = true; 
			dodgeTimer = new Timer(1200);
			energyTimer = new Timer(1500);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mover);
			stageRef = stage;
			tamano();			
			iniciaPosicion();
			addEventListener(MouseEvent.CLICK, evadir);
			
 
		}
 
		public function mover(e:MouseEvent):void {
			var punto:Point = localToGlobal(new Point(mouseX, mouseY));
			Mouse.hide();
			x = punto.x;
			y = punto.y;
			
		}
		
		public function iniciaPosicion()
		{
			x = stageRef.stageWidth / 3;
			y = stageRef.stageHeight / 3;
		}
		
		public function tamano() {
			
			height /=5;
			width /=5;
			
		}
		public function evadir(event:MouseEvent):void {
			if (energy)
			{
			dodge = true;
			height /=2;
			width /=2;

			trace(dodge);
			dodgeTimer.start();			
			dodgeTimer.addEventListener(TimerEvent.TIMER, finEvadir);
			energy = false;
			energyTimer.start();
			energyTimer.addEventListener(TimerEvent.TIMER, energyReload);
			}
		}
		public function finEvadir(timerEvent:TimerEvent):void
		{
			height *=2;
			width *=2;

			
			dodge = false;
			dodgeTimer.stop();
			trace(dodge);
		}
		public function energyReload(timerEvent:TimerEvent):void
		{
			energy = true;
			trace(energy);
			energyTimer.stop();
		}
		
    }
}


