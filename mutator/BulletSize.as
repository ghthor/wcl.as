package mutator
{
	import mutator.statistic.Oscillator;
	import wcl.statistic.Complex;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletSize implements Mutatable, Ticker
	{
		public const MAX:Number = 10;
		public const MIN:Number = 5;
		
		public const PERIOD_MIN = 10;
		public const PERIOD_MAX = 50;
		
		public var horizontal:Complex;
		public var vertical:Complex;
		
		/* INTERFACE mutator.Mutatable */
		
		public static function New():BulletSize {
			
		}
		
		public function mutate(seed:Number) {
			
		}
	}
	
}