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
	public class TileBounds
	{
		
		public static const NONE: int = 0x00;
		public static const TOP: int = 0x01;
		public static const RIGHT: int = 0x02;
		public static const BOTTOM: int = 0x04;
		public static const LEFT: int = 0x08;
		public static const DIAGONAL_UP: int = 0x80;
		public static const DIAGONAL_DOWN: int = 0x80 | TOP;
		
	}

}