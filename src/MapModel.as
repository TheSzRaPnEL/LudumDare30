package  
{
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class MapModel
	{
		private var obstacleWidth:int = 20;
		private var obstacleHeight:int = 20;
		private var screenWidth:int = 800;
		private var screenHeight:int = 600;
		private var obstacles:Vector.<Vector.<Boolean>>;
		
		public function MapModel() 
		{
			obstacles = new Vector.<Vector.<Boolean>>;
			
			var i:int;
			var j:int;
			var obstaclesCons:int = screenWidth / obstacleWidth;
			var obstaclesRows:int = screenHeight / obstacleHeight;
			for (i = 0; i < obstaclesCons; i++)
			{
				obstacles.push(new Vector.<Boolean>);
				for (j = 0; j < obstaclesRows; j++)
				{
					obstacles[i].push(false);
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
			}
		}
		
		public function setNoObstacleAt(x:int, y:int):void
		{
			if (obstacles && x >= 0 && y >= 0 && obstacles.length > x && obstacles[x].length > y)
			{
				obstacles[x][y] = false;
			}
		}
		
	}
}