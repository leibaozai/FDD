//
//  SLBuyHouseSearchViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLBuyHouseSearchViewController.h"
#import "SLUIFactory.h"


@interface SLBuyHouseSearchViewController ()

@end

@implementation SLBuyHouseSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
    
    UISearchBar *seachBar = [[UISearchBar alloc] init];
    seachBar.placeholder = @"请输入小区名";
    
    self.navigationItem.titleView = seachBar;
}

#pragma mark - 返回

-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -选择小区
-(void)searchVillageName
{
    
}


@end
