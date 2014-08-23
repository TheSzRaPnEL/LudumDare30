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
		//pacman
		private var actor:PacMan;
		private var actorMoveStep:Number;
		private var actorMovement:String;
		private var nextActorMovement:String;
		private var timer:int;
		private var actorCanChangeMovement:Boolean;
		private var mapModel:MapModel;
		
		public function Game() 
		{
			timer = 0;
			
			actor = new PacMan();
			addChild(actor);
			
			actorMoveStep = 1;
			actorCanChangeMovement = true;
			
			mapModel = new MapModel();
			
			var i:int;
			var j:int;
			var cols:int = 12;
			var rows:int = 20;
			var mapOffsetX:int = 10;
			var mapOffsetY:int = 3;
			for (i = 0; i < cols; i++)
			{
				for (j = 0; j < rows; j++)
				{
					mapModel.setNoObstacleAt(i + mapOffsetX, j + mapOffsetY);
				}
			}
			
			actor.x = (mapOffsetX+cols) * 20;
			actor.y = mapOffsetY * 20;
			
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		public function moveActorUp():void
		{
			nextActorMovement = ActorMovement.UP;
		}
		
		public function moveActorDown():void
		{
			nextActorMovement = ActorMovement.DOWN;
		}
		
		public function moveActorLeft():void
		{
			nextActorMovement = ActorMovement.LEFT;
		}
		
		public function moveActorRight():void
		{
			nextActorMovement = ActorMovement.RIGHT;
		}
		
		private function gameLoop(e:Event):void 
		{
			timer++;
			
			if (timer % 5 == 0)
				actor.mouthOpened ? actor.closeMouth() : actor.openMouth();
			
			(actor.x % 20 == 0 && actor.y % 20 == 0) ? actorCanChangeMovement = true : actorCanChangeMovement = false;
			
			if (actorCanChangeMovement)
				actorMovement = nextActorMovement;
				
			if (actorMovement == ActorMovement.LEFT)
			{
				if (mapModel.obstacleAt(int((actor.x - actorMoveStep + 20) / 20) - 1, int(actor.y / 20)) == false)
					actor.x -= actorMoveStep;
				actor.rotation = 180;
			}
			
			if (actorMovement == ActorMovement.UP)
			{
				if (mapModel.obstacleAt(int(actor.x / 20), int((actor.y - actorMoveStep + 20) / 20) - 1) == false)
					actor.y -= actorMoveStep;
				actor.rotation = 270;
			}
			
			if (actorMovement == ActorMovement.RIGHT)
			{
				if (mapModel.obstacleAt(int((actor.x + actorMoveStep - 1) / 20) + 1, int(actor.y / 20)) == false)
					actor.x += actorMoveStep;
				actor.rotation = 0;
			}
			
			if (actorMovement == ActorMovement.DOWN)
			{
				if (mapModel.obstacleAt(int(actor.x / 20), int((actor.y + actorMoveStep - 1) / 20) + 1) == false)
					actor.y += actorMoveStep;
				actor.rotation = 90;
			}
		}
		
	}
}