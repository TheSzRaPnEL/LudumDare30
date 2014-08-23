package
{
	import flash.display.BlendMode;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class PacMan extends Sprite
	{
		private var container:Sprite;
		private var mouth:Sprite;
		private const size:int = 10;
		
		public function PacMan()
		{
			container = new Sprite();
			addChild(container);
			container.blendMode = BlendMode.LAYER;
			
			var circle:Sprite = new Sprite();
			circle.graphics.beginFill(0xFFFF00);
			circle.graphics.drawCircle(0, 0, size);
			circle.graphics.endFill();
			container.addChild(circle);
			
			mouth = new Sprite();
			mouth.graphics.beginFill(0xFFFFFF);
			mouth.graphics.lineTo(size, -size * 7 / 10);
			mouth.graphics.lineTo(size, size * 7 / 10);
			mouth.graphics.lineTo(0, 0);
			mouth.graphics.endFill();
			mouth.blendMode = BlendMode.ERASE;
			container.addChild(mouth);
			
		}
		
		public function openMouth():void
		{
			mouth.visible = true;
		}
		
		public function closeMouth():void
		{
			mouth.visible = false;
		}
		
		override public function set rotation(value:Number):void
		{
			container.rotation = value;
		}
		
		override public function get rotation():Number
		{
			return container.rotation;
		}
		
	}
}