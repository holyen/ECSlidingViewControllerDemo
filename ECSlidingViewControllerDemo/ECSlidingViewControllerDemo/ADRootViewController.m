//
//  ADRootViewController.m
//  ECSlidingViewControllerDemo
//
//  Created by Holyen Zou on 13-4-25.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import "ADRootViewController.h"

@interface ADRootViewController ()

@end

@implementation ADRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.shouldAddPanGestureRecognizerToFrontViewSnapshot = YES;
    [self setFrontViewController:[[ADFirstTopViewController alloc] initWithNibName:nil bundle:nil]];
    [self loadLeftBackViewController];
    [self loadRightBackViewController];
}

- (void)loadLeftBackViewController
{
    //implement this method in subclasses
}

- (void)loadRightBackViewController
{
    //implement this method in subclasses
}

@end
