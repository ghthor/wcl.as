package qEngine.qMath {
	import flash.geom.Point;
	import qEngine.qRender.Canvas;
	import qEngine.qRender.I_Drawable;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Line implements I_Drawable {
		var origin:Point;
		var offset:Vector;
		
		public function Line(p_origin:Point, p_offset:Vector) {
			origin = p_origin;
			offset = p_offset;
		}
		
		/* INTERFACE qEngine.qRender.I_Drawable */
		
		public function drawToCanvas(canvas:Canvas):void{
			canvas.defaults();
			canvas.graphics.moveTo(origin.x, -origin.y);
			canvas.graphics.lineTo(origin.x + offset.x, -(origin.y + offset.y));
		}
	}
	
}