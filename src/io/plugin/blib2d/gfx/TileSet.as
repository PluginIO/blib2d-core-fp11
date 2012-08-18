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
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class TileSet
	{
		
		private var _texture: Texture;
		private var _tileWidth: int = -1;
		private var _tileHeight: int = -1;
		
		private var GFX: Display;
		
		public function TileSet( texture: Texture, tileWidth: uint = 0, tileHeight: uint = 0 ) 
		{
			GFX = Display.getInstance();
			
			_texture = texture;
			tileWidth == 0 ? _tileWidth = texture.width : _tileWidth = tileWidth;
			tileHeight == 0 ? _tileHeight = texture.height : _tileHeight = tileHeight;
		}
		
		public function quickDraw( tileX: int, tileY: int, x: Number, y: Number ): void
		{
			
			// TODO swap memory using Alchemy and use quads and texture references sent by pointer
			var tx: Number = tileX * _tileWidth;
			var ty: Number = tileY * _tileHeight;
			
			GFX.bitmapData.lock();
			GFX.bitmapData.copyPixels( _texture.bitmapData, new Rectangle( tx, ty, _tileWidth, _tileHeight ), new Point( x, y ) );
			GFX.bitmapData.unlock();
			
		}
		
		public function get numTiles(): int
		{
			return tilesWide * tilesTall;
		}
		
		public function getTile( x: int, y: int ): Tile
		{
			return new Tile( this, x, y );
		}
		
		public function getTileAt( index: int ): Tile
		{
			var wide: int = tilesWide;
			var x: int = index % wide;
			return new Tile( this, x, ( index - x ) / wide );
		}
		
		public function get tilesWide(): int
		{
			return _texture.width / _tileWidth;
		}
		
		public function set tilesWide( value: int ): void
		{
			_tileWidth = _texture.width / value;
		}
		
		public function get tilesTall(): int
		{
			return _texture.height / _tileHeight;
		}
		
		public function set tilesTall( value: int ): void
		{
			_tileHeight = _texture.height / value;
		}
		
		public function get tileWidth():int 
		{
			return _tileWidth;
		}
		
		public function set tileWidth(value:int):void 
		{
			_tileWidth = value;
		}
		
		public function get tileHeight():int 
		{
			return _tileHeight;
		}
		
		public function set tileHeight(value:int):void 
		{
			_tileHeight = value;
		}
		
		public function get texture():Texture 
		{
			return _texture;
		}
		
		public function set texture(value:Texture):void 
		{
			_texture = value;
		}
		
	}

}