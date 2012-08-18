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
	import flash.display.IBitmapDrawable;
	import flash.display.PixelSnapping;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	import io.plugin.core.interfaces.IDisposable;
	
	/**
	 * A test class for drawing something to the screen, context will berefactored to put 
	 * context behind an IContext interface which will be part of the plugin core
	 * 
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class Display extends Bitmap implements IDisposable
	{
		
		private static var _instance: Display;
		
		private var _textures: Dictionary;
		private var _context: Stage;
		
		public function Display( context: Stage ) 
		{
			_textures = new Dictionary();
			_context = context;
			
			bitmapData = new BitmapData( context.stageWidth, context.stageHeight, false, 0x000000 );
			super( bitmapData, PixelSnapping.NEVER, false );
			
			_context.addChild( this );
		}
		
		public function dispose(): void
		{
			_textures = null;
		}
		
		public function clear( clearColor: uint = 0x000000 ): void
		{
			bitmapData.lock();
			bitmapData.fillRect( new Rectangle( 0, 0, width, height ), clearColor );
			bitmapData.unlock();
		}
		
		public static function initialize( context: Stage ): Display
		{
			if ( !_instance )
			{
				_instance = new Display( context );
			}
			return _instance;
		}
		
		public static function getInstance(): Display
		{
			return _instance;
		}
		
	}

}