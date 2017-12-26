//
//  ConductorTestAppUITests.m
//  ConductorTestAppUITests
//
//  Created by Jonathan on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ConductorTestAppUITests : XCTestCase

@end

@implementation ConductorTestAppUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMainScreen {
    //
    // Ensures the buttons are present
    //
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCTAssert( [[[app.buttons matchingIdentifier:@"showTrainModels"] firstMatch] exists] );
    XCTAssert( [[[app.buttons matchingIdentifier:@"showAboutConductor"] firstMatch] exists] );
}

- (void)testTrainModels {
    //
    // Ensures we can open the train model screen, find some element and then go back
    //
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[app.buttons matchingIdentifier:@"showTrainModels"] firstMatch] tap];
    [[[app.staticTexts matchingIdentifier:@"BB 242 2-4-2 Columbia O27 Lionel Lines"] firstMatch] tap];
    [[[app.buttons matchingIdentifier:@"Back"] firstMatch] tap];
    
    // Use testMainScreen to check if we're looking at the main screen after going back
    [self testMainScreen];
}

- (void)testAboutScreen {
    //
    // Ensures we can open the about screen
    //
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[app.buttons matchingIdentifier:@"showAboutConductor"] firstMatch] tap];
    [[[app.buttons matchingIdentifier:@"Back"] firstMatch] tap];
    
    // Use testMainScreen to check if we're looking at the main screen after going back
    [self testMainScreen];
}


@end
