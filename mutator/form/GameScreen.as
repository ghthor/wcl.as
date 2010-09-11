package mutator.form
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import mutator.BulletRotation;
	import mutator.BulletSize;
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
		
		var test:Oscillator = new Oscillator()
		
		var testBullet:MovieClip;
		var testBulletSize:BulletSize;
		var testBulletRotation:BulletRotation;
		
		public var gui_lives:TextField;
		
		public function GameScreen() {
			stop();
		}
		
		public function testingInit() {
			testBullet = new Bullet()
			testBulletSize = BulletSize.New()
			testBulletRotation = BulletRotation.New()
			testBullet.x = 100
			testBullet.y = 100
			addChild(testBullet)
			
			testBullet.addEventListener(MouseEvent.CLICK, randomizeSize)
			testBullet.mouseEnabled = true
		}
		
		private function randomizeSize(e:MouseEvent):void {
			testBulletSize.randomize()
			testBulletRotation.randomize()
		}		
		
		public function updateTest() {
			testBullet.scaleX = testBulletSize.scaleX
			testBullet.scaleY = testBulletSize.scaleY
			testBullet.rotation += testBulletRotation.nextRotation
		}
		
		/// Run After All Forms Have Been Created
		public function initialize():void {
			
			testingInit()
			
			ship.initialize()
			
			addChild(ship);
			
			test.setMinMaxWithRandoms(RandomFloat.within(0, 10), RandomFloat.within(0, 10))
			test.period = RandomFloat.within(10,20)
			test.setStartAndDirection(test.randomWithin(), RandomBool.next())
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
			switch(e.keyCode) {
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
					//trace("Key Up: " + e.keyCode)
			}
		}
		
		private function tick(e:Event):void {
			//test.tick()
			//trace(test)
			testBulletSize.tick()
			testBulletRotation.tick()
			updateTest()
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