//
//  ADSecondTopViewController.m
//  ECSlideingVCDemo
//
//  Created by Holyen Zou on 13-4-24.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import "ADSecondTopViewController.h"

@interface ADSecondTopViewController ()

@end

@implementation ADSecondTopViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[ADMenuViewController class]]) {
        self.slidingController.underLeftViewController = [[ADMenuViewController alloc] initWithNibName:nil bundle:nil];
    }
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (IBAction)menuTap:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECRight];
}
@end
