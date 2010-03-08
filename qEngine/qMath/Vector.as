package qEngine.qMath
{
	import flash.geom.Point;
	
	public class Vector extends Point
	{
		// Constructor
		public function Vector(p_x:Number = 0, p_y:Number = 0):void
		{
			super(p_x, p_y);
			//x = p_x;
			//y = p_y;
		}
		
		// Sets "this"'s x and y properties
		public function setVector(p_x:Number, p_y:Number):void
		{
			x = p_x;
			y = p_y;
		}
		
		// Sets "this"'s x and y properties from a Vector
		public function setByVector(p_vect:Vector):void
		{
			x = p_vect.x;
			y = p_vect.y;
		}				
		
		// Adds a Vector to "this"
		public function addVector(i_vect:Vector):void
		{			
			x = x + i_vect.x;
			y = y + i_vect.y;
		}
		
		public function addLength(p_length:Number):void{
			var tempVect:Vector = toUnitVector();
			tempVect.scale(p_length);
			trace("adding " + tempVect + " -to " + this);
			this.addVector(tempVect);
		}
		
		// Subtracts a Vector from "this"
		public function subtractVector(p_vect:Vector):void
		{
			x = x - p_vect.x;
			y = y - p_vect.y;
		}
		
		public function rotateByDegree(p_degree:Number):void{
			var tempLength:Number = length;
			var tempRotation:Number = toDegrees() + p_degree;
			x = Math.cos(tempRotation * Math.PI/180);
			y = Math.sin(tempRotation * Math.PI/180);
			scale(tempLength);
		}
			
		// Scales the Vector by an Amount
		public function scale(i_val:Number):void
		{	
			x *= i_val;
			y *= i_val;
		}
		
		// Scales the Vector to length 1
		public function makeUnitVector():void
		{	
			scale(1/length);
		}
		
		// Returns a Vector that is the UnitVector of "this" vector
		public function toUnitVector():Vector
		{
			var r_vect:Vector = new Vector(x, y);
			r_vect.makeUnitVector();
			return r_vect;
		}
		
		// Returns the Radian Angle Value of this Vector
		public function toRadian():Number
		{
			//// Needs Optimization ////
			var t:Number = 0;
			var pi:Number = Math.PI;
			var i_vect:Vector = this.toUnitVector();
			if(i_vect.x >= 0 && i_vect.y >= 0)
			{	//1st Quad and 0/90/360
				t = Math.acos(i_vect.x);
			}
			
			else if(i_vect.x < 0 && i_vect.y > 0)
			{	//2nd Quad
				t = Math.acos(i_vect.x);
			}
			
			else if(i_vect.x < 0 && i_vect.y <= 0)
			{	//3rd Quad 180
				t = pi+(pi - Math.acos(i_vect.x));
			}
			
			else if(i_vect.x >= 0 && i_vect.y < 0)
			{	//4th Quad
				t = 2*pi - Math.acos(i_vect.x);
			}
			
			else
			{
				trace(i_vect + " ERROR!!");
			}
			
			return t;
		}
		
		// Returns the Radian Angle Value of this Vector
		public function toDegrees():Number
		{
			var t:Number = toRadian();
			return (t * 180/Math.PI);
		}
		public override function toString():String{
			var r_val:String =  " <" + x + ", " + y + "> " + "Mag: " + length;
			return r_val;
		}
	}
}