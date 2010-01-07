/* AS3
	Copyright 2010 Newloop.
*/
package com.newloop.roboteyes {
	
	import com.newloop.roboteyes.core.RobotEyesMaster;
	import com.newloop.roboteyes.drivers.DisplayObjectDriver;
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  07.01.2010
	 */
	
	public function inViewOf(viewClazz:Class):DisplayObjectDriver{
		return RobotEyesMaster.inViewOf(viewClazz);
	}
	  
	
}
