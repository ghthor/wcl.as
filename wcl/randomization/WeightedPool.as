package wcl.randomization {
	import wcl.math.RandomFloat;
	
	/**
	 * ...
	 * @author Will Walthall
	 */
	public class WeightedPool {
		public var objects:Array = new Array()
		
		public function totalWeight():Number {
			var total:Number = 0
			for (var i:int = 0; i < objects.length; i++) {
				total += (objects[i] as WeightedObject).weight
			}
			return total
		}
		
		public function next():WeightedObjectId {
			var lowerBounds:Number = 0
			var upperBounds:Number
			
			var thePickValue:Number = RandomFloat(0, totalWeight())
			
			var weightedObject:WeightedObject
			for (var i:int = 0; i < objects.length; i++) {
				weightedObject = weightObjectAt(i)
				upperBounds = lowerBounds + weightedObject.weight
				if (thePickValue >= lowerBounds && thePickValue < upperBounds) {
					return weightedObject.id
				}
				lowerBounds = upperBounds
			}
			trace("Some Sort of failure, wasn't an object pulled")
			return weightedObject.id
		}
		
		private function weightObjectAt(index:int):WeightedObject {
			return (objects[index] as WeightedObject)
		}
	}
	
}