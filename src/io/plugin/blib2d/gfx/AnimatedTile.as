/**
 * Gary Paluk - http://www.plugin.io
 * Copyright (c) 2011-2012
 * 
 * Distributed under the MIT License.
 * http://opensource.org/licenses/mit-license.php
 */
package io.plugin.blib2d.gfx 
{
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class AnimatedTile extends Tile
	{
		
		private var _animation: Animation;
		private var _frameProgression: Number;
		private var _enabled: Boolean;
		
		public function AnimatedTile( animation: Animation ) 
		{
			super( animation.getTileAt( 0 ).tileSet );
			
			_animation = animation;
			_frameProgression = 0;
			_enabled = true;
		}
		
		override public function update():void 
		{
			
			if ( enabled )
			{
				var animSpeed: Number = _animation.speed;
				if ( animSpeed != 0 )
				{
					
					_frameProgression += ( animSpeed * ( getDeltaTime() * 0.001 ) );
					
					if ( animSpeed > 0 )
					{
						if ( _frameProgression >= _animation.frames.size() )
						{
							_frameProgression = 0;
						}
					}
					else
					{
						if ( _frameProgression < 0 )
						{
							_frameProgression = _animation.frames.size();
						}
					}
					super.update();
				}
			}
		}
		
		override public function get tileSet():TileSet 
		{
			return _animation.getTileAt( int( _frameProgression ) ).tileSet;
		}
		
		override public function set tileSet(value:TileSet):void 
		{
			super.tileSet = value;
		}
		
		
		private var _lastTime: int = getTimer();
		private function getDeltaTime(): int
		{
			var delta: int = getTimer() - _lastTime;
			_lastTime = getTimer();
			return delta;
		}
		
		public function get animation():Animation 
		{
			return _animation;
		}
		
		public function set Animation(value:Animation):void 
		{
			_animation = value;
		}
		
		override public function get tileX():int 
		{
			return _animation.getTileAt( _frameProgression ).tileX;
		}
		
		override public function set tileX(value:int):void 
		{
			_animation.getTileAt( _frameProgression ).tileX = value;
		}
		
		override public function get tileY():int 
		{
			return _animation.getTileAt( _frameProgression ).tileY;
		}
		
		override public function set tileY(value:int):void 
		{
			_animation.getTileAt( _frameProgression ).tileY = value;
		}
		
		public function get frameProgression():Number 
		{
			return _frameProgression;
		}
		
		public function set frameProgression(value:Number):void 
		{
			_frameProgression = value;
		}
		
		public function get enabled():Boolean 
		{
			return _enabled;
		}
		
		public function set enabled(value:Boolean):void 
		{
			_enabled = value;
		}
		
		
	}

}