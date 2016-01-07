package eventos 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Daniela
	 */
	public class MothEvent extends Event 
	{
		public static const DEAD:String = "dead";
		
		public function MothEvent(type:String) 
		{ 
			super(type);
			
		} 
		
		
		
	}
	
}