//
//  SLMeJJRKFRLViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLMeJJRKFRLViewController.h"
#import "SLUIFactory.h"
@interface SLMeJJRKFRLViewController ()

@end

@implementation SLMeJJRKFRLViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"经纪人看房预约";
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
}

#pragma mark -返回
-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
