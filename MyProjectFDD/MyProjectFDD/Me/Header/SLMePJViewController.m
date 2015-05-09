//
//  SLMePJViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLMePJViewController.h"
#import "SLUIFactory.h"
#import "SLMePJHelpViewController.h"

@interface SLMePJViewController ()

@end

@implementation SLMePJViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"经纪人评价管理";
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
    
    self.navigationItem.rightBarButtonItem = [SLUIFactory createTitleBBIWithTitle:@"帮助" target:self action:@selector(helpClick)];
}

#pragma mark -返回
-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 帮助
-(void)helpClick
{
    SLMePJHelpViewController *helpVC = [[SLMePJHelpViewController alloc] init];
    [self.navigationController pushViewController:helpVC animated:YES];
}

@end
