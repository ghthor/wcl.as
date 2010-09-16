package mutator
{
	import mutator.statistic.Oscillator;
	import wcl.math.RandomFloat;
	import wcl.statistic.Complex;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletSize implements Mutatable, Ticker
	{
		public static const MIN:Number = 5
		public static const MAX:Number = 30
		private static var sizeRand:RandomFloat = new RandomFloat(MIN, MAX)
		
		// Smaller equals quicker pulsation
		public static const PERIOD_MIN:Number = 5
		public static const PERIOD_MAX:Number = 20
		private static var periodRand:RandomFloat = new RandomFloat(PERIOD_MIN, PERIOD_MAX)
		
		private static const BULLET_SIZE = 100
		
		public var horizontal:Oscillator
		public var vertical:Oscillator
		
		/* INTERFACE mutator.Mutatable */
		
		public function BulletSize(horizontal_:Oscillator = null, vertical_:Oscillator = null):void {
			if (horizontal_ == null) {
				horizontal = new Oscillator()
				randomizeHorizontal()
			} else {
				horizontal = horizontal_
			}
			if (vertical_ == null) {
				vertical = new Oscillator()
				randomizeVertical()
			} else {
				vertical = vertical_
			}
		}
		
		public static function New():BulletSize {
			var r:BulletSize = new BulletSize()
			return r
		}
		
		public function clone():BulletSize {
			var c:BulletSize = new BulletSize(Oscillator.clone(horizontal), Oscillator.clone(vertical))
			return c
		}
		
		public function get scaleX():Number {
			return horizontal.cur / BULLET_SIZE
		}
		
		public function get scaleY():Number {
			return vertical.cur / BULLET_SIZE
		}
		
		public function randomize():void {
			randomizeHorizontal()
			randomizeVertical()
		}
		
		private function randomizeHorizontal():void {
			horizontal.setMinMaxWithRandoms(sizeRand.next(), sizeRand.next())
			horizontal.period = periodRand.next()
			horizontal.randomStartAndDirection()
		}
		
		private function randomizeVertical():void {
			vertical.setMinMaxWithRandoms(sizeRand.next(), sizeRand.next())			
			vertical.period = periodRand.next()
			vertical.randomStartAndDirection()			
		}
		
		public function tick(percent:Number) {
			horizontal.tick(percent)
			vertical.tick(percent)
		}
		
		public function mutate(seed:Number) {
			
		}
	}
	
}