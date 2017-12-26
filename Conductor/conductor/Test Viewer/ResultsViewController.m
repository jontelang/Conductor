//
//  ResultsViewController.m
//  Conductor
//
//  Created by Jonathan Winger Lang on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import "ResultsViewController.h"

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

// Delegate

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    //Simulator *simulator = simulators[row];
    
    NSTableCellView *v = [tableView makeViewWithIdentifier:@"cell_text" owner:self];
    v.textField.textColor = [NSColor textColor];
    
    if( [tableColumn.identifier isEqualToString:@"column_test_name"] ){
        v.textField.stringValue = @"name";
    }
    else if( [tableColumn.identifier isEqualToString:@"column_result"] ){
        v.textField.stringValue = @"res";
    }
    else if( [tableColumn.identifier isEqualToString:@"column_duration"] ){
        v.textField.stringValue = @"dur";
    }
    
    return v;
}

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row{
    return YES;
}


// DataSource

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return 10; //[simulators count];
}


// XX

-(void)test:(NSString*)s{
    titleTextField.stringValue = s;
}

@end
