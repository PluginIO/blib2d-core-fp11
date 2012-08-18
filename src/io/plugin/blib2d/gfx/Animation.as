/**
 * Gary Paluk - http://www.plugin.io
 * Copyright (c) 2011-2012
 * 
 * Distributed under the MIT License.
 * http://opensource.org/licenses/mit-license.php
 */
package io.plugin.blib2d.gfx 
{
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class Animation 
	{
		
		private var _frames: TileCollection;
		private var _name: String;
		private var _animationSpeed: Number;
		
		public function Animation( tileCollection:TileCollection = null, animationSpeed: Number = 30 ) 
		{
			if ( tileCollection )
			{
				_frames = tileCollection;
			}
			else
			{
				_frames = new TileCollection();
			}
			
			_name = "";
			_animationSpeed = animationSpeed;
		}
		
		public function getTileAt( index: int ): BlibTile
		{
			return _frames.getAt( index ) as BlibTile;
		}
		
		public function setTileAt( index: int, tile: BlibTile ): void
		{
			_frames.setAt( index, tile );
		}
		
		public function get speed():Number 
		{
			return _animationSpeed;
		}
		
		public function set speed(value:Number):void 
		{
			_animationSpeed = value;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function get frames():BlibTileCollection 
		{
			return _frames;
		}
		
	}

}

import io.plugin.collections.ArrayList;
/**
 * ...
 * @author Gary Paluk - http://www.plugin.io
 */
internal class AnimationCollection extends ArrayList
{
	
	public function AnimationCollection() 
	{
		super();
	}
	
}