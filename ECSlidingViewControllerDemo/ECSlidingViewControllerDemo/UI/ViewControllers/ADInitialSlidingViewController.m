//
//  ADInitialSlidingViewController.m
//  ECSlideingVCDemo
//
//  Created by Holyen Zou on 13-4-24.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import "ADInitialSlidingViewController.h"
#import "ADFirstTopViewController.h"

@interface ADInitialSlidingViewController ()

@end

@implementation ADInitialSlidingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.topViewController = [[ADFirstTopViewController alloc] initWithNibName:nil bundle:nil];
}

@end
