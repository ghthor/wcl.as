package qEngine.qMath {
	import flash.geom.Point;
	import qCode.qRender.Canvas;
	import qEngine.qRender.I_Drawable;
	
	/**
	 * ...
	 * @author ...
	 */
	public class VectorLine implements I_Drawable {
		
		var origin:Point;
		var offsets:Array;
		
		public function VectorLine(p_origin:Point = new Point(), p_offsets:Array = new Array()) {
			origin = p_origin;
			offsets = p_offsets;
		}
		
		public function setFromJSON(json:String) {
			
		}
		
		/* INTERFACE qEngine.qRender.I_Drawable */
		
		public function drawToCanvas(canvas:Canvas):void{
			canvas.defaults();
			canvas.graphics.moveTo(origin.x, -origin.y);
			var nextX:Number = origin.x;
			var nextY:Number = origin.y;
			
			for (var i:int = 0; i < offsets.length; i++) {
				nextX = nextX + offsets[i].x;
				nextY = nextY + offsets[i].y;
				canvas.graphics.lineTo(nextX, nextY);
			}
		}
		
	}
	
}