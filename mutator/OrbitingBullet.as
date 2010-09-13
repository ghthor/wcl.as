package mutator {
	import mutator.projectile.Orbit;
	import mutator.statistic.Oscillator;
	import wcl.AccurateSprite;
	import wcl.math.RandomBool;
	import wcl.math.RandomFloat;
	import wcl.math.Vector2D;
	
	/**
	 * ...
	 * @author Will Walthall
	 */
	public class OrbitingBullet extends AccurateSprite {
			
		private static const MIN_SPEED:Number = 3
		private static const MAX_SPEED:Number = 7
		
		private static const MIN_ROTATION:Number = 1
		private static const MAX_ROTATION:Number = 10
		private static var rotationRand:RandomFloat = new RandomFloat(MIN_ROTATION, MAX_ROTATION)
		
		public var bullet:Bullet
		public var velocity:Vector2D
		public var orbit:Orbit
		public var orbitStartsOnRight:Boolean = false
		
		public function OrbitingBullet():void {
			super()
		}
		
		public function clone():OrbitingBullet {
			var o:OrbitingBullet = new OrbitingBullet()
			
			// clone the bullet
			o.bullet = bullet.clone()
			
			// clone velocity
			o.velocity = new Vector2D(velocity.x, velocity.y)
			
			// clone the orbit
			o.orbit = orbit.clone()
			
			// clone the orbit anchor Position
			o.orbitStartsOnRight = orbitStartsOnRight
			
			o.initialize()
			
			return o
		}
		
		public function initialize():void {
			if (velocity == null) {
				velocity = new Vector2D()
			}
			if (orbit == null) {
				orbit = new Orbit()
			}
			if (bullet == null) {
				bullet = new Bullet()
			}
			bullet.x = xOffset()
			addChild(bullet)
		}
		
		public function randomizeVel():void {
			var speed:Number = RandomFloat.within(MIN_SPEED, MAX_SPEED)
			var angle:Number = RandomFloat.within(0, 360)
			
			velocity.setWithDegreesAndLength(angle, speed)
		}
		
		public function defaultVel():void {
			velocity.setWithDegreesAndLength(-90, 7);
		}
		
		public function randomize():void {
			randomizeVel()
			bullet.randomize()
			orbit.randomize()
			
			orbitStartsOnRight = RandomBool.next()
		}
		
		public function xOffset():Number {
			if (orbitStartsOnRight) {
				return -orbit.distance
			} else {
				return orbit.distance
			}
		}
		
		public function cleanUp():void {
			removeChild(bullet)
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
			
			bullet.x = xOffset()		
			rotation += orbit.nextRotation
		}
	}
	
}