//
//  SLMePJHelpViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLMePJHelpViewController.h"
#import "SLUIFactory.h"
#import "SLGlobalDefine.h"

@interface SLMePJHelpViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *titleArr;
    
    NSArray *describeArr;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SLMePJHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"帮助";
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
    
    self.tableView.rowHeight = 100;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    titleArr = @[@"为什么不能进行评价？",@"如何修改评价？",@"评价可以修修改几次？",@"为什么没有修改评价的按钮？"];
    
    describeArr = @[@"为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？",
                    @"为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？",
                    @"为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？",
                    @"为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？为什么不能进行评价？"];
}

#pragma mark -返回
-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    cell.textLabel.text = titleArr[indexPath.row];
    
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.text = describeArr[indexPath.row];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    lable.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:lable];
    
    return cell;
}

@end
