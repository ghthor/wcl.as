package mutator.enemy {
	import wcl.randomization.Weight;
	import wcl.randomization.WeightedPool;
	
	/**
	 * ...
	 * @author ...
	 */
	public class GenePool extends WeightedPool {
		private static var idCounter:uint = 0
		
		override public function addItemToPool(item:Weight):void {
			item.id = idCounter++
			super(item)
		}
	}
	
}