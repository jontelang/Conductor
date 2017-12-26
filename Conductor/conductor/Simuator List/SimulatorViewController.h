//
//  SimulatorViewController.h
//  Conductor
//
//  Created by Jonathan Winger Lang on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SimulatorDelegate.h"

@class Simulator;

@interface SimulatorViewController : NSViewController
    <NSTableViewDelegate,
     NSTableViewDataSource,
     SimulatorDelegate> {
         
         // Needed to reload manually
         __weak IBOutlet NSTableView *simulatorTableView;
        
         // Current sim selected
         Simulator *currentlySelectedSimulator;
        
         __weak IBOutlet NSTextField *currentSimulatorTextField;
         
         __unsafe_unretained IBOutlet NSTextView *textView;
         
         NSArray *simulators;
}

@end
