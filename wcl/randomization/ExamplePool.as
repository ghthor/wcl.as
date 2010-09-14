package wcl.randomization {
	
	/**
	 * ...
	 * @author ...
	 */
	public class ExamplePool extends WeightedPool {
		
		private static var idCounter:uint = 0
		
		public var returns:Array = new Array()
		
		public function ExamplePool() {
			// lets do a stack of cards
			addAnItemToPool(new Weight(0, idCounter++, "0"))
			addAnItemToPool(new Weight(1, idCounter++, "1"))
			addAnItemToPool(new Weight(2, idCounter++, "2"))
			addAnItemToPool(new Weight(3, idCounter++, "3"))
			addAnItemToPool(new Weight(4, idCounter++, "4"))
			addAnItemToPool(new Weight(5, idCounter++, "5"))
			addAnItemToPool(new Weight(20, idCounter++, "20"))
		}
	}
	
}