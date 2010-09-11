package mutator {
	import mutator.statistic.Oscillator;
	import wcl.math.RandomBool;
	import wcl.math.RandomFloat;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletRotation {
		private static const MIN:Number = 1
		private static const MAX:Number = 10
		private static var rotationRand:RandomFloat = new RandomFloat(MIN, MAX)
		
		private static const PERIOD_MIN:Number = 1
		private static const PERIOD_MAX:Number = 50
		private static var periodRand:RandomFloat = new RandomFloat(PERIOD_MIN, PERIOD_MAX)
		
		private var rotation:Oscillator = new Oscillator()
		
		private static const CW:Boolean = false
		private static const CCW:Boolean = true
		
		private var direction:Boolean
		
		public static function New():BulletRotation {
			var r:BulletRotation = new BulletRotation()
			r.randomize()
			return r
		}
		
		public function randomize():void {
			rotation.setMinMaxWithRandoms(rotationRand.next(), rotationRand.next())
			rotation.period = periodRand.next()
			rotation.randomStartAndDirection()
			
			direction = RandomBool.next()
		}
		
		public function get nextRotation():Number {
			if (direction == CCW) {
				return rotation.cur
			} // else direction == CW
			return -rotation.cur
		}
		
		public function tick(percent:Number) {
			rotation.tick(percent)
		}
	}
	
}