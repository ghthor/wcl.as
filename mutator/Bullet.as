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
		
		//public var velocity:Vector2D
		
		private var size:BulletSize
		private var rotater:BulletRotation
		
		public function initialize():void {
			//velocity = new Vector2D()
			//randomizeVel()
			size = BulletSize.New()
			rotater = BulletRotation.New()
		}
		
		public function randomize():void {
			//randomizeVel()
			size.randomize()
			rotater.randomize()
		}
		
		public function tick(percent:Number):void {
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