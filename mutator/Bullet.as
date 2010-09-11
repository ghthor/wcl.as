package mutator {
	import mutator.BulletRotation;
	import mutator.BulletSize;
	import wcl.AccurateMovieClip;
	import wcl.math.RandomFloat;
	import wcl.math.Vector2D;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Bullet extends AccurateMovieClip {
		
		private static const MIN_SPEED:Number = 1
		private static const MAX_SPEED:Number = 10
		
		public var velocity:Vector2D
		
		private var size:BulletSize
		private var rotater:BulletRotation
		
		public function initalize():void {
			velocity = new Vector2D()
			randomizeVel()
			size = BulletSize.New()
			rotater = BulletRotation.New()
		}
		
		public function randomizeVel():void {
			var speed:Number = RandomFloat.within(MIN_SPEED, MAX_SPEED)
			var angle:Number = RandomFloat.within(0, 360)
			
			velocity.setWithDegreesAndLength(angle, speed)
		}
		
		public function randomize():void {
			randomizeVel()
			size.randomize()
			rotater.randomize()
		}
		
		public function tick(percent:Number):void {
			
			// Modify the velocity to reflect the Percent
			var tempVelocity:Vector2D = velocity.toUnitVector()
			tempVelocity.scale(velocity.length * percent)
			
			// Update position
			x += tempVelocity.x
			y += tempVelocity.y
			
			// Tick the size and rotater
			size.tick(percent)
			rotater.tick(percent)
			
			// Update size and rotation
			scaleX = size.scaleX
			scaleY = size.scaleY
			
			rotation += rotater.nextRotation
		}
		
	}
	
}