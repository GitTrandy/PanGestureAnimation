//
//  NavigationPerfomer.m
//  PanGestureAnimation
//
//  Created by 阿迪 on 16/4/20.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import "NavigationPerfomer.h"

@implementation NavigationPerfomer

- (instancetype)initWithViewController:(UINavigationController *)navigationController
{
    self = [super init];
    if (self) {
        _navigationController = navigationController;
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
        [_navigationController.view addGestureRecognizer:panGesture];
        _pushAnimation = [[PushAnimation alloc] init];
        _popAnimation = [[PopAnimation alloc] init];
    }
    return self;
}

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)panGesture
{
    UIView *view = self.navigationController.view;
    if (panGesture.state == UIGestureRecognizerStateBegan)
    {
        if ([self.navigationController.viewControllers count] > 1) {
            self.interactionTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else if(panGesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [panGesture translationInView:view];
        CGFloat progress = translation.x/CGRectGetWidth(view.bounds);
        [self.interactionTransition updateInteractiveTransition:progress];
    }
    else if(panGesture.state == UIGestureRecognizerStateEnded)
    {
        if ([panGesture velocityInView:view].x > 0)
        {
            [self.interactionTransition finishInteractiveTransition];
        }
        else
        {
            [self.interactionTransition cancelInteractiveTransition];
        }
        self.interactionTransition = nil;
    }
}


#pragma mark - UIViewControllerAnimatedTransitioning Delegate Method

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush)
    {
        return self.pushAnimation;
    }
    else if(operation == UINavigationControllerOperationPop)
    {
        return self.popAnimation;
    }
    
    return nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    return self.interactionTransition;
}

@end
