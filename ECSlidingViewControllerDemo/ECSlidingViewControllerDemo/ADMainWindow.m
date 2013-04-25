//
//  ADMainWindow.m
//  ECSlidingViewControllerDemo
//
//  Created by Holyen Zou on 13-4-25.
//  Copyright (c) 2013年 AnyData.com. All rights reserved.
//

#import "ADMainWindow.h"
#import "IVRenderHelper.h"
#define DEGREES_TO_RADIANS(degrees) (degrees * M_PI / 180)

@implementation ADMainWindow

static CGAffineTransform transformForOrientation(UIInterfaceOrientation orientation)
{
    switch (orientation) {
        case UIInterfaceOrientationLandscapeLeft:
            return CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(90));
            
        case UIInterfaceOrientationLandscapeRight:
            return CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(-90));
            
        case UIInterfaceOrientationPortraitUpsideDown:
            return CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180));
            
        case UIInterfaceOrientationPortrait:
        default:
            return CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(0));
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)transitionToMainViewController
{
    BOOL isPhone = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
    NSString *vcStr = isPhone ? @"ADiPhoneRootViewController" :@"ADiPadRootViewController";
    ADRootViewController *mainVC = [[NSClassFromString(vcStr) alloc] initWithNibName:vcStr bundle:nil];
    [self setRootViewController:mainVC animated:YES];
}

- (void)setRootViewController:(UIViewController *)rootViewController
                     animated:(BOOL)animated;
{
    if (self.rootViewController && rootViewController && animated) {
        [self translateToViewController:rootViewController];
    } else {
        [super setRootViewController:rootViewController];
    }
}

- (void)translateToViewController:(UIViewController *)viewController
{
    UIView *fromView = self;
    CGRect appFrame = [UIScreen mainScreen].applicationFrame;
    UIImage *fromViewImage = [IVRenderHelper imageFromView:fromView withRect:appFrame];
    CALayer *fromLayer = [CALayer layer];
    fromLayer.frame = appFrame;
    fromLayer.contents = (id)fromViewImage.CGImage;
    fromLayer.name = @"com.anydata.db.view.layer.from";
    
    // *CAUTION* __MUST__ dismiss rootViewController's presentedViewController before release it.
    if (self.rootViewController.presentedViewController) {
        [self.rootViewController dismissViewControllerAnimated:NO completion:NULL];
    }
    
    self.rootViewController = viewController;
    UIView *toView = self.rootViewController.view;
    
    CALayer *containerLayer = [CALayer layer];
    containerLayer.frame = toView.bounds;
    [toView.layer addSublayer:containerLayer];
    
    CGFloat width = containerLayer.bounds.size.width;
    CGFloat height = containerLayer.bounds.size.height;

    // UIWindow will never rotate. So we take rotation into account and make transform manually
    UIInterfaceOrientation o = [UIApplication sharedApplication].statusBarOrientation;
    CGAffineTransform aff = transformForOrientation(o);
    fromLayer.transform = CATransform3DMakeAffineTransform(aff);
    
    // UIWindow's frame is not fixed. So we make adjustment here
    CGFloat fromHeight = UIInterfaceOrientationIsLandscape(o) ? fromLayer.bounds.size.width : fromLayer.bounds.size.height;
    CGFloat revise = fromHeight - height;
    fromLayer.position = CGPointMake(width / 2, height / 2 - revise / 2);
    //toLayer.position = CGPointMake(width * 1.5, height / 2);
    
    [containerLayer addSublayer:fromLayer];
    //[containerLayer addSublayer:toLayer];
    
    dispatch_block_t translation = ^ {
        [CATransaction begin];
        [CATransaction setAnimationDuration:.3];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [CATransaction setCompletionBlock:^ {
            [containerLayer removeFromSuperlayer];
        }];
        
        CGFloat offset = -toView.bounds.size.width;
        CGPoint newPos = fromLayer.position;
        newPos.x += offset;
        fromLayer.position = newPos;
        
        //newPos = toLayer.position;
        //newPos.x += offset;
        //toLayer.position = newPos;
        
        [CATransaction commit];
    };
    
    [self performSelector:@selector(performBlock:) withObject:[translation copy] afterDelay:0.1];
}

- (void)performBlock:(dispatch_block_t)block
{
    block();
}

@end
