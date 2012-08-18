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
	public class BlibSprite extends Entity 
	{
		
		private var _currentAnimation: int;
		private var _frameProgression: Number;
		private var _animations: AnimationCollection;
		
		public function BlibSprite()
		{
			_currentAnimation = 0;
			_frameProgression = 0;
			_animations = new AnimationCollection();
		}
		
		public function get currentAnimation():int 
		{
			return _currentAnimation;
		}
		
		public function set currentAnimation(value:int):void 
		{
			_currentAnimation = value;
			_frameProgression = 0;
		}
		
		public function get frameProgression():int 
		{
			return _frameProgression;
		}
		
		public function set frameProgression(value:int):void 
		{
			_frameProgression = value;
		}
		
		public function get animation(): Animation
		{
			return _animations.getAt( _currentAnimation );
		}
		
		public function set animation( value: Animation ): void
		{
			if ( !_animations.contains( value ) )
			{
				_animations.add( value );
			}
			currentAnimation = _animations.indexOf( value );
		}
		
		public function get animations():AnimationCollection 
		{
			return _animations;
		}
		
		override public function get width():Number 
		{
			return BlibAnimation( _animations.getAt( _currentAnimation ) ).getTileAt( 0 ).tileSet.tileWidth * Math.abs( scaleX );
		}
		
		override public function set width(value:Number):void 
		{
			scaleX = value / BlibAnimation( _animations.getAt( _currentAnimation ) ).getTileAt( 0 ).tileSet.tileWidth;
		}
		
		override public function get height():Number 
		{
			return BlibAnimation( _animations.getAt( _currentAnimation ) ).getTileAt( 0 ).tileSet.tileHeight * Math.abs( scaleY );
		}
		
		override public function set height(value:Number):void 
		{
			scaleY = value / BlibAnimation( _animations.getAt( _currentAnimation ) ).getTileAt( 0 ).tileSet.tileHeight;
		}
		
		override public function draw():void 
		{
			//TODO must apply world matrix transformation
			
			if ( visible )
			{
				if ( alpha <= 0 )
				{
					return;
				}
				
				// drawing sprite
				Animation( _animations.getAt( _currentAnimation ) ).getTileAt( _frameProgression ).quickDraw( x, y )
			}
		}
		
		private var _lastTime: int = getTimer();
		
		override public function update():void 
		{
			if ( enabled )
			{
				var animSpeed: Number = Animation( _animations.getAt( _currentAnimation ) ).speed;
				if ( animSpeed != 0 )
				{
					_frameProgression += animSpeed * ( ( getTimer() - _lastTime ) * 0.001 );
					if ( animSpeed > 0 )
					{
						if ( _frameProgression >= Animation( _animations.getAt( _currentAnimation ) ).frames.size() )
						{
							_frameProgression = 0;
						}
						else if ( _frameProgression < 0 )
						{
							_frameProgression = Animation( _animations.getAt( _currentAnimation ) ).frames.size();
						}
					}
				}
				_lastTime = getTimer();
				super.update();
			}
		}
	}

}