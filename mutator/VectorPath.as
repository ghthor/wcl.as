package mutator {
	import flash.geom.Point;
	import wcl.math.Vector2D;
	
	/**
	 * ...
	 * @author ...
	 */
	public class VectorPath {
		public var vectors:Array = new Array()
		
		public function randomizePath(startVect:Vector2D, tolerance:Number, maxMag:Number):void {
			vectors.splice(0, vectors.length)
			
			var temp:Vector2D
			for (;; ) {
				
			}
		}
		
		public function finalPointFrom(pt:Vector2D):Vector2D {
			for (var i:int = 0; i < vectors.length; i++) {
				pt.addVector2D(vectors[i] as Vector2D)
			}
			return pt
		}
	}	
}