blib2d-core-fp11
================

Blib2D core library

Please Note, This library is currently under development.



Example:

Display.initialize( stage );
addChild( Display.getInstance() );
	
var bitmap: Bitmap = new GRAPHIC();
var texture: Texture = new Texture( bitmap );
var tileSet: TileSet = new TileSet( texture, 128, 128 );

var tile: Tile = new Tile( tileSet );

tile.quickDraw( 50, 50 );