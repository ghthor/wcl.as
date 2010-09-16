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
		private static const MIN_SPEED:Number = -10
		private static const MAX_SPEED:Number = 10
		private static var speedRand:RandomFloat = new RandomFloat(MIN_SPEED, MAX_SPEED)
		
		// Period of oscillation between the min/max of the angle oscillation
		private static const MIN_SPEED_PERIOD:Number = 1
		private static const MAX_SPEED_PERIOD:Number = 50
		private static var speedPeriodRand:RandomFloat = new RandomFloat(MIN_SPEED_PERIOD, MAX_SPEED_PERIOD)
		
		// Distance from the center point
		private static const MIN_ORBIT_DISTANCE:Number = -100
		private static const MAX_ORBIT_DISTANCE:Number = 100
		private static var orbitDistanceRand:RandomFloat = new RandomFloat(MIN_ORBIT_DISTANCE, MAX_ORBIT_DISTANCE)
		
		// Period for the oscillation between the min/max of the Distance from the center point
		private static const MIN_ORBIT_PERIOD:Number = 50
		private static const MAX_ORBIT_PERIOD:Number = 100
		private static var orbitPeriodRand:RandomFloat = new RandomFloat(MIN_ORBIT_PERIOD, MAX_ORBIT_PERIOD);
		
		private var _rotation:RotationOscillator
		private var _distance:Oscillator
		
		public function Orbit(rotation_:RotationOscillator = null, distance_:Oscillator = null):void {
			if (rotation_ == null) {
				_rotation = new RotationOscillator()
				randomizeRotation()
			} else {
				_rotation = rotation_
			}
			if (distance_ == null) {
				_distance = new Oscillator()
				randomizeDistance()
			} else {
				_distance = distance_
			}
		}
		
		public function clone():Orbit {
			var o:Orbit = new Orbit(RotationOscillator.clone(_rotation), Oscillator.clone(_distance))
			return o
		}
		
		private function randomizeRotation():void {
			_rotation.setMinMaxWithRandoms(speedRand.next(), speedRand.next())
			_rotation.period = speedPeriodRand.next()
			
			// This is the direction of the rotation
			_rotation.randomizeDirection()
			
			// this is the direction of the oscillation
			_rotation.randomStartAndDirection()
		}
		
		private function randomizeDistance():void {
			// The Oscillation for the distance from the center point
			_distance.setMinMaxWithRandoms(orbitDistanceRand.next(), orbitDistanceRand.next())
			_distance.period = orbitPeriodRand.next()
			_distance.randomStartAndDirection()
		}
		
		public function randomize():void {		
			randomizeRotation()
			randomizeDistance()
		}
		
		public function tick(percent:Number):void {
			_rotation.tick(percent)
			_distance.tick(percent)
		}
		
		public function get distance():Number { return _distance.cur; }
		public function get nextRotation():Number { return _rotation.nextRotation; }
	}
	
}