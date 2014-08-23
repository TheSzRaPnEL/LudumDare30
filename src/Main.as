package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Main extends Sprite
	{
		private var game:Game;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			game = new Game();
			addChild(game);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown_handler);
		}
		
		private function onKeyDown_handler(e:KeyboardEvent):void
		{
			if (e.keyCode == 37)
				arrowLeft_handler();
			
			if (e.keyCode == 38)
				arrowUp_handler();
			
			if (e.keyCode == 39)
				arrowRight_handler();
			
			if (e.keyCode == 40)
				arrowDown_handler();
		}
		
		private function arrowDown_handler():void 
		{
			game.moveActorDown();
		}
		
		private function arrowRight_handler():void 
		{
			game.moveActorRight();
		}
		
		private function arrowUp_handler():void 
		{
			game.moveActorUp();
		}
		
		private function arrowLeft_handler():void 
		{
			game.moveActorLeft();
		}
	
	}
}