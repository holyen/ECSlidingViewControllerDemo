//
//  ADMenuViewController.h
//  ECSlideingVCDemo
//
//  Created by Holyen Zou on 13-4-24.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADSlidingViewController.h"

@interface ADMenuViewController : UIViewController <UITableViewDataSource, UITabBarControllerDelegate, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
