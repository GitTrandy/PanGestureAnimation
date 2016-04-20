//
//  NavigationViewController.m
//  PanGestureAnimation
//
//  Created by 阿迪 on 16/4/20.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import "NavigationViewController.h"

@implementation NavigationViewController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        _navigationPerfomer = [[NavigationPerfomer alloc] initWithViewController:self];
        self.delegate = _navigationPerfomer;
    }
    return self;
}



@end
