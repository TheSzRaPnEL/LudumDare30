package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Game extends Sprite
	{
		private var actor:PacMan;
		private var actorMoveStep:Number;
		private var actorMovement:String;
		
		public function Game() 
		{
			actor = new PacMan();
			addChild(actor);
			
			actorMoveStep = 1;
			
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		public function moveActorUp():void
		{
			actorMovement = ActorMovement.UP;
		}
		
		public function moveActorDown():void
		{
			actorMovement = ActorMovement.DOWN;
		}
		
		public function moveActorLeft():void
		{
			actorMovement = ActorMovement.LEFT;
		}
		
		public function moveActorRight():void
		{
			actorMovement = ActorMovement.RIGHT;
		}
		
		private function gameLoop(e:Event):void 
		{
			if (actorMovement == ActorMovement.LEFT)
			{
				actor.x -= actorMoveStep;
				actor.rotation = 180;
			}
			if (actorMovement == ActorMovement.UP)
			{
				actor.y -= actorMoveStep;
				actor.rotation = 270;
			}
			if (actorMovement == ActorMovement.RIGHT)
			{
				actor.x += actorMoveStep;
				actor.rotation = 0;
			}
			if (actorMovement == ActorMovement.DOWN)
			{
				actor.y += actorMoveStep;
				actor.rotation = 90;
			}
		}
		
	}
}