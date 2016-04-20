//
//  NavigationPerfomer.h
//  PanGestureAnimation
//
//  Created by 阿迪 on 16/4/20.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PushAnimation.h"
#import "PopAnimation.h"

@interface NavigationPerfomer : NSObject<UINavigationControllerDelegate>

@property (nonatomic, strong, readonly) UINavigationController *navigationController;

@property (nonatomic, strong)   PushAnimation   *pushAnimation;
@property (nonatomic, strong)   PopAnimation    *popAnimation;

@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *interactionTransition;

- (instancetype)initWithViewController:(UIViewController *)viewController;

@end
