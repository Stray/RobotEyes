package com.newloop.roboteyes.core {

	import asunit.framework.TestCase;
	
	import robotEyesDemoApp;
	
	import com.newloop.roboteyesdemoapp.TestTextView;
	
	import flash.display.SimpleButton;
	
	import com.newloop.roboteyes.errors.RobotEyesError;
	                       
	public class RobotEyesTest extends TestCase {
		private var robotEyes:RobotEyes;

		public function RobotEyesTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			robotEyes = new RobotEyes(robotEyesDemoApp);
		}

		override protected function tearDown():void {
			super.tearDown();
			robotEyes = null;
		}

		public function testInstantiated():void {
			assertTrue("robotEyes is RobotEyes", robotEyes is RobotEyes);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		/*public function testChucksAnErrorWhenViewNotFound():void{
		    trace("testChucksAnErrorWhenViewNotFound");
			assertThrows(RobotEyesError, function():void{
				var viewDriver:DisplayObjectDriver = inViewOf(TestTextView).getA(SimpleButton);
			});
		} */
	}
}