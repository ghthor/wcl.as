package wcl.randomization {
	
	/**
	 * ...
	 * @author ...
	 */
	public class Weight {
		public var weight:Number
		public var id:uint
		public var type:String
		public var timesPulled:uint = 0
		
		public function Weight(weight_:Number, id_:uint, type_:String) {
			weight = weight_
			id = id_
			type = type_
		}
		
		public function toString():String {
			return "[Weight] id: " + id + " type: " + type + " weight: " + weight
		}
	}
	
}