//
//  Simulator.h
//  Conductor
//
//  Created by Jonathan Winger Lang on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/NSTextView.h> // Sim output target
#import "SimulatorDelegate.h"

@interface Simulator : NSObject {
    // Task to be able to terminate it
    NSTask *task;
}

/// Helper that takes strings and spits out objects
+(Simulator*)simulatorFromString:(NSString*)string;

// Properties
@property NSString *simulatorIdentifier;
@property NSString *simulatorName;
@property NSString *simulatorOS;

// Kinda-properties
@property (readonly) NSString *simulatorFullName;

/// Nicely formatted information for display
-(NSString*)prettyDescription;

// Testing related

/// Startes xcodebuild
-(void)startTestingPath:(NSString*)path scheme:(NSString*)scheme test:(NSString*)test;

/// Terminates the NSTask
-(void)terminate;

@property NSString *simulatorStatus;
@property NSMutableString *simulatorOutput;
@property (weak) id delegate;

@end
