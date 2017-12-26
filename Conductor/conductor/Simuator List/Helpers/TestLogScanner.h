//
//  TestLogScanner.h
//  Conductor
//
//  Created by Jonathan Winger Lang on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestLogScanner : NSObject

/// Method to scan a log for common error issues
+(NSString*)statusForLog:(NSString*)log;

@end
