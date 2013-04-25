//
//  ADNavigationTopViewController.h
//  ECSlideingVCDemo
//
//  Created by Holyen Zou on 13-4-24.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADSlidingViewController.h"
#import "ADMenuViewController.h"
#import "ADSampleTableViewController.h"

@interface ADNavigationTopViewController : UIViewController
- (IBAction)menuTap:(id)sender;
- (IBAction)navToVC1:(id)sender;
- (IBAction)navToVC2:(id)sender;
- (IBAction)navToVC3:(id)sender;

@end
