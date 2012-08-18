/**
 * Gary Paluk - http://www.plugin.io
 * Copyright (c) 2011-2012
 * 
 * Distributed under the MIT License.
 * http://opensource.org/licenses/mit-license.php
 */
package io.plugin.blib2d.gfx 
{
	import io.plugin.core.interfaces.IDisposable;
	
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class Tile 
	{
		
		private var _tileX: int;
		private var _tileY: int;
		private var _tileSet: TileSet;
		private var _mapCode: int;
		private var _bounds: int;
		
		//TODO interfaces and bounds
		public function Tile( tileset: TileSet = null, x: int = 0, y: int = 0 ) 
		{
			_tileX = x;
			_tileY = y;
			_tileSet = tileset;
			_bounds = TileBounds.NONE;
		}
		
		// TODO 
		public function draw( x: Number, y: Number, width: Number, height: Number, hotspotX: Number, hotspotY: Number,
							  rotation: Number, scaleX: Number, scaleY: Number, tint: uint ): void
		{
			if ( _tileSet == null )
			{
				return;
			}
			if ( tint <= 0 )
			{
				return;
			}
			
		}	
		
		public function get bounds():int 
		{
			return _bounds;
		}
		
		public function set bounds(value:int):void 
		{
			_bounds = value;
		}
		
		public function get leftBoundry(): Boolean
		{
			return ( ( bounds & TileBounds.LEFT ) == TileBounds.LEFT );
		}
		
		public function get bottomBoundry(): Boolean
		{
			return ( ( bounds & TileBounds.BOTTOM ) == TileBounds.BOTTOM );
		}
		
		public function get rightBoundry(): Boolean
		{
			return ( ( bounds & TileBounds.RIGHT ) == TileBounds.RIGHT );
		}
		
		public function get topBoundry(): Boolean
		{
			return ( ( bounds & TileBounds.TOP ) == TileBounds.TOP );
		}
		
		public function get tileX():int 
		{
			return _tileX;
		}
		
		public function set tileX(value:int):void 
		{
			_tileX = value;
		}
		
		public function get tileY():int 
		{
			return _tileY;
		}
		
		public function set tileY(value:int):void 
		{
			_tileY = value;
		}
		
		public function get tileSet():TileSet 
		{
			return _tileSet;
		}
		
		public function set tileSet(value:TileSet):void 
		{
			_tileSet = value;
		}
		
		public function get mapCode():int 
		{
			return _mapCode;
		}
		
		public function set mapCode(value:int):void 
		{
			_mapCode = value;
		}
		
		public function quickDraw( x: Number = 0, y: Number = 0 ): void
		{
			if ( _tileSet != null )
			{
				_tileSet.quickDraw( tileX, tileY, x, y );
			}
			
		}
		
		public function update(): void
		{
			// virtual method
		}
		
	}

}