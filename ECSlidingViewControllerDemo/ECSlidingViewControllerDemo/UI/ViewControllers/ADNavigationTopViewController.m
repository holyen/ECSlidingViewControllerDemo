//
//  ADNavigationTopViewController.m
//  ECSlideingVCDemo
//
//  Created by Holyen Zou on 13-4-24.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import "ADNavigationTopViewController.h"

@implementation ADNavigationTopViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[ADMenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [[ADMenuViewController alloc] initWithNibName:nil bundle:nil];
    }
}

- (IBAction)menuTap:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)navToVC1:(id)sender {
    [self.navigationController pushViewController:[[ADSampleTableViewController alloc] initWithNibName:nil bundle:nil] animated:YES];
}

- (IBAction)navToVC2:(id)sender {
}

- (IBAction)navToVC3:(id)sender {
}
@end
