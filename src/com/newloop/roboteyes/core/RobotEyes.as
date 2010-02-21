package com.newloop.roboteyes.core {
	
	import flash.display.DisplayObjectContainer;
	
	import flash.display.Sprite;
	
	import com.newloop.roboteyes.core.RobotEyesMaster;
	
	public class RobotEyes extends Sprite {
		
		private var _testApplication:DisplayObjectContainer;
		
		public function RobotEyes(applicationMainClazz:Class) {
			
			init(applicationMainClazz);
			
		}
		
		private function init(applicationMainClazz:Class):void{
			_testApplication = new applicationMainClazz() as DisplayObjectContainer;
			addChild(_testApplication);
			RobotEyesMaster.viewRoot = _testApplication;
		}
		
		public function get testApplication():*{
			return _testApplication;
		} 
	}
}