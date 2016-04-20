//
//  PopAnimation.m
//  PanGestureAnimation
//
//  Created by 阿迪 on 16/4/20.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import "PopAnimation.h"

@implementation PopAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.35f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *srcViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *desViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [[transitionContext containerView] addSubview:desViewController.view];
    [[transitionContext containerView] addSubview:srcViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         srcViewController.view.transform = CGAffineTransformMakeTranslation(srcViewController.view.frame.size.width, 0.f);
                         
                     } completion:^(BOOL finished) {
                         srcViewController.view.transform = CGAffineTransformIdentity;
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

@end
