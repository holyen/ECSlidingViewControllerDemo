//
//  ADiPhoneRootViewController.m
//  ECSlidingViewControllerDemo
//
//  Created by Holyen Zou on 13-4-25.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import "ADiPhoneRootViewController.h"

@implementation ADiPhoneRootViewController

- (void)loadLeftBackViewController
{
    self.anchorRightPeekAmount = 49.f;
    UIViewController *menuController = [[ADMenuViewController alloc] initWithNibName:nil bundle:nil];
    self.leftBackViewController = menuController;
}

- (void)loadRightBackViewController
{
    self.anchorLeftPeekAmount = 49.f;
    UIViewController *rightController = [[ADUnderRightViewController alloc] initWithNibName:nil bundle:nil];
    self.rightBackViewController = rightController;
}

@end
