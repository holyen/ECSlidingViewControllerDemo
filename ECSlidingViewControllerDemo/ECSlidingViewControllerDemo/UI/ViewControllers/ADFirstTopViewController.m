//
//  ADFirstTopViewController.m
//  ECSlideingVCDemo
//
//  Created by Holyen Zou on 13-4-24.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import "ADFirstTopViewController.h"

@implementation ADFirstTopViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if (!self.slidingViewController.underLeftViewController) {
        self.slidingViewController.underLeftViewController = [[ADMenuViewController alloc] initWithNibName:nil bundle:nil];
    }
    if (!self.slidingViewController.underRightViewController) {
        self.slidingViewController.underRightViewController = [[ADUnderRightViewController alloc] initWithNibName:nil bundle:nil];
    }
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)revealUnderRight:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECLeft];
}

@end
