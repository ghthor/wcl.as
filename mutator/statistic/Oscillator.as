package mutator.statistic
{
	import mutator.Mutatable;
	import mutator.Ticker;
	import wcl.statistic.Complex;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Oscillator extends Complex implements Mutatable, Ticker
	{
		private var _period:Number
		private var directionIsPositive:Boolean
		
		public function get period():Number { return _period; }
		public function set period(value:Number):void 
		{
			_period = value
		}
		
		public function get frequency():Number { return 1 / _period; }
		public function set frequency(value:Number):void 
		{
			_period = Math.pow(value,-1)
		}
		
		public function tick() {
			if (min == max) {
				return;
			}
			if (directionIsPositive) {
				tickPos()
			} else {
				tickNeg()
			}
		}
		
		private function tickNeg() {
			cur -= (range / period / 2)
			if (cur == min) {
				directionIsPositive = true
			}
		}
		
		private function tickPos() {
			cur += (range / period / 2)
			if (cur == max) {
				directionIsPositive = false
			}
		}
		
		public function mutate() {
			
		}
	}	
}