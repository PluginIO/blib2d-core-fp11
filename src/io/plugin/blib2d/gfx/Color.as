/**
 * Gary Paluk - http://www.plugin.io
 * Copyright (c) 2011-2012
 * 
 * Distributed under the MIT License.
 * http://opensource.org/licenses/mit-license.php
 */
package io.plugin.blib2d.gfx 
{
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class Color 
	{
		
		private var _r: Number;
		private var _g: Number;
		private var _b: Number;
		private var _a: Number;
		
		public static function get WHITE(): BlibColor
		{
			return new Color( 1, 1, 1 );
		}
		
		public static function get BLACK(): BlibColor
		{
			return new Color( 0, 0, 0 );
		}
		
		public function get r():Number 
		{
			return _r;
		}
		
		public function set r(value:Number):void 
		{
			_r = value;
		}
		
		public function get g():Number 
		{
			return _g;
		}
		
		public function set g(value:Number):void 
		{
			_g = value;
		}
		
		public function get b():Number 
		{
			return _b;
		}
		
		public function set b(value:Number):void 
		{
			_b = value;
		}
		
		public function get a():Number 
		{
			return _a;
		}
		
		public function set a(value:Number):void 
		{
			_a = value;
		}
		
		public function Color( r: Number = 0, g: Number = 0, b: Number = 0, a: Number = 1 ) 
		{
			_r = r;
			_g = g;
			_b = b;
			_a = a;
		}
		
		public function toUint(): uint
		{
			
			var red: uint = uint( r * 255 ) << 24;
			var gree: uint = uint( g * 255 ) << 16;
			var blue: uint = uint( b * 255 ) << 8;
			var alpha: uint = uint( a * 255 );
			
			return ( red | green | blue | alpha );
		}
		
		public function toString(): String
		{
			return "[object Color] (r: " + r + ", g: " + g + ", b: " + b + ", a: " + a + ")";
		}
		
	}

}