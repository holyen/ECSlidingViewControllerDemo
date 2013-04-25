//
//  ADMainWindow.h
//  ECSlidingViewControllerDemo
//
//  Created by Holyen Zou on 13-4-25.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADRootViewController.h"
#import "ADiPhoneRootViewController.h"
#import "ADiPadRootViewController.h"

@interface ADMainWindow : UIWindow

- (void)setRootViewController:(UIViewController *)rootViewController animated:(BOOL)animated;

//- (void)transitionToLoginViewController;
//- (void)transitionToGuideViewController;
- (void)transitionToMainViewController;

@end
