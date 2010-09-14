package mutator {
	import flash.geom.Point;
	import wcl.math.RandomFloat;
	import wcl.math.Vector2D;
	
	/**
	 * ...
	 * @author ...
	 */
	public class VectorPath {
		public var vectors:Array = new Array()
		private var _nextMotion:int = 0		
		
		public function appendRandomVector(seedVect:Vector2D, angleTolerance:Number):void {
			
			var maxMag:Number = seedVect.length
			var minMag:Number = .1
			
			var randMag:RandomFloat = new RandomFloat(minMag, maxMag)
			
			var seedAngle:Number
			
			if (vectors.length == 0) {
				seedAngle = seedVect.toDegrees()
			} else {
				seedAngle = vectors[vectors.length - 1].toDegrees()
			}
			
			var v:Vector2D = Vector2D.NewWithDegreesAndMag(RandomFloat.within(seedAngle - tolerance, seedAngle + tolerance), randMag.next())
			vectors.push(v)
		}
		
		public function finalPointFrom(pt:Vector2D):Vector2D {
			for (var i:int = 0; i < vectors.length; i++) {
				pt.addVector2D(vectors[i] as Vector2D)
			}
			return pt
		}
		
		public function totalLength():Number {
			var len:Number = 0
			for (var i:int = 0; i < vectors.length; i++) {
				len += vectors[i].length
			}
			return len
		}
		
		private function nextMotionIndex():uint {
			if (_nextMotion == vectors.length) {
				_nextMotion = 0
				return 0
			} else {
				return _nextMotion++
			}
		}
		
		private function nextMotionIndex():int {
			if (_nextMotion == vectors.length) {
				_nextMotion = 0
			}
			return _nextMotion++
		}
		
		private function prevMotionIndex():int {
			if (_nextMotion == -1) {
				_nextMotion == vectors.length - 1
			}
			return _nextMotion--
		}
		
		public function nextMotion():Vector2D {
			return vectors[nextMotionIndex()]
		}
		
		// Though I guess it could do something
		// this function really doesn't make any sense
		public function prevMotion():Vector2D {
			return vectors[prevMotionIndex]
		}
	}	
}