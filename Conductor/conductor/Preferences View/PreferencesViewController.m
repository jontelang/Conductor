//
//  PreferencesViewController.m
//  Conductor
//
//  Created by Jonathan Winger Lang on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import "PreferencesViewController.h"

@implementation PreferencesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *projectPath = [[NSUserDefaults standardUserDefaults] valueForKey:@"project_path"];
    if( projectPath ){
        xcodeProhectFilePathTextField.stringValue = projectPath;
    }
    
    NSString *schemeName = [[NSUserDefaults standardUserDefaults] valueForKey:@"project_scheme_name"];
    if( schemeName ){
        xcodeSchemeNameTextField.stringValue = schemeName;
    }
    
    NSString *testName = [[NSUserDefaults standardUserDefaults] valueForKey:@"project_test_name"];
    if( testName ){
        xcodeUITestNameTextField.stringValue = testName;
    }
}

- (IBAction)savePressed:(id)sender {
    [[NSUserDefaults standardUserDefaults] setValue:xcodeProhectFilePathTextField.stringValue
                                             forKey:@"project_path"];
    
    [[NSUserDefaults standardUserDefaults] setValue:xcodeSchemeNameTextField.stringValue
                                             forKey:@"project_scheme_name"];
    
    [[NSUserDefaults standardUserDefaults] setValue:xcodeUITestNameTextField.stringValue
                                             forKey:@"project_test_name"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
