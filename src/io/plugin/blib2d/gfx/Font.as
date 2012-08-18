/**
 * Gary Paluk - http://www.plugin.io
 * Copyright (c) 2011-2012
 * 
 * Distributed under the MIT License.
 * http://opensource.org/licenses/mit-license.php
 */
package io.plugin.blib2d.gfx 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.text.Font;
	import flash.text.FontStyle;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class Font extends Texture 
	{
		
		private var _textHeight: Number;
		private var _textWidths: Array;
		
		private var _tileSet: TileSet;
		private var _font: Font;
		
		public function Font( /*font: flash.text.BlibFont*/ ) 
		{
			//name = font.fontName;
			//var fontStyle: FontStyle = 
			//_font = font;
			
			//var lineSpace: Number = font.
			
			
			// TODO load the font to this bitmap and setup font metrics
			super( new Bitmap( new BitmapData( 500, 500, false, 0xFF0000 ) ) );
		}
		
		public function print( text: String, tint: Color, x: Number, y: Number,
							   alignment: int, width: Number, height: Number,
							   rotation: Number, scaleX: Number, scaleY: Number,
							   hotspot: Point ): void
		{
			//trace( "print called from font" );
			// TODO implement font print() method fully
		}
		
		public function get tileSet():BlibTileSet 
		{
			return _tileSet;
		}
		
		
		
	}

}