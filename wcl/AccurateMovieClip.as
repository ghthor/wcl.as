package wcl {
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Will Walthall
	 */
	public class AccurateMovieClip extends MovieClip {
		
		private var _X:Number;
		private var _Y:Number;
		private var __rotation:Number;
		
		public function AccurateMovieClip():void {
			super()
			__rotation = super.rotation
			x = super.x
			y = super.y
		}
		
		override public function get rotation():Number {
			super.rotation
			return __rotation;
		}
		
		override public function set rotation(value:Number):void {
			__rotation = value
			super.rotation = __rotation
		}
		
		override public function set x(_x:Number):void {
			_X = _x
			super.x = _X
		}
		
		override public function get x():Number {
			super.x
			return _X
		}
		
		override public function set y(_y:Number):void {
			_Y = _y
			super.y = _Y
		}
		
		override public function get y():Number {
			super.y
			return _Y
		}
	}
	
}