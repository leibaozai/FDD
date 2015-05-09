//
//  SLMeSettingViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLMeSettingViewController.h"
#import "SLUIFactory.h"


@interface SLMeSettingViewController ()


@end

@implementation SLMeSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
    self.view.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark -返回

-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}


//退出登录
- (IBAction)exitLoginButtonClick:(id)sender {
    
}

//是否接收短信
- (IBAction)isReceiveMsg:(id)sender {
    
}

//是否接收提示音
- (IBAction)isReceiveVoice:(id)sender {
    
}
@end
