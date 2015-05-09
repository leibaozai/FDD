//
//  SLMePBGDJJRViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLMePBGDJJRViewController.h"
#import "SLUIFactory.h"
@interface SLMePBGDJJRViewController ()

@end

@implementation SLMePBGDJJRViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"我屏蔽的经纪人";
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
}

#pragma mark -返回
-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
