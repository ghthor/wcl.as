package qEngine.qMath {
	import flash.geom.Point;
	import qEngine.qRender.Canvas;
	import qEngine.qRender.I_Drawable;
	import qEngine.qMath.Offset;
	
	/**
	 * ...
	 * @author ...
	 */
	public class VectorObject implements I_Drawable {
		
		var origin:Point = new Point();
		var offsets:Array = new Array();
		
		public function VectorObject() {
			//origin = p_origin;
			//offsets = p_offsets;
			offsets.push(new Offset())
			offsets.pop()
		}
		
		public function setFromJSON(jsonOb:Object) {
			origin.x = jsonOb.Origin.X;
			origin.y = jsonOb.Origin.Y;
			
			// This needs to be Optimized, extremely wasteful atm
			offsets.slice();
			for (var i:int = 0; i < jsonOb.Offsets.length; i++) {
				offsets[i] = new Offset();
				offsets[i].setVector2D((jsonOb.Offsets[i].X as Number), (jsonOb.Offsets[i].Y as Number))
			}
		}
		
		/* INTERFACE qEngine.qRender.I_Drawable */
		
		public function drawToCanvas(canvas:Canvas):void{
			canvas.defaults();
			
			var nextX:Number = origin.x + offsets[0].x
			var nextY:Number = -origin.y + -(offsets[0].y)
			canvas.graphics.moveTo(nextX, nextY);
			
			for (var i:int = 1; i < offsets.length; i++) {
				nextX = origin.x + offsets[i].x
				nextY = -origin.y + -(offsets[i].y)
				canvas.graphics.lineTo(nextX, nextY);
			}
		}
		
	}
	
}