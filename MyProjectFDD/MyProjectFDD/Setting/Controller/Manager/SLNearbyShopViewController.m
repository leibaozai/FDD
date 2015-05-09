//
//  SLNearbyShopViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLNearbyShopViewController.h"
#import "SLUIFactory.h"


@interface SLNearbyShopViewController ()

@end

@implementation SLNearbyShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"附近门店";
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
    
    self.navigationItem.rightBarButtonItem = [SLUIFactory createImageBBIWithImage:[UIImage imageNamed:@"xzxq-dd"] target:self action:@selector(positionClick)];
}

#pragma mark -返回

-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -定位

-(void)positionClick
{
    
}




@end
