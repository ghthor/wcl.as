package mutator {
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import wcl.AccurateMovieClip;
	import wcl.form.FormManager;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Ship extends AccurateMovieClip {
		
		private var bulletSpawnPoint:MovieClip;
		public var currentBulletType:OrbitingBullet
		
		public function Ship():void {
			stop()
		}
		
		public function initialize():void {
			//FormManager.theStage.addEventListener(MouseEvent.MOUSE_MOVE, mouseListener)
			x = FormManager.theStage.mouseX
			y = FormManager.theStage.mouseY
			
			bulletSpawnPoint = BulletSpawnPt;
			
			currentBulletType = new OrbitingBullet()
			currentBulletType.initialize()
			currentBulletType.randomize()
			currentBulletType.defaultVel()
		}
		
		public function mouseListener(e:MouseEvent):void {
			x = e.stageX;
			y = e.stageY;
		}
		
		public function newBullet():void {
			currentBulletType = new OrbitingBullet()
			currentBulletType.initialize()
			currentBulletType.randomize()
			currentBulletType.defaultVel()
		}
		
		public function fire():OrbitingBullet {
			return currentBulletType.clone()
		}
		
		
	}
	
}