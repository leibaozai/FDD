//
//  SLPreViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-8.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLPreViewController.h"

#import "SLUIFactory.h"

@interface SLPreViewController ()

@end

@implementation SLPreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"测试";
    
    self.navigationItem.hidesBackButton = YES;
    
    self.navigationItem.rightBarButtonItem = [SLUIFactory createTitleBBIWithTitle:@"取消预览" target:self action:@selector(blackViewController)];
}

//返回
-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
