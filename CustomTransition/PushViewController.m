//
//  PushViewController.m
//  CustomTransision
//
//  Created by 凌       陈 on 11/30/17.
//  Copyright © 2017 凌       陈. All rights reserved.
//

#import "PushViewController.h"


@interface PushViewController ()

@end

@implementation PushViewController

-(instancetype) init {
    self = [super init];
    if (self) {
        
        // 退出界面按键

        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 60, 30)];
        _backBtn.center = self.view.center;
        [_backBtn setTitle:@"Back" forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_backBtn setBackgroundColor:[UIColor redColor]];
        [_backBtn addTarget:self action:@selector(backToPushViewController) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_backBtn];
        
        [self.view setBackgroundColor:[UIColor yellowColor]];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // transitioningDelegate
    self.transitioningDelegate  = self;
    self.modalTransitionStyle   = UIModalTransitionStyleCoverVertical;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    [self.view setBackgroundColor:[UIColor redColor]];
}

#pragma mark - 返回push view
-(void) backToPushViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 导航控制器的代理
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[CustomTransition alloc] initWithTransitionType:push whichViewController:Radio];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[CustomTransition alloc] initWithTransitionType:pop whichViewController:Radio];
}


@end
