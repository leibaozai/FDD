//
//  SLNextButtonClickViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-8.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLNextButtonClickViewController.h"
#import "SLUIFactory.h"
#import "SLPreViewController.h"
#import "SLNextHeaderView.h"

#import "SLGlobalDefine.h"


@interface SLNextButtonClickViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    SLNextHeaderView *headerView;
}
@end

@implementation SLNextButtonClickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"发布房源";
    
    [self addBlackAndPreViewButton];
    
    self.tableView.autoresizesSubviews = NO;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    // 加载头部xib
    headerView = [[NSBundle mainBundle] loadNibNamed:@"SLNextHeaderView" owner:self options:nil][0];
    
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 300);
    
    self.tableView.tableHeaderView = headerView;
    
    
    
}

//添加返回和预览按钮
-(void)addBlackAndPreViewButton
{
    //返回按钮
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
    
    //预览按钮
    self.navigationItem.rightBarButtonItem = [SLUIFactory createTitleBBIWithTitle:@"预览" target:self action:@selector(previewClick)];
}


//返回
-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}


//点击预览
-(void)previewClick
{
    SLPreViewController *preView = [[SLPreViewController alloc] init];
    [self.navigationController pushViewController:preView animated:YES];
}


#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}



@end
