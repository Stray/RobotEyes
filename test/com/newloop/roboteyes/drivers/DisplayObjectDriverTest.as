package com.newloop.roboteyes.drivers {

	import asunit.framework.TestCase;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class DisplayObjectDriverTest extends TestCase {
		private var instance:DisplayObjectDriver;
		
		private var testObject:DisplayObject;

		public function DisplayObjectDriverTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			testObject = new Sprite();
			instance = new DisplayObjectDriver(testObject);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is DisplayObjectDriver", instance is DisplayObjectDriver);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
	}
}