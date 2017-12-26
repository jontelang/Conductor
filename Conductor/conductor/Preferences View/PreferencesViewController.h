//
//  PreferencesViewController.h
//  Conductor
//
//  Created by Jonathan Winger Lang on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PreferencesViewController : NSViewController {
    __weak IBOutlet NSTextField *xcodeProhectFilePathTextField;
    __weak IBOutlet NSTextField *xcodeSchemeNameTextField;
    __weak IBOutlet NSTextField *xcodeUITestNameTextField;
}

@end
