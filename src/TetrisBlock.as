package
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class TetrisBlock extends Sprite
	{
		private var container:Sprite;
		private var blocks:Vector.<Vector.<Block>>;
		private var blockModels:Vector.<Vector.<Boolean>>;
		private var size:int = 20;
		
		public function TetrisBlock()
		{
			container = new Sprite();
			addChild(container);
			
			blocks = new Vector.<Vector.<Block>>;
			blockModels = new Vector.<Vector.<Boolean>>;
			
			var i:int;
			var j:int;
			for (i = 0; i < 5; i++)
			{
				blocks.push(new Vector.<Block>);
				blockModels.push(new Vector.<Boolean>);
				for (j = 0; j < 5; j++)
				{
					blockModels[i].push(false);
					var block:Block = new Block();
					block.x = i * size;
					block.y = j * size;
					block.visible = false;
					blocks[i].push(block);
					container.addChild(block);
				}
			}
		}
		
		public function blockAt(x:int, y:int):Boolean
		{
			if (blockModels && x >= 0 && y >= 0 && blockModels.length > x && blockModels[x].length > y)
			{
				return blockModels[x][y];
			}
			else
			{
				trace("OUT OF RANGE!")
				return true;
			}
		}
		
		public function setBlockAt(x:int, y:int):void
		{
			if (blockModels && x >= 0 && y >= 0 && blockModels.length > x && blockModels[x].length > y)
			{
				blockModels[x][y] = true;
				blocks[x][y].visible = true;
			}
		}
		
		public function setNoBlockAt(x:int, y:int):void
		{
			if (blockModels && x >= 0 && y >= 0 && blockModels.length > x && blockModels[x].length > y)
			{
				blockModels[x][y] = false;
				blocks[x][y].visible = false;
			}
		}
		
		public function clearBlocks():void
		{
			for (var i:int = 0; i < blockModels.length; i++)
			{
				for (var j:int = 0; j < blockModels[i].length; j++)
				{
					blockModels[i][j] = false;
					blocks[i][j].visible = false;
				}
			}
		}
	
	}
}