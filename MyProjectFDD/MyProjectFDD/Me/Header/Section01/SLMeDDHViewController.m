//
//  SLMeDDHViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLMeDDHViewController.h"
#import "SLUIFactory.h"

@interface SLMeDDHViewController ()

@end

@implementation SLMeDDHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的多多惠";
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
    
    self.navigationItem.rightBarButtonItem = [SLUIFactory createTitleBBIWithTitle:@"关闭" target:self action:@selector(close)];
}

#pragma mark -返回
-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -关闭
-(void)close
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
