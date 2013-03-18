blib2d-core-fp11
================

Blib2D core library
-------------------

Please Note, This library is was discontinued due to the advent of Stage3D. Blib2D will become part of the Zest3D framework.



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
