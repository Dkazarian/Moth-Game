package  
{
	import clases.mothGame;
	import eventos.MothEvent;
	import flash.display.MovieClip;
	import flash.display.Stage
	import flash.events.MouseEvent;
	
	public class main extends MovieClip
	{
		public var playScreen:mothGame;
		public var start:Restart;
		
		
		
		public function main() 
		{
			
			start = new Restart;
			start.width /= 2;
			start.height /= 2;
			start.x = stage.width / 2 ;
			start.y = 275;
			
			addChild(start);
			start.addEventListener(MouseEvent.CLICK, comenzar);
			
			
		}
		public function comenzar(event:MouseEvent):void 
		{
			playScreen = new mothGame(stage);
			playScreen.addEventListener(MothEvent.DEAD, muerte);
			addChild(playScreen);

			
		}
		public function muerte(event:MothEvent):void
		{
			playScreen = null;
		}
		
	}

}