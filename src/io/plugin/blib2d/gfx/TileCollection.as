/**
 * Gary Paluk - http://www.plugin.io
 * Copyright (c) 2011-2012
 * 
 * Distributed under the MIT License.
 * http://opensource.org/licenses/mit-license.php
 */
package io.plugin.blib2d.gfx 
{
	import io.plugin.collections.ArrayList;
	
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class TileCollection extends ArrayList 
	{
		
		public function TileCollection( ) 
		{
			super();
			
			// TODO come back to this later, I want to flesh out the BlibAnimation class.
		}
		
		public function addTile( tile: Tile ): void
		{
			if ( !contains( tile ) )
			{
				add( tile );
			}
		}
		
		public function addTileset( tileset: TileSet ): void
		{
			for ( var i: int = 0; i < tileset.tilesTall; i++ )
			{
				for ( var j: int = 0; j < tileset.tilesWide; j++ )
				{
					addTile( new Tile( tileset, j, i ) );
				}
			}
		}
		
		public function addTileCollection( c: TileCollection ): void
		{
			addAll( c );
		}
		
	}

}