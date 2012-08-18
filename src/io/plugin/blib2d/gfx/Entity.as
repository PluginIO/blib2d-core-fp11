/**
 * Gary Paluk - http://www.plugin.io
 * Copyright (c) 2011-2012
 * 
 * Distributed under the MIT License.
 * http://opensource.org/licenses/mit-license.php
 */
package io.plugin.blib2d.gfx 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	//import io.plugin.utils.IntLib;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class Entity 
	{
		
		private var _name: String = "Unknown";
		private var _x: Number = 0;
		private var _y: Number = 0;
		private var _rotation: Number = 0;
		//private var _width: Number;
		//private var _height: Number;
		private var _scaleX: Number = 1;
		private var _scaleY: Number = 1;
		private var _alpha: Number = 1;
		private var _tint: BlibColor = Color.WHITE;
		private var _hotspot: Point = new Point( 0, 0 );
		private var _isWorldObject: Boolean = true;
		private var _visible: Boolean = true;
		private var _enabled: Boolean = true;
		private var _velocity: Point = new Point( 0, 0 );
		private var _rotationSpeed: Number = 0;
		private var _zOrder: int = 0;
		
		// abstract class 
		// TODO enforce abstraction
		public function BlibEntity() 
		{
			_name = "Unknown";
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function get x():Number 
		{
			return _x;
		}
		
		public function set x(value:Number):void 
		{
			_x = value;
		}
		
		public function get y():Number 
		{
			return _y;
		}
		
		public function set y(value:Number):void 
		{
			_y = value;
		}
		
		public function get rotation():Number 
		{
			return _rotation;
		}
		
		public function set rotation(value:Number):void 
		{
			_rotation = value;
		}
		
		public function get width(): Number
		{
			return _scaleX;
		}
		
		public function set width( value: Number ): void
		{
			_scaleX = value;
		}
		
		public function get height(): Number
		{
			return _scaleY;
		}
		
		public function set height( value: Number ): void
		{
			_scaleY = value;
		}
		
		public function get scale(): Number
		{
			return (_scaleX + _scaleY ) / 2;
		}
		
		public function set scale( value: Number ): void
		{
			_scaleX = value;
			_scaleY = value;
		}
		
		public function get scaleX():Number 
		{
			return _scaleX;
		}
		
		public function set scaleX(value:Number):void 
		{
			_scaleX = value;
		}
		
		public function get scaleY():Number 
		{
			return _scaleY;
		}
		
		public function set scaleY(value:Number):void 
		{
			_scaleY = value;
		}
		
		public function get alpha():Number 
		{
			return _alpha;
		}
		
		public function set alpha(value:Number):void 
		{
			if ( value < 0 )
			{
				_alpha = 0;
			}
			else if ( value > 1 )
			{
				_alpha = 1;
			}
			else
			{
				_alpha = value;
			}
		}
		
		public function get tint():Color 
		{
			return _tint;
		}
		
		public function set tint(value:Color):void 
		{
			_tint = value;
		}
		
		public function draw(): void
		{
			//TODO event handling
		}
		
		//TODO refactor to pass usual data required for physics etc
		private var _lastTime: int = getTimer();
		public function update(): void
		{
			if ( _enabled )
			{
				var delta: int = getTimer() - _lastTime;
				x += _velocity.x * delta * 0.01;
				y += _velocity.y * delta * 0.01;
				_lastTime = getTimer();
			}
			_rotation += _rotationSpeed * ( delta * 0.01 );
			
			//TODO event handling
		}
		
		
		
		//TODO get size
		//public function get 
		
		public function get location(): Point
		{
			return new Point( _x, _y );
		}
		
		public function set location( value: Point ): void
		{
			_x = value.x;
			_y = value.y;
		}
		
		public function get left(): Number
		{
			return x - _hotspot.x * Math.abs( _scaleX );
		}
		
		public function set left( value: Number ): void
		{
			this.x = value + _hotspot.x * Math.abs( _scaleX );
		}
		
		public function get right(): Number
		{
			return left + width;
		}
		
		public function set right( value: Number ): void
		{
			left = value - width;
		}
		
		public function get top(): Number
		{
			return y = _hotspot.y * Math.abs( _scaleY );
		}
		
		public function set top( value: Number ): void
		{
			y = value + _hotspot.y * Math.abs( _scaleY );
		}
		
		public function get bottom(): Number
		{
			return top + height;
		}
		
		public function set bottom( value: Number ): void
		{
			top = value - height;
		}
		
		public function get rectangle(): Rectangle
		{
			return new Rectangle( left, top, width, height );
		}
		
		public function set rectangle( rect: Rectangle ): void
		{
			left = rect.x;
			top = rect.y;
			width = rect.width;
			height = rect.height;
		}
		
		public function get hotspot():Point 
		{
			return _hotspot;
		}
		
		public function set hotspot(value:Point):void 
		{
			_hotspot = value;
		}
		
		public function get isWorldObject():Boolean 
		{
			return _isWorldObject;
		}
		
		public function set isWorldObject(value:Boolean):void 
		{
			_isWorldObject = value;
		}
		
		public function get visible():Boolean 
		{
			return _visible;
		}
		
		public function set visible(value:Boolean):void 
		{
			_visible = value;
		}
		
		public function get enabled():Boolean 
		{
			return _enabled;
		}
		
		public function set enabled(value:Boolean):void 
		{
			_enabled = value;
		}
		
		public function get velocity():Point 
		{
			return _velocity;
		}
		
		public function set velocity(value:Point):void 
		{
			_velocity = value;
		}
		
		public function get rotationSpeed():Number 
		{
			return _rotationSpeed;
		}
		
		public function set rotationSpeed(value:Number):void 
		{
			_rotationSpeed = value;
		}
		
		public function toString(): String
		{
			return "[object Entity] Name: " + name;
		}
		
		public function intersectsWithEntity( entity: BlibEntity ): Boolean
		{
			if ( bottom < entity.top ) return false;
			if ( top > entity.bottom ) return false;
			if ( right < entity.left ) return false;
			if ( left > entity.right ) return false;
			return true;
		}
		
		public function intersectsWithPoint( point: Point ): Boolean
		{
			if ( bottom < point.y ) return false;
			if ( top > point.y ) return false;
			if ( right < point.x ) return false;
			if ( left > point.x ) return false;
			return true;
		}
		
		public function intersectsWithPosition( x: Number, y: Number ): Boolean
		{
			if ( bottom < y ) return false;
			if ( top > y ) return false;
			if ( right < x ) return false;
			if ( left > x ) return false;
			return true;
		}
		
		public function get center(): Point
		{
			return new Point( left + width / 2, top + height / 2 );
		}
		
		public function set center( value: Point ): void
		{
			left = value.x - width / 2;
			top = value.y - height / 2;
		}
		
		public function get zOrder():int 
		{
			return _zOrder;
		}
		
		public function set zOrder(value:int):void 
		{
			_zOrder = value;
		}
		
		// TODO implement
		/*
		public function compareTo( entity: BlibEntity ): int
		{
			return IntLib.compare( zOrder, entity.zOrder );
		}
		*/
		
		public function intersectsWithRect( rect: Rectangle ): Boolean
		{
			if ( bottom < rect.top ) return false;
			if ( top > rect.bottom ) return false;
			if ( right < rect.left ) return false;
			if ( left > rect.right ) return false;
			return true;
		}
		
		public function intersectsWithRadius( entity: BlibEntity, radius: Number, radiusOther: Number, tolerance: Number = 0 ): Boolean
		{
			var center1: Point = center;
			var center2: Point = entity.center;
			var xdiff: Number = center2.x - center1.x;
			var ydiff: Number = center2.y = center1.y;
			var dcenter_sq: Number = (ydiff * ydiff ) + ( xdiff * xdiff );
			var r_sum_sq: Number = radius + radiusOther;
			r_sum_sq *= r_sum_sq;
			return dcenter_sq - r_sum_sq <= ( tolerance * tolerance );
		}
		
	}

}