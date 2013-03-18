blib2d-core-fp11
================

Blib2D core library
-------------------

Blib2D is an AS3 Bitmap blitting library. Blib2D contains structures for sprites, tiles, tilemaps etc. It is extremely efficient as only pointer references to sprites and tiles are moved around, rather than graphic resources. This makes Blib2D one of the fastest Bitmap blitting systems available for ActionScript.

Please Note, some widgets are available but are in development, however, our priorities are currently shifted to the GPU 3D engine Zest3D.

Example:

```actionscript
Display.initialize( stage );
addChild( Display.getInstance() );
	
var bitmap: Bitmap = new GRAPHIC();
var texture: Texture = new Texture( bitmap );
var tileSet: TileSet = new TileSet( texture, 128, 128 );

var tile: Tile = new Tile( tileSet );

tile.quickDraw( 50, 50 );
```
