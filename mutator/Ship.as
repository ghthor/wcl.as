package mutator {
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import wcl.form.FormManager;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Ship extends MovieClip {
		
		private var _X:Number;
		private var _Y:Number;
		
		private var bulletSpawnPoint:MovieClip;
		
		public function Ship():void {
			stop()
		}
		
		public function initialize():void {
			//FormManager.theStage.addEventListener(MouseEvent.MOUSE_MOVE, mouseListener)
			x = FormManager.theStage.mouseX
			y = FormManager.theStage.mouseY
			
			bulletSpawnPoint = BulletSpawnPt;
		}
		
		public function mouseListener(e:MouseEvent):void {
			x = e.stageX;
			y = e.stageY;
		}
		
		public function fire(e:MouseEvent):void {
			
		}
		
		override public function set x(_x:Number):void {
			_X = _x
			super.x = _X
		}
		
		override public function get x():Number {
			super.x
			return _X
		}
		
		override public function set y(_y:Number):void {
			_Y = _y
			super.y = _Y
		}
		
		override public function get y():Number {
			super.y
			return _Y
		}
	}
	
}