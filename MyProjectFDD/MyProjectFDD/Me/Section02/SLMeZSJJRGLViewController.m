//
//  SLMeZSJJRGLViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLMeZSJJRGLViewController.h"
#import "SLUIFactory.h"

@interface SLMeZSJJRGLViewController ()

@end

@implementation SLMeZSJJRGLViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"驻守经纪人管理";
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
}

#pragma mark -返回
-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
