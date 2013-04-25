//
//  ADFirstTopViewController.m
//  ECSlideingVCDemo
//
//  Created by Holyen Zou on 13-4-24.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import "ADFirstTopViewController.h"

@interface ADFirstTopViewController ()

@end

@implementation ADFirstTopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
