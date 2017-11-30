//
//  CustomTransition.h
//  SCNews
//
//  Created by 凌       陈 on 11/10/17.
//  Copyright © 2017 凌       陈. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ScreenWidth    UIScreen.mainScreen.bounds.size.width
#define ScreenHeight    UIScreen.mainScreen.bounds.size.height

typedef NS_ENUM(NSInteger, TransitionType) {
    push,
    pop
};

typedef NS_ENUM(NSInteger, WhichViewController) {
    Radio,
    Listening,
    Recording,
    Reading
};

@interface CustomTransition : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithTransitionType:(TransitionType)type whichViewController: (WhichViewController)whichViewController;

@end
