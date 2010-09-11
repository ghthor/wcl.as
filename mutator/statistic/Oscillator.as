package mutator.statistic
{
	import mutator.Mutatable;
	import mutator.Ticker;
	import wcl.math.RandomBool;
	import wcl.statistic.Complex;
	
	/**
	 * ...
	 * @author Will Walthall
	 */
	public class Oscillator extends Complex //implements Mutatable, Ticker
	{
		private var _period:Number
		private var direction:Boolean
		private var _start:Number
		
		public function get start():Number { return _start; }		
		public function set start(value:Number):void {
			_start = value;
			if (value <= min) {
				_start = min
			} else if (value >= max) {
				_start = max
			}
			cur = start
		}
		
		public static const TOWARDS_MAX:Boolean = true
		public static const TOWARDS_MIN:Boolean = false
		
		public function Oscillator():void {
			super()
		}
		
		public function get period():Number { return _period; }
		public function set period(value:Number):void {
			_period = value
		}
		
		// I have no idea if these are correct, need to look it up in a physics textbook
		public function get frequency():Number {
			if (_period == 0) {
				return 0
			}
			return 1 / _period
		}
		public function set frequency(value:Number):void {
			if (value != 0) {
				_period = 1 / value
			} else {
				_period = 0
			}
		}
		
		// All ticks should be able to take a Number Param with range [-1,1] signifying reversing an action
		public function tick() {
			if (min == max) {
				return;
			}
			if (direction == TOWARDS_MAX) {
				tickPos()
			} else {
				tickNeg()
			}
		}
		
		private function tickNeg() {
			cur -= (range / period / 2)
			if (cur <= min) {
				direction = !direction
			}
		}
		
		private function tickPos() {
			cur += (range / period / 2)
			if (cur >= max) {
				direction = !direction
			}
		}
		
		public function setStartAndDirection(start_:Number, direction_:Boolean) {
			start = start_
			direction = direction_
		}
		
		public function randomStartAndDirection():void {
			start = randomWithin()
			direction = RandomBool.next()
		}
		
		public function mutate() {
			
		}
	}	
}