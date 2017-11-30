//
//  CustomTransition.m
//  SCNews
//
//  Created by 凌       陈 on 11/10/17.
//  Copyright © 2017 凌       陈. All rights reserved.
//

#import "CustomTransition.h"
#import "RootViewController.h"
#import "PushViewController.h"

@interface CustomTransition ()

@property (nonatomic, assign) TransitionType type;
@property (nonatomic, assign) WhichViewController whichViewController;

@end

@implementation CustomTransition


- (instancetype)initWithTransitionType:(TransitionType)type whichViewController: (WhichViewController)whichViewController {
    if (self = [super init]) {
        _type = type;
        _whichViewController = whichViewController;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.2;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (_type) {
        case push:
            [self doPushAnimation:transitionContext];
            break;
        case pop:
            [self doPopAnimation:transitionContext];
            break;
        default:
            break;
    }
}

/**
 *  执行push过渡动画
 */
- (void)doPushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // 获取动画的fromVC和toVC
    RootViewController *fromVC = (RootViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    PushViewController *toVC   = (PushViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 添加toView到上下文
    [[transitionContext containerView] insertSubview:toVC.view aboveSubview:fromVC.view];
    
    // 设置起始transform
    toVC.view.transform   = CGAffineTransformMakeTranslation(ScreenWidth, 0);
    fromVC.view.transform = CGAffineTransformMakeTranslation(0, 0);

    // 开始动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toVC.view.transform   = CGAffineTransformMakeTranslation(0, 0);
        fromVC.view.transform = CGAffineTransformMakeTranslation(-ScreenWidth, 0);
    } completion:^(BOOL finished) {
        
        fromVC.view.transform = CGAffineTransformIdentity;
        
        // 声明过渡结束时调用 completeTransition: 这个方法
        [transitionContext completeTransition:YES];
        
    }];
    
}
/**
 *  执行pop过渡动画
 */
- (void)doPopAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // 获取动画的fromVC和toVC
    PushViewController *fromVC = (PushViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    RootViewController *toVC   = (RootViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //添加toView到上下文
    [[transitionContext containerView] insertSubview:toVC.view belowSubview:fromVC.view];
    
    // 设置起始transform
    fromVC.view.transform = CGAffineTransformMakeTranslation(0, 0);
    toVC.view.transform   = CGAffineTransformMakeTranslation(-ScreenWidth, 0);

    // 开始动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromVC.view.transform = CGAffineTransformMakeTranslation(ScreenWidth, 0);
        toVC.view.transform   = CGAffineTransformMakeTranslation(0, 0);
        
    } completion:^(BOOL finished) {
        
        fromVC.view.transform = CGAffineTransformIdentity;
        
        // 声明过渡结束时调用 completeTransition: 这个方法
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}



@end
