package clases 
{
	import flash.display.MovieClip;
	import flash.display.Stage
	
	
	

	public class Bat extends MovieClip
	{  
		
		public var specie = Number;
		public var stageRef = Stage;
		public var antX:Number;
		public var antY:Number;
		
		
		public function Bat(spc:Number,stage:Stage) 
		{
			specie = spc;
			stageRef = stage;
			antX = Math.floor(Math.random() * 600)-100;
			antY = Math.floor(Math.random() * 400); 

/*// generar un entero aleatorio entre los enteros limite_inf y limite_sup
2.var nAleatorio = Math.floor(Math.random() * (limite_sup - limite_inf + 1)) + limite_inf; */

			switch (specie) {
				case 0: 
					y = 500;
					x = Math.floor(Math.random() * 551);
					
					break;
				case 1:
					x = -300;
					rotation=90;
					y = Math.floor(Math.random() * 401);
			
					break;
					
				case 2:
					x = -100;
					rotation = 45;
					y = Math.floor(Math.random() * 800) - 200;
					break;
					
							        
			}

			tamano();

		}
		
		
		
		public function mover(speed:Number) {
			switch(specie) {
				case 0: 
					y = y - speed;
					break;
				case 1:							
					x = x + speed;
					break;
				case 2:
					x = x + speed;
					y = y -speed;
					break;
				
			}
		}
		public function tamano()
		{
			
			height /=1 ;
			width/= 1;
			
		
			
		}
		public function seguir(xi:Number, yi:Number ) {
			var op:Number;
			var adj:Number;
			adj = xi - x;
			op = yi - y;
			if (xi > x) {
				
				x += 10;
				
			}else {
				
				x -= 10;
			}
			if (yi > y) {
				
				y += 10;
				
				
			}else
			{
				
				y -= 10;
			}
			var radianes:Number = Math.atan2(op,adj);
			rotation = radianes * 180 / Math.PI +90;
			
		}
		public function vagar()
		{
			
			
			if (((x - antX) <= 5) && ((y -antY) <= 5)) {
			
					antX = Math.floor(Math.random() * 600)-100;
					antY = Math.floor(Math.random() * 400); 

			}

			seguir(antX, antY); 
			
			


		}
	}

}