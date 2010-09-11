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
		public const MAX:Number = 10
		public const MIN:Number = 5	
		private static var sizeRand:RandomFloat = new RandomFloat(MIN, MAX)
		
		// Smaller equals quicker pulsation
		public const PERIOD_MIN:Number = 10
		public const PERIOD_MAX:Number = 50
		private static var periodRand:RandomFloat = new RandomFloat(PERIOD_MIN, PERIOD_MAX)
		
		public var horizontal:Oscillator = new Oscillator()
		public var vertical:Oscillator = new Oscillator()
		
		/* INTERFACE mutator.Mutatable */
		
		public static function New():BulletSize {
			var r:BulletSize = new BulletSize();
			horizontal.setMinMaxWithRandoms(sizeRand.next(), sizeRand.next())
			vertical.setMinMaxWithRandoms(sizeRand.next(), sizeRand.next())
			
			horizontal.period = periodRand.next()
			vertical.period = periodRand.next()
		}
		
		public function mutate(seed:Number) {
			
		}
		
		public function tick() {
			horizontal.tick()
			vertical.tick()
		}
	}
	
}