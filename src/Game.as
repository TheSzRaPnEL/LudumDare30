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
		private var mapOffsetX:Number;
		private var mapOffsetY:Number;
		
		//tetris
		private var tetrisModel:TetrisModel;
		private var tetrisBlock:TetrisBlock;
		private var blockMovementStep:Number;
		
		
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
			mapOffsetX = 10;
			mapOffsetY = 3;
			for (i = 0; i < cols; i++)
			{
				for (j = 0; j < rows; j++)
				{
					mapModel.setNoObstacleAt(i + mapOffsetX, j + mapOffsetY);
				}
			}
			
			var block:Block;
			for (i = 0; i < cols+3; i++)
			{
				block = new Block();
				block.x = (i + mapOffsetX - 2) * 20;
				block.y = (mapOffsetY - 2) * 20;
				addChild(block);
				mapModel.setObstacleAt(int(block.x / 20), int(block.y / 20));
			}
			for (i = 0; i < cols+3; i++)
			{
				block = new Block();
				block.x = (i + mapOffsetX - 2) * 20;
				block.y = (mapOffsetY + rows) * 20;
				addChild(block);
				mapModel.setObstacleAt(int(block.x / 20), int(block.y / 20));
			}
			for (j = 0; j < rows+1; j++)
			{
				block = new Block();
				block.x = (mapOffsetX - 2) * 20;
				block.y = (j + mapOffsetY-1) * 20;
				addChild(block);
				mapModel.setObstacleAt(int(block.x / 20), int(block.y / 20));
			}
			for (j = 0; j < rows+1; j++)
			{
				block = new Block();
				block.x = (mapOffsetX + cols) * 20;
				block.y = (j + mapOffsetY-1) * 20;
				addChild(block);
				mapModel.setObstacleAt(int(block.x / 20), int(block.y / 20));
			}
			
			tetrisModel = new TetrisModel();
			addChild(tetrisModel);
			
			for (i = 0; i < 40; i++)
			{
				for (j = 0; j < 30; j++)
				{
					if (mapModel.obstacleAt(i, j))
						tetrisModel.setObstacleAt(i, j);
				}
			}
			
			blockMovementStep = 20;
			
			tetrisBlock = new TetrisBlock();
			tetrisBlock.x = (mapOffsetX + 4) * 20;
			tetrisBlock.y = (mapOffsetY + 3) * 20;
			tetrisBlock.setBlockAt(0, 0);
			tetrisBlock.setBlockAt(1, 0);
			tetrisBlock.setBlockAt(2, 0);
			addChild(tetrisBlock);
			
			actor.x = (mapOffsetX+cols-1) * 20;
			actor.y = (mapOffsetY-1) * 20;
			
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
				
			if (timer % 30 == 0)
			{
				if (checkTetrisCollision())
				{
					addTetrisBlockToTetrisModel();
					addTetrisBlockToMapModel();
					createNewTetrisBlock();
				}
				else
				{
					tetrisBlock.y += blockMovementStep;
				}
			}
			
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
		
		private function addTetrisBlockToTetrisModel():void 
		{
			for (var i:int = 0; i < 5; i++)
			{
				for (var j:int = 0; j < 5; j++)
				{
					if (tetrisBlock.blockAt(i, j))
					{
						tetrisModel.setObstacleAt(int((tetrisBlock.x + i * 20) / 20), int((tetrisBlock.y + j * 20) / 20));
					}
				}
			}
		}
		
		private function addTetrisBlockToMapModel():void 
		{
			for (var i:int = 0; i < 5; i++)
			{
				for (var j:int = 0; j < 5; j++)
				{
					if (tetrisBlock.blockAt(i, j))
					{
						mapModel.setObstacleAt(int((tetrisBlock.x + i * 20) / 20), int((tetrisBlock.y + j * 20) / 20));
					}
				}
			}
		}
		
		private function checkTetrisCollision():Boolean 
		{
			for (var i:int = 0; i < 5; i++)
			{
				for (var j:int = 0; j < 5; j++)
				{
					if (tetrisBlock.blockAt(i, j) && tetrisModel.obstacleAt(int((tetrisBlock.x + i * 20) / 20), int((tetrisBlock.y + j * 20) / 20) + 1))
					{
						return true;
					}
				}
			}
			
			return false;
		}
		
		private function createNewTetrisBlock():void 
		{
			tetrisBlock.clearBlocks();
			tetrisBlock.setBlockAt(int(5 * Math.random()), int(5 * Math.random()));
			tetrisBlock.setBlockAt(int(5 * Math.random()), int(5 * Math.random()));
			tetrisBlock.setBlockAt(int(5 * Math.random()), int(5 * Math.random()));
			tetrisBlock.setBlockAt(int(5 * Math.random()), int(5 * Math.random()));
			
			tetrisBlock.x = (mapOffsetX + 4) * 20;
			tetrisBlock.y = (mapOffsetY + 3) * 20;
		}
		
	}
}