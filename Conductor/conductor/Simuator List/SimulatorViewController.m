//
//  SimulatorViewController.m
//  Conductor
//
//  Created by Jonathan Winger Lang on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import "SimulatorViewController.h"
#import "Simulator.h"
#import "SimulatorDataSource.h"

// For the openability
#import "ResultsViewController.h"

@implementation SimulatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    simulators = [SimulatorDataSource retrieveSimulatorsFromSystem];
    
    // Since the simulators are created in another area, i need to set their
    // delegates to the current viewcontroller manually.
    [simulators makeObjectsPerformSelector:@selector(setDelegate:) withObject:self];
    
    [simulatorTableView reloadData];
    
    // No delegate method for this so..
    [simulatorTableView setDoubleAction:@selector(doubleTappedRow)];
}


// Delegate

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    Simulator *simulator = simulators[row];
    
    NSTableCellView *v = [tableView makeViewWithIdentifier:@"cell_text" owner:self];
    v.textField.textColor = [NSColor textColor];
    
    if( [tableColumn.identifier isEqualToString:@"column_simulator"] ){
        v.textField.stringValue = simulator.simulatorFullName;
    }
    else if( [tableColumn.identifier isEqualToString:@"column_status"] ){
        if( [simulator.simulatorStatus isEqualToString:@"Testing"] ){
            v = [tableView makeViewWithIdentifier:@"cell_spinner" owner:self];
            [((NSProgressIndicator*)v.subviews[0]) startAnimation:nil];
        }
        else{
            v.textField.stringValue = simulator.simulatorStatus;
        }
    }
    return v;
}

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row{
    // Remove the old target to avoid confusing output
    textView.string = @"";
    
    currentlySelectedSimulator = simulators[row];
    currentSimulatorTextField.stringValue = [currentlySelectedSimulator prettyDescription];
    
    // Specificalle when we select a row we need to set the text becuase
    // the target thing will only update when new data comes in
    textView.string = currentlySelectedSimulator.simulatorOutput;
    [textView scrollToEndOfDocument:nil];
    
    return YES;
}


// DataSource

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [simulators count];
}


// Actions stuff

- (void)startTesting {
    NSString *projectPath = [[NSUserDefaults standardUserDefaults] valueForKey:@"project_path"];
    NSString *schemeName = [[NSUserDefaults standardUserDefaults] valueForKey:@"project_scheme_name"];
    NSString *testName = [[NSUserDefaults standardUserDefaults] valueForKey:@"project_test_name"];
    
    if( !projectPath && !schemeName && !testName ){
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"No settings entered"];
        [alert setInformativeText:@"To use this application, you need to first set up the paths etc to your project. Open the preferences page from the menu to do so. Or press CMD + ,"];
        [alert setAlertStyle:NSAlertStyleCritical];
        [alert runModal];
    }
    else{
        [currentlySelectedSimulator startTestingPath:projectPath scheme:schemeName test:testName];
        // Reload only specific row + column we pressed
        [simulatorTableView reloadData];
    }
}

-(void)doubleTappedRow{
    NSInteger index = [simulatorTableView clickedRow];
    NSLog(@"doubleTapped row: %i", (int)index);
    [self startTesting];
    
    //NSStoryboard *storyboard = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    //NSWindowController *nswc = (NSWindowController*)[storyboard instantiateControllerWithIdentifier:@"ResultsViewController_ID"];
    //ResultsViewController *rvc = (ResultsViewController*)nswc.contentViewController;
    //[rvc test:[currentlySelectedSimulator prettyDescription]];
    //[nswc showWindow:nil];
}


// Simulator Delegate

-(void)simulator:(Simulator *)simulator didFinishTesting:(NSString *)result{
    [simulatorTableView reloadData];
}

-(void)simulator:(Simulator*)simulator didReceiveOutput:(NSString*)output{
    if( [simulator isEqualTo:currentlySelectedSimulator] ){
        // Chugs like heeeeck otherwise if we allow all billion lines..
        int index = (int)output.length-500;
        if( index < 0 ){
            index = 0;
        }
        
        // https://stackoverflow.com/questions/5495065/cocoa-real-slow-nstextview-is-there-a-better-way-to-append-text-to-the-contents
        NSTextStorage *textStorage = [textView textStorage];
        [textStorage beginEditing];
        [textStorage replaceCharactersInRange:NSMakeRange([textStorage length], 0)
                                   withString:[output substringFromIndex:index]];
        [textStorage endEditing];
        
        [textView scrollToEndOfDocument:nil];
    }
}

@end
