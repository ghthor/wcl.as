package mutator.statistic {
	import wcl.math.RandomBool;
	
	/**
	 * ...
	 * @author Will Walthall
	 */
	public class RotationOscillator extends Oscillator {
		
		private static const CW:Boolean = false
		private static const CCW:Boolean = true
		
		public var _rotationDirection:Boolean
		
		public static function clone(c:RotationOscillator, r:RotationOscillator = null):RotationOscillator {
			if (r == null) {
				r = new RotationOscillator()
			}
			Oscillator.clone(c, r)
			r._rotationDirection = c._rotationDirection
			return r
		}
		
		public function set rotationDirection(value:Boolean):void {
			_rotationDirection = value;
		}
		public function get rotationDirection():Boolean {
			return _rotationDirection
		}
		
		public function randomizeDirection():void {
			_rotationDirection = RandomBool.next()
		}
		
		public function get nextRotation():Number {
			if (_rotationDirection == CCW) {
				return cur
			} // else direction == CW
			return -cur
		}
		
		override public function tick(percent:Number) {
			super.tick(percent)
		}
	}
	
}