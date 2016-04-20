//
//  PushAnimation.m
//  PanGestureAnimation
//
//  Created by 阿迪 on 16/4/20.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import "PushAnimation.h"

@implementation PushAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.35f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *srcViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *desViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] addSubview:srcViewController.view];
    [[transitionContext containerView] addSubview:desViewController.view];
    
    desViewController.view.transform = CGAffineTransformTranslate(desViewController.view.transform, desViewController.view.frame.size.width, 0);
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         desViewController.view.transform = CGAffineTransformMakeTranslation(0.f, 0.f);
    
                     } completion:^(BOOL finished) {
                         srcViewController.view.transform = CGAffineTransformIdentity;
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}


@end
