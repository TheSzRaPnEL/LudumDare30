package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class TetrisModel extends Sprite
	{
		private var obstacleWidth:int = 20;
		private var obstacleHeight:int = 20;
		private var screenWidth:int = 800;
		private var screenHeight:int = 600;
		private var obstacles:Vector.<Vector.<Boolean>>;
		private var blocks:Vector.<Vector.<Block>>;
		private var container:Sprite;
		
		public function TetrisModel() 
		{
			container = new Sprite();
			addChild(container);
			
			obstacles = new Vector.<Vector.<Boolean>>;
			blocks = new Vector.<Vector.<Block>>;
			
			var i:int;
			var j:int;
			var obstaclesCons:int = screenWidth / obstacleWidth;
			var obstaclesRows:int = screenHeight / obstacleHeight;
			for (i = 0; i < obstaclesCons; i++)
			{
				obstacles.push(new Vector.<Boolean>);
				blocks.push(new Vector.<Block>);
				for (j = 0; j < obstaclesRows; j++)
				{
					obstacles[i].push(false);
					var block:Block = new Block();
					block.x = i * obstacleWidth;
					block.y = j * obstacleHeight;
					block.visible = false;
					blocks[i].push(block);
					container.addChild(block);
				}
			}
		}
		
		public function obstacleAt(x:int, y:int):Boolean
		{
			if (obstacles && x >= 0 && y >= 0 && obstacles.length > x && obstacles[x].length > y)
			{
				return obstacles[x][y];
			}
			else
			{
				trace("OUT OF RANGE!")
				return true;
			}
		}
		
		public function setObstacleAt(x:int, y:int):void
		{
			if (obstacles && x >= 0 && y >= 0 && obstacles.length > x && obstacles[x].length > y)
			{
				obstacles[x][y] = true;
				blocks[x][y].visible = true;
			}
		}
		
		public function setNoObstacleAt(x:int, y:int):void
		{
			if (obstacles && x >= 0 && y >= 0 && obstacles.length > x && obstacles[x].length > y)
			{
				obstacles[x][y] = false;
				blocks[x][y].visible = false;
			}
		}
		
	}
}