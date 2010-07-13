﻿package qEngine.qMath {
	import flash.geom.Point;
	import qEngine.qRender.Canvas;
	import qEngine.qRender.I_Drawable;
	import qEngine.qMath.Offset;
	
	/**
	 * ...
	 * @author ...
	 */
	public class VectorLine implements I_Drawable {
		
		var origin:Point = new Point()
		var offset:Vector2D = new Vector2D()
		
		public function VectorLine (p_origin:Point, p_offset:Vector2D) {
			origin = p_origin
			offsets = p_offset
		}
		
		public function get length():Number {
			return offset.length
		}
		
		public function setFromJSON(jsonOb:Object) {
			origin.x = jsonOb.O.X
			origin.y = jsonOb.O.Y
			offset.setVector2D(jsonOb.V.X, jsonOb.V.Y)
		}
		
		/* INTERFACE qEngine.qRender.I_Drawable */
		
		public function drawToCanvas(canvas:Canvas):void{
			canvas.defaults()
			canvas.graphics.moveTo(origin.x, -origin.y)
			canvas.graphics.lineTo(origin.x + offset.x, -(origin.y + offset.y))			
		}
		
	}
	
}