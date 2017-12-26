//
//  SimulatorDataSource.m
//  Conductor
//
//  Created by Jonathan Winger Lang on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import "SimulatorDataSource.h"
#import "Simulator.h"

@implementation SimulatorDataSource

+(NSArray*)retrieveSimulatorsFromSystem{
    //int pid = [[NSProcessInfo processInfo] processIdentifier];
    NSPipe *pipe = [NSPipe pipe];
    NSFileHandle *file = pipe.fileHandleForReading;
    
    NSTask *task = [[NSTask alloc] init];
    task.launchPath = @"/usr/bin/instruments";
    task.arguments = @[@"-s",@"devices"];
    task.standardOutput = pipe;
    task.standardError = pipe;
    
    [task launch];
    
    NSData *data = [file readDataToEndOfFile];
    [file closeFile];
    
    //[task waitUntilExit];
    
    NSString *output = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSMutableArray *simulators = [[NSMutableArray alloc] init];
    
    for (NSString *line in [output componentsSeparatedByString:@"\n"]) {
        Simulator *simulator = [Simulator simulatorFromString:line];
        if( [simulator.simulatorName containsString:@"Watch"] ){
            // Skip
        }else{
            if( simulator ){
                [simulators addObject:simulator];
            }
        }
    }
    
    return simulators;
}

@end
