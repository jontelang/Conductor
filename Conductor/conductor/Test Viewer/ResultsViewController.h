//
//  ResultsViewController.h
//  Conductor
//
//  Created by Jonathan Winger Lang on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ResultsViewController : NSViewController <NSTableViewDataSource,NSTableViewDelegate> {
    __weak IBOutlet NSTextField *titleTextField;
}

-(void)test:(NSString*)s;

@end
