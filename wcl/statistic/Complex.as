package wcl.statistic
{
	import wcl.math.RandomFloat;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Complex
	{
		private var _min:Number;	
		private var _max:Number;		
		private var _cur:Number;	
		
		public function Complex() {
			_min = _max = _cur = 0
		}
		
		public function clone():Complex {
			var c:ComplexStat = new Complex();
			c.min = _min;
			c.max = _max;
			c.cur = _cur;
			
			return c;
		}
		
		public function get range():Number {
			return max - min;
		}
		
		public function get min():Number { return _min; }		
		public function set min(value:Number):void {
			_min = value;
			if (_cur < _min) {
				_cur = _min
			}
		}
		
		public function get max():Number { return _max; }		
		public function set max(value:Number):void {
			_max = value;
			if (_cur > _max) {
				_cur = _max
			}
		}
		
		public function get cur():Number { return _cur; }		
		public function set cur(value:Number):void {
			if (value <= _min) {
				_cur = _min
			} else if ( value >= _max) {
				_cur = _max
			} else {
				_cur = value
			}
		}
		
		// takes to randoms and sets the smaller to min and the larger to max
		// after that also sets cur to max
		public function setMinMaxWithRandoms(rand1:Number, rand2:Number) {
			_min = Math.min(rand1, rand2)
			_max = Math.max(rand1, rand2)
			_cur = _max
		}
		
		public function setToMax() {
			_cur = _max
		}
		
		public function setToMin() {
			_cur = _min
		}
		
		public function randomWithin() {
			return RandomFloat.within(min, max)
		}
		
		public function toString():String {
			var str:String = "Statistic [" + min + ":" + max + "] range: " + range + " cur: " + cur
			return str
		}
	}	
}