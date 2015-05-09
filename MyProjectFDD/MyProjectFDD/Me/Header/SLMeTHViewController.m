//
//  SLMeTHViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLMeTHViewController.h"
#import "SLUIFactory.h"


@interface SLMeTHViewController ()

@end

@implementation SLMeTHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"400通话记录";
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
}

#pragma mark -返回
-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
