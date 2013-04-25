//
//  ADRootViewController.h
//  ECSlidingViewControllerDemo
//
//  Created by Holyen Zou on 13-4-25.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import "ADSlidingViewController.h"
#import "ADMenuViewController.h"
#import "ADUnderRightViewController.h"
#import "ADFirstTopViewController.h"

@interface ADRootViewController : ADSlidingViewController

- (void)loadLeftBackViewController;
- (void)loadRightBackViewController;

@end
