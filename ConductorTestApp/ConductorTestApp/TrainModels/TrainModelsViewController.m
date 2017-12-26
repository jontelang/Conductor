//
//  TrainModelsViewController.m
//  ConductorTestApp
//
//  Created by Jonathan on 12/26/17.
//  Copyright © 2017 Jonathan Winger Lang. All rights reserved.
//

#import "TrainModelsViewController.h"

@interface TrainModelsViewController ()

@end

@implementation TrainModelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    trainModels = @[
        @"BB 221 2-6-4 Adriatic O27 New York Central",
        @"BB 224 2-6-2 Prairie O Lionel Lines",
        @"BB 233 2-4-2 Columbia O27 Lionel Lines",
        @"BB 235 2-4-2 Columbia O27 Lionel Lines",
        @"BB 236 2-4-2 Columbia O27 Lionel Lines",
        @"BB 237 2-4-2 Columbia O27 Lionel Lines",
        @"BB 238 2-4-2 Columbia O27 Lionel Lines",
        @"BB 239 2-4-2 Columbia O27 Lionel Lines",
        @"BB 240 2-4-2 Columbia O27 Lionel Lines",
        @"BB 241 2-4-2 Columbia O27 Lionel Lines",
        @"BB 242 2-4-2 Columbia O27 Lionel Lines",
        @"BB 243 2-4-2 Columbia O27 Lionel Lines",
        @"BB 244 2-4-2 Columbia O27 Lionel Lines",
        @"BB 245 2-4-2 Columbia O27 Lionel Lines",
        @"BB 246 2-4-2 Columbia O27 Lionel Lines",
        @"BB 247 2-4-2 Columbia O27 Baltimore & Ohio",
        @"BB 248 2-4-2 Columbia O27 Lionel Lines",
        @"BB 249 2-4-2 Columbia O27 Pennsylvania",
        @"BB 250 2-4-2 Columbia O27 Pennsylvania",
        @"BB 251 2-4-2 Columbia O27 Southern Pacific",
        @"BB 637 2-6-4 Adriatic O Pennsylvania",
        @"BB 646 4-6-4 Hudson O Lionel Lines",
        @"BB 665 4-6-4 Hudson O Lionel Lines",
        @"BB 671 6-8-6 Steam Turbine O Lionel Lines",
        @"BB 671R 6-8-6 Steam Turbine O Lionel Lines",
        @"BB 675 2-6-2 Prairie O Lionel Lines",
        @"BB 681 6-8-6 Steam Turbine O Lionel Lines",
        @"BB 682 6-8-6 Steam Turbine O Pennsylvania",
        @"BB 685 4-6-4 Hudson O Lionel Lines",
        @"BB 726 2-8-4 Berkshire O Lionel Lines",
        @"BB 726RR 2-8-4 Berkshire O Lionel Lines",
        @"BB 736 2-8-4 Berkshire O Lionel Lines",
        @"BB 746 4-8-4 Northern O Norfolk & Western",
        @"BB 773 4-6-4 Hudson O Scale Lionel Lines",
        @"BB 1001 2-4-2 Columbia O27 Lionel Scout",
        @"BB 1050 0-4-0 Switcher O27 Lionel Scout",
        @"BB 1060 2-4-2 Columbia O27 Lionel Scout",
        @"BB 1061 0-4-0 or 2-4-2 Columbia O27 Lionel Scout",
        @"BB 1062 0-4-0 or 2-4-2 Columbia O27 Lionel Scout",
        @"BB 1101 2-4-2 Columbia O27 Lionel Scout",
        @"BB 1110 2-4-2 Columbia O27 Lionel Scout",
        @"BB 1120 2-4-2 Columbia O27 Lionel Scout",
        @"BB 1130 2-4-2 Columbia O27 Lionel Scout",
        @"BB 1615 0-4-0 Switcher O27 Lionel Lines",
        @"BB 1625 0-4-0 Switcher O27 Lionel Lines",
        @"BB 1654 2-4-2 Columbia O27 Lionel Lines",
        @"BB 1655 2-4-2 Columbia O27 Lionel Lines",
        @"BB 1656 0-4-0 Switcher O27 Lionel Lines",
        @"BB 1665 0-4-0 Switcher O27 Lionel Lines",
        @"BB 1666 2-6-2 Prairie O27 Lionel Lines",
        @"BB 1862 4-4-0 American O27 General",
        @"BB 1872 4-4-0 American O General",
        @"BB 1882 4-4-0 American O27 General",
        @"BB 2016 2-6-4 Adriatic O27 Lionel Lines",
        @"BB 2018 2-6-4 Adriatic O27 Lionel Lines",
        @"BB 2020 6-8-6 Steam Turbine O27 Lionel Lines",
        @"BB 2025 2-6-2 Prairie O27 Lionel Lines",
        @"BB 2026 2-6-2 Prairie O27 Lionel Lines",
        @"BB 2029 2-6-4 Adriatic O27 Lionel Lines",
        @"BB 2034 2-4-2 Columbia O27 Lionel Lines",
        @"BB 2035 2-6-4 Adriatic O27 Lionel Lines",
        @"BB 2036 2-6-4 Adriatic O27 Lionel Lines",
        @"BB 2037 2-6-4 Adriatic O27 Lionel Lines",
        @"BB 2046 4-6-4 Hudson O27 Lionel Lines",
        @"BB 2055 4-6-4 Hudson O27 Lionel Lines",
        @"BB 2056 4-6-4 Hudson O27 Lionel Lines",
        @"BB 2065 4-6-4 Hudson O27 Lionel Lines",
        @"BB 6110 2-4-2 Columbia O27 Lionel Lines"
    ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [trainModels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = trainModels[indexPath.row];
    return cell;
}

@end
