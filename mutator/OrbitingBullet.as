package mutator {
	import mutator.projectile.Orbit;
	import mutator.statistic.Oscillator;
	import wcl.AccurateSprite;
	import wcl.math.RandomFloat;
	import wcl.math.Vector2D;
	
	/**
	 * ...
	 * @author ...
	 */
	public class OrbitingBullet extends AccurateSprite {
			
		private static const MIN_SPEED:Number = 3
		private static const MAX_SPEED:Number = 7
		
		private static const MIN_ROTATION:Number = 1
		private static const MAX_ROTATION:Number = 10
		private static var rotationRand:RandomFloat = new RandomFloat(MIN_ROTATION, MAX_ROTATION)
		
		private static const PERIOD_MIN:Number = 1
		private static const PERIOD_MAX:Number = 50
		private static var periodRand:RandomFloat = new RandomFloat(PERIOD_MIN, PERIOD_MAX)
		
		private static const MIN_ORBIT_DISTANCE:Number = 0
		private static const MAX_ORBIT_DISTANCE:Number = 20
		private static var orbitDistanceRand:RandomFloat = new RandomFloat(MIN_ORBIT_DISTANCE, MAX_ORBIT_DISTANCE)
		
		public var bullet:Bullet
		public var velocity:Vector2D
		public var orbit:Orbit
		
		public function OrbitingBullet():void {
			super()
		}
		
		public function initialize():void {
			velocity = new Vector2D()
			
			bullet = new Bullet()
			bullet.initialize()
			bullet.x = 0
			addChild(bullet)
			
			orbit = Orbit.New()
		}
		
		public function randomizeVel():void {
			var speed:Number = RandomFloat.within(MIN_SPEED, MAX_SPEED)
			var angle:Number = RandomFloat.within(0, 360)
			
			velocity.setWithDegreesAndLength(angle, speed)
		}
		
		public function randomize():void {			
			randomizeVel()
			bullet.randomize()
			orbit.randomize()
		}
		
		public function tick(percent:Number):void {
			// Modify the velocity to reflect the Percent
			var tempVelocity:Vector2D = velocity.toUnitVector()
			tempVelocity.scale(velocity.length * percent)
			
			// Update position
			x += tempVelocity.x
			y += tempVelocity.y
			
			bullet.tick(percent)			
			orbit.tick(percent)
			
			bullet.x = orbit.distance
			rotation += orbit.nextRotation
		}
	}
	
}