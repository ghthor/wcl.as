package mutator.statistic {
	import wcl.math.RandomBool;
	
	/**
	 * ...
	 * @author Will Walthall
	 */
	public class RotationOscillator extends Oscillator {
		
		private static const CW:Boolean = false
		private static const CCW:Boolean = true
		
		private var rotationDirection:Boolean
		
		public function randomizeDirection():void {
			rotationDirection = RandomBool.next()
		}
		
		public function get nextRotation():Number {
			if (rotationDirection == CCW) {
				return cur
			} // else direction == CW
			return -cur
		}
		
		override public function tick(percent:Number) {
			super.tick(percent)
		}
	}
	
}