## RobotEyes can help you end-to-end test your AS3 app

Inspired by a hybrid of WindowLicker (for Java) and Drew Bourne's Mockolate (for AS3).

RobotEyes should really be called RobotEyes and RobotFingers. It's called RobotEyes because it was developed for RobotLegs... but then I removed all the RobotLegs dependencies. Ho hum.

The aim is to deliver end-to-end testing to AS3 applications.

Currently I'm only adding functionality as I actually need to make use of it, so feel free to fork and expand.

Functionality included in this version has been tested by incorporation in an end-to-end test of an application. It may well do unexpected things.

## What's an end-to-end test?

In TDD speak (Test Driven Development), an end-to-end test is one that proves that your application carries out one of your user stories successfully.

A good example would be that, given a certain viable user/password combination, when the login button is clicked the login procedure completes and whatever application state change is required occurs. Or - that given a blank username, clicking doesn't submit the details to the login service. Or - that given a crappy user/password combination, the login fails and the application handles this gracefully, with user feedback... you get the idea.

End-to-end testing is different from Unit Testing and is additional to it - not a replacement for it. It aims to provide certainty that your actual application works, not just your individual classes, and, in doing so, it'll usually include coverage of any backend services as well.

## How do I use RobotEyes?

RobotEyes is designed to integrate with your Unit Testing framework - it was developed for ASUnit 3 but doesn't have any dependencies.

The idea is that you set your tests up to use RobotEyes as the user: both to visually verify that certain things appear how they should, and to enter text, press buttons, operate scrollers and so on. RobotEyes provides for this by supplying you with a driver wrapping your UIElements / Views.

If your test requires a TextField nested within a certain view you can grab a driver for that view using:

	var textDriver:TextFieldDriver = inViewOf(ShellContextView).inViewOf(LoginPanel).getA(TextField).named("username_txt");

The TextFieldDriver provides some useful functions:

	textDriver.enterText('User A');
	
... this sets the text, but also fires the TextEvent.TEXT_INPUT event before, and the Event.CHANGE event after, just as if a real people type person had edited it.

Then you can also use the TextFieldDriver.checkText('Blah') function in a test:
	
	assertTrue('TextField starts blank', (textDriver.(checkText(''))));


## You can also:

### Get an interactive object (in this case by specifying a property) and click it:

	var buttonDriver:InteractiveObjectDriver = inViewOf(MainView).inViewOf(SubView).getA(Sprite).withProperty('name', 'btn_login');
	buttonDriver.click();

This will dispatch a MouseEvent.CLICK from the button / sprite / whatever you specified.

List of helpers for the InteractiveObjectDriver:
	click();
	mouseOver();
	mouseOut();
	mouseDown();
	mouseUp();
	rollOver();
	rollOut();

### Get a general view and check something about it:

	var loginScreenDriver:DisplayObjectDriver = inViewOf(ShellContextView).getA(LoginPanel);
	var loginScreen:DisplayObject = loginScreenDriver.view;
	assertTrue('LoginPanel is off screen', (loginScreen.y < (-loginScreen.height)));


### TestCase Examples:

To use RobotEyes you need to grab an instance of it and tell it which class to use to start up your application.
You probably don't want to start your tests instantly - give the app a little room to breathe if it has async startup stuff.

In AsUnit 3 this is done with:

	// these are the really important RobotEyes classes
	import com.newloop.roboteyes.core.RobotEyes;
	import com.newloop.roboteyes.inViewOf;

	// grab any drivers that you need to use - currently there are only 3 but more to come...
	import com.newloop.roboteyes.drivers.DisplayObjectDriver;
	import com.newloop.roboteyes.drivers.InteractiveObjectDriver;
	import com.newloop.roboteyes.drivers.TextFieldDriver;

	// the main class for the app you want to test
	import com.client.app.AcademyShell;

	public class RobotEyesTest extends TestCase {
		private var robotEyes:RobotEyes;

		public function RobotEyesTest(methodName:String=null) {
			super(methodName)
		}
	
		override public function run():void{
			if(robotEyes==null){
				// AcademyShell is the main class for this application (ie the one the compiler gets fed)
				robotEyes = new RobotEyes(AcademyShell);
				addChild(robotEyes);
			}
			// need to wait a while
			var timer:Timer = new Timer(1000,1);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			timer.start();
		}
	
		// we run the tests after a second has passed just to give the application a chance to step through any set up
		private function timerHandler(e:TimerEvent):void{
			super.run();
		}
	
		....   
	
In an end-to-end test you'll probably need to test some stuff asynchronously, and in ASUnit you'd do this by:

  		public function testEndToEndProcessPass():void{
			var textFieldDriver:TextFieldDriver = inViewOf(ShellContextView).inViewOf(LoginPanel).getA(TextField).named("username_txt") as TextFieldDriver;
			textFieldDriver.enterText('Pass');
		
			var buttonDriver:InteractiveObjectDriver = inViewOf(ShellContextView).inViewOf(LoginPanel).getA(Sprite).withProperty("name", "btn_login") as InteractiveObjectDriver;
	   	
			// we're going to wait 4 seconds for the dummy service to return, and the login screen to tween away before we test this
			var asyncTest:Function = addAsync(null, 4000,loginShouldBeOffScreen);
	    
		    // simulate clicking the button
			buttonDriver.click();
		}
	
	    public function loginShouldBeOffScreen(e:Event):void{
			var loginScreenDriver:DisplayObjectDriver = inViewOf(ShellContextView).getA(LoginPanel);
			var loginScreen:DisplayObject = loginScreenDriver.view;
			assertTrue('LoginPanel is off screen', (loginScreen.y < (-loginScreen.height)));
		}
    
## What if I ask for something that doesn't exist?

RobotEyes generally currently returns null whenever it can't find something. This will almost certainly then cause your test to throw a null pointer error, so first it will throw an Error with message: 'RobotEyes can't find an instance of [Class:WidgetView] inside [Object:SpiffingSectionView]'.

## Get in touch

Fork, message me on git or email dailystraying@gmail.com. I'm @stray_and_ruby on twitter.