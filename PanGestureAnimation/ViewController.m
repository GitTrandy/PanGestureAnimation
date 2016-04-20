//
//  ViewController.m
//  PanGestureAnimation
//
//  Created by 阿迪 on 16/4/20.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"sky.jpeg"];
    imgView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:imgView];
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.backgroundColor = [UIColor whiteColor];
    [pushBtn setTitle:@"Push" forState:UIControlStateNormal];
    [pushBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    pushBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
    pushBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50.f, [UIScreen mainScreen].bounds.size.height/2 - 50.f, 100.f, 100.f);
    [pushBtn addTarget:self action:@selector(pushBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}

- (void)pushBtnClick:(UIButton *)pushBtn
{
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
