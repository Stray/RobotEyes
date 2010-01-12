package com.newloop.roboteyes.drivers {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;

	public class DisplayObjectDriverListTest extends TestCase {
		private var instance:DisplayObjectDriverList;
		
		private var testObjectArray:Array;

		public function DisplayObjectDriverListTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			testObjectArray = [new Sprite(), new Sprite()];
			instance = new DisplayObjectDriverList(testObjectArray);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is DisplayObjectDriverList", instance is DisplayObjectDriverList);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
	}
}