//
//  SLValuationViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLValuationViewController.h"
#import "SLStartSellHouseViewController.h"
#import "SLUIFactory.h"

@interface SLValuationViewController ()

@end

@implementation SLValuationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"估价";
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
    
}

#pragma mark - 返回

-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}


//添加估计房源
- (IBAction)addValuationHouse:(id)sender {
    
    SLStartSellHouseViewController *startVC = [[SLStartSellHouseViewController alloc] init];
    [self.navigationController pushViewController:startVC animated:YES];
}



@end
