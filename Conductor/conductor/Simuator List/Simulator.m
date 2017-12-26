//
//  Simulator.m
//  Conductor
//
//  Created by Jonathan Winger Lang on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import "Simulator.h"
#import "TestLogScanner.h"

@implementation Simulator

+(Simulator*)simulatorFromString:(NSString*)string{
    NSLog(@"line: %@", string);
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(iPhone.+)\\ \\((.+)\\)\\ \\[(.+)\\]" options:0 error:nil];
    NSArray *matches = [regex matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    for (NSTextCheckingResult *match in matches){
        for (int i = 0; i < match.numberOfRanges; i++) {
            NSLog(@"match %i: %@", i, [string substringWithRange:[match rangeAtIndex:i]]);
        }
        Simulator *simulator = [[Simulator alloc] init];
        simulator.simulatorName = [string substringWithRange:[match rangeAtIndex:1]];
        simulator.simulatorOS = [string substringWithRange:[match rangeAtIndex:2]];
        simulator.simulatorIdentifier = [string substringWithRange:[match rangeAtIndex:3]];
        simulator.simulatorStatus = @"";
        return simulator;
    }
    
    // Pls crash
    return nil;
}

-(NSString *)simulatorFullName{
    return [NSString stringWithFormat:@"%@ (%@)", self.simulatorName, self.simulatorOS];
}

-(NSString*)prettyDescription{
    return [NSString stringWithFormat:@"Name: %@\nOS: %@\nID: %@",
            self.simulatorName,
            self.simulatorOS,
            self.simulatorIdentifier];
}

-(void)startTestingPath:(NSString*)path scheme:(NSString*)scheme test:(NSString*)test{
    // TODO: Make nicer?
    if( [task isRunning] ){
        [self terminate];
    }
    else{
        _simulatorStatus = @"Testing";
        
        
        //int pid = [[NSProcessInfo processInfo] processIdentifier];
        NSPipe *pipe = [NSPipe pipe];
        NSFileHandle *file = pipe.fileHandleForReading;
        
        [task terminate];
        task = nil;
        task = [[NSTask alloc] init];
        task.launchPath = @"/usr/bin/xcodebuild";
        task.arguments =
            @[[path containsString:@".xcworkspace"] ? @"-workspace" : @"-project",
              [path stringByExpandingTildeInPath], // In case user wrote ~/Work/etc
              @"-scheme",
              scheme,
              @"-sdk",
              @"iphonesimulator",
              @"-destination", [NSString stringWithFormat:@"platform=iOS Simulator,OS=%@,id=%@", self.simulatorOS, self.simulatorIdentifier],
              [NSString stringWithFormat:@"-only-testing:%@", test],
              @"test"];
        
        
        task.standardOutput = pipe;
        task.standardError = pipe;
        
        [task launch];
        
        self.simulatorOutput = [[NSMutableString alloc] init];
        
        file.readabilityHandler = ^(NSFileHandle * _Nonnull fileHandle) {
            NSData *data = [fileHandle availableData];
            NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            // NSLog(@"read: %@", text);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.simulatorOutput appendString:text];
                
                if( [self.delegate respondsToSelector:@selector(simulator:didReceiveOutput:)] ){
                    [self.delegate simulator:self didReceiveOutput:self.simulatorOutput];
                }
            });
        };
        
        task.terminationHandler = ^(NSTask * _Nonnull task__) {
            _simulatorStatus = [TestLogScanner statusForLog:self.simulatorOutput];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // Notify if delegate is set only
                // TODO: Use a weakself thingy
                if( [self.delegate respondsToSelector:@selector(simulator:didFinishTesting:)] ){
                    [self.delegate simulator:self didFinishTesting:@"yay"];
                }
            });
            
            // It kept kicking off readabilityHandler blocks..
            [file closeFile];
        };
    }
}

-(void)terminate{
    [task terminate];
    _simulatorStatus = @"Process Terminated";

    dispatch_async(dispatch_get_main_queue(), ^{
        // Notify if delegate is set only
        if( [self.delegate respondsToSelector:@selector(simulator:didFinishTesting:)] ){
            [self.delegate simulator:self didFinishTesting:@"yay"];
        }
    });
}

-(NSString*)simulatorOutput{
    if( _simulatorOutput == nil ){
        return @"";
    }
    else{
        return _simulatorOutput;
    }
}

@end
