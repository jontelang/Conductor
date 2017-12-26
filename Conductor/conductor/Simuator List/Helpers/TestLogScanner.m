//
//  TestLogScanner.m
//  Conductor
//
//  Created by Jonathan Winger Lang on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import "TestLogScanner.h"

@implementation TestLogScanner

+(NSString*)statusForLog:(NSString*)log{
    //
    // Fail
    //
    NSRegularExpression *failRegex = [NSRegularExpression regularExpressionWithPattern:@"Test Suite \'.+\' failed"
                                                                               options:0
                                                                                 error:nil];
    if( [failRegex firstMatchInString:log options:0 range:NSMakeRange(0, log.length)] ){
        return @"Test Suite Failed";
    }
    
    //
    // Pass
    //
    NSRegularExpression *passRegex = [NSRegularExpression regularExpressionWithPattern:@"Test Suite \'.+\' passed"
                                                                               options:0
                                                                                 error:nil];
    if( [passRegex firstMatchInString:log options:0 range:NSMakeRange(0, log.length)] ){
        return @"Test Suite Passed";
    }
    
    //
    // UI Testing Not Supported
    //
    if( [log containsString:@"UI Testing is not supported on"] ){
        return @"UI Testing Not Supported";
    }
    
    //
    // Architecture Unsupported
    //
    if( [log containsString:@"Try installing a universal version"] ){
        return @"Architecture Unsupported";
    }
    
    //
    // Build Failure
    //
    if( [log containsString:@"The following build commands failed"] ){
        return @"Build Failure";
    }

    return @"Unknown Status";
}

@end
