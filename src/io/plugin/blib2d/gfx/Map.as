/**
 * Gary Paluk - http://www.plugin.io
 * Copyright (c) 2011-2012
 * 
 * Distributed under the MIT License.
 * http://opensource.org/licenses/mit-license.php
 */
package io.plugin.blib2d.gfx 
{
	import flash.geom.Rectangle;
	//import io.plugin.utils.IntLib;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class Map extends Entity 
	{
		
		private var _animations: AnimationCollection;
		private var _tiles: Array;
		private var _tileWidth: int;
		private var _tileHeight: int;
		private var _tileOverlap: int;
		
		public function BlibMap( width: uint, height: uint ) 
		{
			_animations = new AnimationCollection();
			
			_tileWidth = 0;
			_tileHeight = 0;
			_tileOverlap = 0;
			
			initTileArray( width, height );
		}
		
		private function initTileArray( width: uint, height: uint ): void
		{
			_tiles = new Array();
			for ( var i: int = 0; i < height; i++ )
			{
				_tiles[ i ] = new Array();
				for ( var j: int = 0; j < width; j++ )
				{
					_tiles[ i ][ j ] = null;
				}
			}
		}
		
		public function get animations():AnimationCollection 
		{
			return _animations;
		}
		
		override public function get width():Number 
		{
			return _tileWidth * mapWidth * scaleX;
		}
		
		override public function set width(value:Number):void 
		{
			scaleX = value / ( _tileWidth * mapWidth );
		}
		
		override public function get height():Number 
		{
			return tileOverlap * mapHeight * scaleY;
		}
		
		override public function set height(value:Number):void 
		{
			scaleY = value / ( tileOverlap * mapHeight );
		}
		
		public function get tileWidth():int 
		{
			return _tileWidth;
		}
		
		public function get tileHeight():int 
		{
			return _tileHeight;
		}
		
		public function get mapWidth(): Number
		{
			return _tiles[0].length;
		}
		
		public function get mapHeight(): Number
		{
			return _tiles.length;
		}
		
		public function getTileAt( x: int, y: int ): Tile
		{
			return _tiles[ y ][ x ];
		}
		
		public function setTileAt( value: Tile, x: int, y: int ): void
		{
			_tiles[ y ][ x ] = value;
		}
		
		public function fill( tile: Tile ): void
		{
			var mapWidth: int = _tiles[ 0 ].length;
			var mapHeight: int = _tiles.length;
			
			for ( var i: int = 0; i < mapWidth; i++ )
			{
				for ( var j: int = 0; j < mapHeight; y++ )
				{
					_tiles[ i ][ j ] = new Tile( tile.tileSet );
				}
			}
		}
		
		public function get tiles(): Array
		{
			return _tiles;
		}
		
		public function get tileOverlap():int 
		{
			if ( _tileOverlap == 0 )
			{
				return _tileHeight;
			}
			return _tileOverlap;
		}
		
		public function set tileOverlap(value:int):void 
		{
			_tileOverlap = value;
		}
		
		override public function draw():void 
		{
			
			if ( !visible )
			{
				return;
			}
			
			if ( isWorldObject )
			{
				//TODO get camera and translate etc
			}
			
			var layerWidth: int = mapWidth;
			var layerHeight: int = mapHeight;
			
			for ( var y: int = 0; y < layerHeight; y++ )
			{
				for ( var x: int = 0; x < layerWidth; x++ )
				{
					var tile: Tile = _tiles[ y ][ x ];
					if ( tile != null )
					{
						var tileset: TileSet = tile.tileSet;
						if ( tileset != null )
						{
							tileset.quickDraw( tile.tileX, tile.tileY, tileset.tileWidth * x, tileOverlap * y );
						}
					}
				}
			}
			
		}
		
		override public function update():void 
		{
			if ( enabled )
			{
				
				for ( var x: int = 0; x < mapWidth; x++ )
				{
					for ( var y: int = 0; y < mapHeight; y++ )
					{
						if ( _tiles[ y ][ x ] != null )
						{
							_tiles[ y ][ x ].update();
						}
					}
				}
				
				super.update();
			}
		}
		
		public function getTile( x: Number, y: Number, byLocation: Boolean ): Tile
		{
			if ( byLocation )
			{
				x = ( x - this.x - this.hotspot.x ) / this.tileWidth * this.scaleX;
				y = ( y - this.y - this.hotspot.y ) / this.tileHeight * this.scaleY;
			}
			if ( ( x < 0 ) || (y < 0) || ( x >= mapWidth ) || ( y >= mapHeight ) )
			{
				return null;
			}
			return _tiles[ y ][ x ];
		}
		
		public function getTileLocation( x: Number, y: Number, byLocation: Boolean ): Rectangle
		{
			if ( byLocation )
			{
				x = ( x - this.x - this.hotspot.x ) / this.tileWidth * this.scaleX;
				y = ( y - this.y - this.hotspot.y ) / this.tileHeight * this.scaleY;
			}
			if ( ( x < 0 ) || ( y < 0 ) || ( x >= mapWidth ) || ( y >= mapHeight ) )
			{
				return null;
			}
			return new Rectangle(
				this.tileWidth * x * this.scaleX + this.x - this.hotspot.x,
				this.tileHeight * x * this.scaleY + this.y - this.hotspot.y,
				this.tileWidth * this.scaleX,
				this.tileHeight * this.scaleY );
		}
		
		
		public function setData( tileset: TileSet, data: Array, mapCodes: Array = null, bounds: Array = null ): void
		{
			var mapWidth: int = _tiles[ 0 ].length;
			var mapHeight: int = _tiles.length;
			
			_tileWidth = tileset.tileWidth;
			_tileHeight = tileset.tileHeight;
			
			var tiles: TileCollection = new TileCollection();
			tiles.addTileset( tileset );
			
			var index: int = 0;
			var y: int = 0;
			var x: int = 0;
			
			for ( y = 0; y < mapHeight; y++ )
			{
				for ( x = 0; x < mapWidth; x++ )
				{	
					switch( IntLib.compare( data[ index ], 0 ) )
					{
						case -1:
							var animationIndex: int = Math.abs( data[ index ] ) - 1;
							
							if ( this.animations.size() > animationIndex )
							{
								_tiles[ y ][ x ] = new AnimatedTile( animations.getAt( animationIndex ) );
							}
							else
							{
								_tiles[ y ][ x ] = new Tile();
							}
						break;
						case 0:
							_tiles[ y ][ x ] = new Tile();
						break;
						case 1:
							_tiles[ y ][ x ] = tiles.getAt( data[ index ] - 1 );
						break;
					}
					index++;
				}
			}
			
			if ( mapCodes != null )
			{
				index = 0;
				
				for ( y = 0; y < mapHeight; y++ )
				{
					for ( x = 0; x < mapWidth; x++ )
					{
						BlibTile( _tiles[ y ][ x ] ).mapCode = mapCodes[ index ];
						index++;
					}
				}
			}
			
			if ( bounds != null )
			{
				index = 0;
				
				for ( y = 0; y < mapHeight; y++ )
				{
					for ( x = 0; x < mapWidth; x++ )
					{
						Tile( _tiles[ y ][ x ] ).bounds = bounds[ index ];
						index++;
					}
				}
			}
			
		}
		
		
		
		//TODO loading data from XML and/or other file format
		public static function fromXML( xml: XML ): Map
		{
			
			return new BlibMap( 0, 0 );
		}
		
	}

}