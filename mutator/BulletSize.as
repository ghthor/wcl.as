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
		public static const MAX:Number = 50
		public static const MIN:Number = 1
		private static var sizeRand:RandomFloat = new RandomFloat(MIN, MAX)
		
		// Smaller equals quicker pulsation
		public static const PERIOD_MIN:Number = 1
		public static const PERIOD_MAX:Number = 50
		private static var periodRand:RandomFloat = new RandomFloat(PERIOD_MIN, PERIOD_MAX)
		
		private static const BULLET_SIZE = 100
		
		public var horizontal:Oscillator = new Oscillator()
		public var vertical:Oscillator = new Oscillator()
		
		/* INTERFACE mutator.Mutatable */
		
		public static function New():BulletSize {
			var r:BulletSize = new BulletSize();
			r.randomize()
			return r
		}
		
		public function get scaleX():Number {
			return horizontal.cur / BULLET_SIZE
		}
		
		public function get scaleY():Number {
			return vertical.cur / BULLET_SIZE
		}
		
		public function randomize():void {
			horizontal.setMinMaxWithRandoms(sizeRand.next(), sizeRand.next())
			vertical.setMinMaxWithRandoms(sizeRand.next(), sizeRand.next())
			
			horizontal.period = periodRand.next()
			horizontal.randomStartAndDirection()
			
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