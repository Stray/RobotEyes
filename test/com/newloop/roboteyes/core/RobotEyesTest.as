package com.newloop.roboteyes.core {

	import asunit.framework.TestCase;
	
	import robotEyesDemoApp;
	import skins.roboteyesDemoAppSkin;
	
	import com.newloop.roboteyesdemoapp.TestTextView;
	import com.newloop.roboteyesdemoapp.RotatingShapesView;
	import com.newloop.roboteyesdemoapp.RotatingSquareView;
	
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	import com.newloop.roboteyes.errors.RobotEyesError;
	import com.newloop.roboteyes.inViewOf;
	import com.newloop.roboteyes.drivers.DisplayObjectDriver; 
	import com.newloop.roboteyes.drivers.TextFieldDriver; 
	import com.newloop.roboteyes.drivers.InteractiveObjectDriver; 
	
	
	                       
	public class RobotEyesTest extends TestCase {
		private var robotEyes:RobotEyes;

		public function RobotEyesTest(methodName:String=null) {
			super(methodName)
		}
        
		override public function run():void{
			trace("RobotEyesTest: run");
			
			if(robotEyes==null){
				robotEyes = new RobotEyes(robotEyesDemoApp);
				addChild(robotEyes);
				robotEyes.visible = false;
			}
			// need to wait a while
			var timer:Timer = new Timer(1000,1);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			timer.start();
		}
		
		private function timerHandler(e:TimerEvent):void{
			trace("RobotEyesTest timerHandler");
			robotEyes.visible = true;
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			
		}   
		
		override protected function tearDown():void {
			super.tearDown();
		}
		
		override protected function cleanUp():void{
			removeChild(robotEyes);
			robotEyes = null;
		}

		public function testInstantiated():void {
			assertTrue("robotEyes is RobotEyes", robotEyes is RobotEyes);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function testChucksAnErrorWhenViewNotFound():void{
			assertThrows(RobotEyesError, function():void{
				var viewDriver:DisplayObjectDriver = inViewOf(TestTextView).getA(SimpleButton);
			});
		}
		
		public function testCanFindCorrectTopLevelView():void{
			var viewDriver:DisplayObjectDriver = inViewOf(TestTextView);
			assertTrue("View driver is not null", (viewDriver!=null));
			var view:DisplayObject = viewDriver.view;
			assertTrue("View is not null", (view!=null));
			assertTrue("View is of correct type", (view is TestTextView));
		}
		
		public function testCanFindAnyNestedViewUsingGetA():void{
			var viewDriver:DisplayObjectDriver = inViewOf(TestTextView).getA(Sprite);
			assertTrue("View driver is not null", (viewDriver!=null));
			var view:DisplayObject = viewDriver.view;
			assertTrue("View is not null", (view!=null));
			assertTrue("View is of correct type", (view is Sprite));
		}
		
		public function testCanFindNestedViewUsingGetANamed():void{
			var viewDriver:DisplayObjectDriver = inViewOf(TestTextView).inViewOf(roboteyesDemoAppSkin.TextTestViewSkin).getA(Sprite).named("background_mc");
			assertTrue("View driver is not null", (viewDriver!=null));
			var view:DisplayObject = viewDriver.view;
			assertTrue("View is not null", (view!=null));
			assertTrue("View is of correct type", (view is Sprite));
		}
		
		public function testCanFindCorrectNestedViewUsingInViewOf():void{
			var viewDriver:DisplayObjectDriver = inViewOf(RotatingShapesView).inViewOf(RotatingSquareView);
			assertTrue("View driver is not null", (viewDriver!=null));
			var view:DisplayObject = viewDriver.view;
			assertTrue("View is not null", (view!=null));
			assertTrue("View is of correct type", (view is RotatingSquareView));
		}
		
		public function testCanFindCorrectDoubleNestedViewUsingGetAWithProperty():void{
			var viewDriver:DisplayObjectDriver = inViewOf(RotatingShapesView).inViewOf(RotatingSquareView).getA(Sprite).withProperty('alpha', 1);
			assertTrue("View driver is not null", (viewDriver!=null));
			var view:DisplayObject = viewDriver.view;
			assertTrue("View is not null", (view!=null));
			assertTrue("View is of correct type", (view is Sprite));
		}
		
		public function testCanFindCorrectViewUsingInViewOfWithoutNesting():void{
			var viewDriver:DisplayObjectDriver = inViewOf(RotatingSquareView);
			assertTrue("View driver is not null", (viewDriver!=null));
			var view:DisplayObject = viewDriver.view;
			assertTrue("View is not null", (view!=null));
			assertTrue("View is of correct type", (view is RotatingSquareView));
		}
		
		public function testCanFindCorrectTextFieldDriver():void{
			var textFieldDriver:TextFieldDriver = inViewOf(TestTextView).inViewOf(roboteyesDemoAppSkin.TextTestViewSkin).getA(TextField).named("field1_txt") as TextFieldDriver;
			var textField:TextField = textFieldDriver.textField;
			assertTrue("TextFieldDriver doesn't think textfield contains 'blah'", (textFieldDriver.checkText('blah')==false));
			textFieldDriver.enterText("Hello world");
			assertTrue("TextField contains Hello world", (textField.text == "Hello world"));
			assertTrue("TextFieldDriver verifies text contains 'Hello world'", (textFieldDriver.checkText('Hello world')));
		}
		
		public function testCanFindCorrectInteractiveObjectDriver():void{
			var buttonDriver:InteractiveObjectDriver = inViewOf(TestTextView).inViewOf(roboteyesDemoAppSkin.TextTestViewSkin).getA(Sprite).withProperty("name", "copy_btn") as InteractiveObjectDriver;
            
			assertTrue("button driver is not null", (buttonDriver!=null));
			var button:InteractiveObject = buttonDriver.item;
			assertTrue("Button is not null", (button!=null));

		}
		
		public function testCanUseInteractiveObjectDriverToClick():void{
			var textFieldDriver:TextFieldDriver = inViewOf(TestTextView).inViewOf(roboteyesDemoAppSkin.TextTestViewSkin).getA(TextField).named("field1_txt") as TextFieldDriver;
			textFieldDriver.enterText("Copy test");
			var buttonDriver:InteractiveObjectDriver = inViewOf(TestTextView).inViewOf(roboteyesDemoAppSkin.TextTestViewSkin).getA(Sprite).withProperty("name", "copy_btn") as InteractiveObjectDriver;
			var asyncTest:Function = addAsync(null, 2000,textShouldBeCopied);
		    buttonDriver.click();
		}

	    public function textShouldBeCopied(e:Event):void{
			var textFieldDriver:TextFieldDriver = inViewOf(TestTextView).inViewOf(roboteyesDemoAppSkin.TextTestViewSkin).getA(TextField).named("field2_txt") as TextFieldDriver;
            assertTrue('Text has been copied', textFieldDriver.contains("Copy test"));
		}
			
	}
}