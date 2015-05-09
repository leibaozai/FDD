//
//  SLFindManageViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLFindManageViewController.h"
#import "SLNearbyShopViewController.h"
#import "SLUIFactory.h"


@interface SLFindManageViewController ()

@end

@implementation SLFindManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
    self.navigationItem.rightBarButtonItem = [SLUIFactory createTitleBBIWithTitle:@"找门店" target:self action:@selector(findNearbyShop)];
    
    UISearchBar *search = [[UISearchBar alloc] init];
    search.placeholder = @"请输入楼盘名或地址";

    self.navigationItem.titleView = search;
    
}

#pragma mark -返回
-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)findNearbyShop
{
    SLNearbyShopViewController *nearbyVC = [[SLNearbyShopViewController alloc] init];
    [self.navigationController pushViewController:nearbyVC animated:YES];

}



@end
