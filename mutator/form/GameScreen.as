package mutator.form
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import mutator.Bullet;
	import mutator.BulletRotation;
	import mutator.BulletSize;
	import mutator.OrbitingBullet;
	import mutator.Ship;
	import mutator.statistic.Oscillator;
	import wcl.form.*
	import wcl.math.RandomBool;
	import wcl.math.RandomFloat;
	import wcl.render.Canvas;
	/**
	 * ...
	 * @author ...
	 */
	public class GameScreen extends Form implements I_Form
	{
		// useless atm
		var canvas:Canvas = new Canvas()
		
		var ship:Ship = new Ship()
		
		public var gui_lives:TextField;
		
		public function GameScreen() {
			stop();
		}
		
		private var bullets:Array = new Array()
		
		public function testingInit() {
			FormManager.theStage.addEventListener(MouseEvent.MOUSE_DOWN, shipFireToggle)
			FormManager.theStage.addEventListener(MouseEvent.MOUSE_UP, shipFireToggle)
			//FormManager.theStage.addEventListener(MouseEvent.MOUSE_MOVE, newRandomBullet)
			FormManager.theStage.addEventListener(KeyboardEvent.KEY_UP, keyUp)
		}
		
		var shipFiring:Boolean = false
		private function shipFireToggle(e:MouseEvent):void {
			shipFiring = !shipFiring		
		}
		
		private function spawnBullet(atX:Number, atY:Number):void {
			var bullet:OrbitingBullet = ship.fire()
			//bullet.x = e.stageX - bullet.xOffset()
			//bullet.y = e.stageY
			bullet.x = atX - bullet.xOffset()
			bullet.y = atY
			bullets.push(bullet)
			addChild(bullet)
		}
		
		private function newRandomBullet(e:MouseEvent):void {
			var bullet:OrbitingBullet = new OrbitingBullet()
			bullet.initialize()
			bullet.randomize()
			bullet.defaultVel()
			bullets.push(bullet)
			
			bullet.x = e.stageX - bullet.xOffset()
			bullet.y = e.stageY
			addChild(bullet)
		}
		
		/// Run After All Forms Have Been Created
		public function initialize():void {
			testingInit()
			
			ship.initialize()
			
			addChild(ship);
		}
		
		var Key_W = 87
		var Key_A = 65
		var Key_S = 83
		var Key_D = 68
		var Key_Z = 90
		
		private function keyDown(e:KeyboardEvent):void {
			//trace("Key Down: " + e.keyCode)
			switch (e.keyCode) {
				case Key_W:
				case Keyboard.UP:
					break
				case Key_S:
				case Keyboard.DOWN:
					break
				case Key_A:
				case Keyboard.LEFT:
					break
				case Key_D:
				case Keyboard.RIGHT:
					break
				case Keyboard.ENTER:
				case Keyboard.NUMPAD_ENTER:
				case Keyboard.SPACE:
					break
				default:
					trace("Key Down: " + e.keyCode)
			}
		}
		
		private function keyUp(e:KeyboardEvent):void {
			var char:String = String.fromCharCode(e.charCode)
			switch(char) {
				case "a":
					ship.newBullet()
					break
				default:
					trace("Key Up: " + e.keyCode)
			}
		}
		
		private function tick(e:Event):void {
			
			if (shipFiring) {
				spawnBullet(FormManager.theStage.mouseX, FormManager.theStage.mouseY)
			}
			
			var offscreens:Array = new Array()
			var bullet:OrbitingBullet
			for (var i:int = 0; i < bullets.length; i++) {
				bullet = bullets[i]
				bullet.tick(1.0)
				
				if ((bullet.x < 0 || bullet.x > FormManager.theStage.stageWidth) || (bullet.y < 0 || bullet.y > FormManager.theStage.stageHeight)) {
					removeChild(bullet)
					bullet.cleanUp()
					offscreens.push(bullet)
				}
			}
			for (var i:int = 0; i < offscreens.length; i++) {
				bullets.splice(bullets.indexOf(offscreens[i]),1)
			}
		}
		
		public function enableAllEvents():void{
			//btnStart.addEventListener(MouseEvent.CLICK, gotoGameScreen);
			FormManager.theStage.addEventListener(Event.ENTER_FRAME, tick)
			FormManager.theStage.addEventListener(KeyboardEvent.KEY_UP, keyUp)
			FormManager.theStage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown)
			//FormManager.theStage.addEventListener(MouseEvent.MOUSE_MOVE, updateFacing)
			stage.focus = stage
		}
		
		public function disableAllEvents():void{
			FormManager.theStage.removeEventListener(Event.ENTER_FRAME, tick)
			FormManager.theStage.removeEventListener(KeyboardEvent.KEY_UP, keyUp)
			FormManager.theStage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown)
			//FormManager.theStage.removeEventListener(MouseEvent.MOUSE_MOVE, updateFacing)
		}
				
		/// Stores the Index in the FormManager's Array of This Form
		static private var _id:int;
		static public function get id():int { return _id; }
				
		public function set index(p_val:int):void{
			_id = p_val;
		}
	}	
}