package
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Block extends Sprite
	{
		private var container:Sprite;
		private const size:int = 20;
		
		public function Block()
		{
			container = new Sprite();
			addChild(container);
			
			var square:Sprite = new Sprite();
			square.graphics.beginFill(0xFF0000);
			square.graphics.drawRect(0, 0, size, size);
			square.graphics.endFill();
			container.addChild(square);
			
			container.x = -size / 2;
			container.y = -size / 2;
		}
	
	}
}