package qEngine.qRender {
	import qEngine.qRender.I_Drawable
	import qEngine.qMath.Rect
	/**
	 * ...
	 * @author ...
	 */
	public class OutlineRect extends qEngine.qMath.Rect implements I_Drawable {
		public var lineColor:uint
		
		public function Rect() {
		}
		
		public override function drawToCanvas(canvas:Canvas):void {
			canvas.graphics.lineStyle(1, lineColor)
			canvas.graphics.moveTo(topLeft.x, -topLeft.y)
			canvas.graphics.drawRect(topLeft.x, -topLeft.y, offset.x, offset.y)
		}
		
	}
	
}