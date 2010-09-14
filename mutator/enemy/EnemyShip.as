package mutator.enemy {
	import wcl.AccurateMovieClip;
	import wcl.math.Vector2D;
	
	/**
	 * ...
	 * @author ...
	 */
	public class EnemyShip extends AccurateMovieClip {
		
		public static var genePool:GenePool = new GenePool()
		public static var all:Array = new Array()
		
		var dna:Array = new Array()
		
		public var velocity:Vector2D = new Vector2D()
		
		const NUMBER_OF_GENES:uint = 20
		
		public static function initialize():void {
			// Fill the Gene Pool
		}
		
		public function Enemy() {
			super()
			stop()
		}		
	}	
}