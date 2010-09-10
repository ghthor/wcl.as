package wcl.statistic
{
	
	/**
	 * ...
	 * @author ...
	 */
	public class Complex
	{
		public var min:Number;
		public var max:Number;
		public var cur:Number;		
		
		public function clone():Complex {
			var c:ComplexStat = new Complex();
			c.min = min;
			c.max = max;
			c.cur = cur;
			
			return c;
		}
		
		public function get range():Number {
			return max - min;
		}
		
		public function setToMax() {
			cur = max
		}
		
		public function setToMin() {
			cur = min
		}
		
		public function toString():String {
			var str:String = "Statistic [" + min + ":" + max + "] range: " + range + " cur: " + cur
			return str
		}
	}	
}