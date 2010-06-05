package qEngine.qMath {
	import flash.geom.Point;
	import qEngine.qRender.Canvas;
	import qEngine.qRender.I_Drawable;
	import qEngine.qMath.Offset;
	
	/**
	 * ...
	 * @author ...
	 */
	public class VectorLine implements I_Drawable {
		
		var origin:Point = new Point();
		var offset:Vector2D = new Vector2D();
		
		public function VectorLine (p_origin:Point, p_offset:Vector2D) {
			origin = p_origin;
			offsets = p_offset;
		}
		
		public function setFromJSON(jsonOb:Object) {
			origin.x = jsonOb.Origin.X;
			origin.y = jsonOb.Origin.Y;
			offset.setVector2D(jsonOb.Offset.X, jsonOb.Offset.Y)
		}
		
		/* INTERFACE qEngine.qRender.I_Drawable */
		
		public function drawToCanvas(canvas:Canvas):void{
			canvas.defaults();
			canvas.graphics.moveTo(origin.x, -origin.y);
			var nextX:Number = origin.x;
			var nextY:Number = -origin.y;
			
			for (var i:int = 0; i < offsets.length; i++) {
				nextX = nextX + offsets[i].x;
				nextY = nextY + -(offsets[i].y);
				canvas.graphics.lineTo(nextX, nextY);
			}
		}
		
	}
	
}