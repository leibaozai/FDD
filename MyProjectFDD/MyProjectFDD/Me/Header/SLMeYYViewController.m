//
//  SLMeYYViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLMeYYViewController.h"
#import "SLUIFactory.h"

@interface SLMeYYViewController ()

@end

@implementation SLMeYYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"预约看房";
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
}

#pragma mark -返回
-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
