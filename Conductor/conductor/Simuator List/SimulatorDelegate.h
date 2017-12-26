//
//  SimulatorDelegate.h
//  Conductor
//
//  Created by Jonathan Winger Lang on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Simulator;

@protocol SimulatorDelegate <NSObject>

@required

-(void)simulator:(Simulator*)simulator didFinishTesting:(NSString*)result;

-(void)simulator:(Simulator*)simulator didReceiveOutput:(NSString*)output;

@end
