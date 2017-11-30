//
//  RootViewController.m
//  CustomTransision
//
//  Created by 凌       陈 on 11/30/17.
//  Copyright © 2017 凌       陈. All rights reserved.
//

#import "RootViewController.h"
#import "PushViewController.h"

@interface RootViewController ()

@property (nonatomic,strong) UIButton *pushBtn;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];

    _pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 60, 30)];
    _pushBtn.center = self.view.center;
    [_pushBtn setTitle:@"Push" forState:UIControlStateNormal];
    [_pushBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_pushBtn setBackgroundColor:[UIColor redColor]];
    [_pushBtn addTarget:self action:@selector(pushToRootViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_pushBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushToRootViewController {
    PushViewController *pushVC = [[PushViewController alloc] init];
    [self presentViewController:pushVC animated:YES completion:nil];
}

@end
