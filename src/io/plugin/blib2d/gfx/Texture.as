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
	import flash.geom.Rectangle;
	import io.plugin.core.interfaces.IDisposable;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class Texture extends Bitmap implements IDisposable
	{
		
		public function Texture( bitmap: Bitmap ) 
		{
			bitmapData = bitmap.bitmapData;
		}
		
		public function dispose(): void
		{
			bitmapData.dispose();
			//TODO remove from bound textures
		}
		
	}
	
}


/*
import io.plugin.collections.ArrayList;
internal class TextureCollection extends ArrayList
{
	
	import io.plugin.blib.gfx.Texture;

	public function TextureCollection()
	{
		super();
	}
	
	public function addTexture( texture: Texture ): int
	{
		if ( add( texture ) )
		{
			return indexOf( texture );
		}
		throw new Error( "The texture could not be added to the TextureCollection" );
	}
	
	
	//public function addTextureCollection( textures: TextureCollection ): int
	//{
	//	
	//}
	
}
*/