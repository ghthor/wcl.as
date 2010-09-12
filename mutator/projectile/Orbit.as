package mutator.projectile {
	import mutator.statistic.Oscillator;
	import mutator.statistic.RotationOscillator;
	import wcl.math.RandomFloat;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Orbit {
		
		// Maximum/Min degee change
		private static const MIN_SPEED:Number = 1
		private static const MAX_SPEED:Number = 10
		private static var speedRand:RandomFloat = new RandomFloat(MIN_SPEED, MAX_SPEED)
		
		private static const PERIOD_MIN:Number = 10
		private static const PERIOD_MAX:Number = 100
		private static var periodRand:RandomFloat = new RandomFloat(PERIOD_MIN, PERIOD_MAX)
		
		private static const MIN_ORBIT_DISTANCE:Number = 0
		private static const MAX_ORBIT_DISTANCE:Number = 40
		private static var orbitDistanceRand:RandomFloat = new RandomFloat(MIN_ORBIT_DISTANCE, MAX_ORBIT_DISTANCE)
		
		private var rotation:RotationOscillator
		private var _distance:Oscillator
		
		public function Orbit():void {
			rotation = new RotationOscillator()
			_distance = new Oscillator()
		}
		
		public static function New():Orbit {
			var o:Orbit = new Orbit()
			o.randomize()
			return o
		}
		
		public function randomize():void {
			rotation.setMinMaxWithRandoms(speedRand.next(), speedRand.next())
			rotation.period = periodRand.next()
			
			// This is the direction of the rotation
			rotation.randomizeDirection()
			
			// this is the direction of the oscillation
			rotation.randomStartAndDirection()
			
			// The Oscillation for the distance from the center point
			_distance.setMinMaxWithRandoms(orbitDistanceRand.next(), orbitDistanceRand.next())
			_distance.period = RandomFloat.within(10,20)
			_distance.randomStartAndDirection()
		}
		
		public function tick(percent:Number):void {
			rotation.tick(percent)
			_distance.tick(percent)
		}
		
		public function get distance():Number { return _distance.cur; }
		public function get nextRotation():Number { return rotation.nextRotation; }
	}
	
}