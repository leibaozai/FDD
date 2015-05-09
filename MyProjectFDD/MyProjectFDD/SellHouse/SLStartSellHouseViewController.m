//
//  SLStartSellHouseViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLStartSellHouseViewController.h"
#import "SLUIFactory.h"
#import "SLGlobalDefine.h"
#import "SLStartSellVillageNameView.h"

#import "SLNextButtonClickViewController.h"

@interface SLStartSellHouseViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
{

    //城市按钮是否点击
    BOOL isCityButtonClick;
    
    //城市详情View
    UIView *cityListView;
    
    //记录选中的城市
    NSInteger clickIndex;
    
    //城市数据
    NSArray *cityArr;
    
    //户型上半部
    UIView *upView;
    
    //户型下半部
    UIView *downView;
    
    //保存户型
    NSString *villageTypeStr;
    
    NSInteger shi;
    NSInteger ting;
    NSInteger wei;
}

//保存下一步按钮的底部约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nextButtonConstraint;

@end

@implementation SLStartSellHouseViewController

//移除通知
-(void)dealloc
{
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 键盘弹起的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    self.title = @"发布房源";
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
    
    //初始化城市列表
    [self initCityListView];
}

#pragma mark -键盘弹起
- (void)keyboardWillShow:(NSNotification *)notification
{
    CGFloat keyboardHeight = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.nextButtonConstraint.constant = keyboardHeight;
        [self.view layoutIfNeeded];
    }];
}

#pragma mark -键盘消失
- (void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.25 animations:^{
        self.nextButtonConstraint.constant = 0;
    }];
}

//取消键盘编辑
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - Helper Methods

//初始化城市列表
-(void)initCityListView
{
    //获取按钮最大Y值
    CGFloat cityButtonBottom = CGRectGetMaxY(self.cityButton.frame);
    //NSLog(@"%f",cityButtonBottom);
    
    cityListView = [[UIView alloc] initWithFrame:CGRectMake(0, cityButtonBottom, SCREEN_WIDTH, 0)];
    cityListView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cityListView];
    
    //剪切超过父视图的区域
    cityListView.clipsToBounds = YES;
    
    //按钮高度
    CGFloat btnHeight = CGRectGetHeight(self.cityButton.frame);
    //NSLog(@"height%f",btnHeight);
    
    //按钮宽度
    CGFloat btnWidth = SCREEN_WIDTH / 5;
    
    //城市数据
    cityArr = @[@"北京",@"成都",@"重庆",@"广州",@"杭州",@"南京",@"上海",@"深圳",@"苏州",@"天津",@"白山"];
    
    //添加按钮
    for (int i = 0; i < cityArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnWidth * (i%5), btnHeight * (i/5), btnWidth, btnHeight);
        btn.tag = i + 1;
        btn.titleLabel.textAlignment = NSTextAlignmentRight;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:cityArr[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(cityListButtonClick:) forControlEvents:UIControlEventTouchUpInside];

        [cityListView addSubview:btn];
        
        if(i/5){
            UILabel *lineLable = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMinY(btn.frame), SCREEN_WIDTH - 20, 1)];
            lineLable.backgroundColor = [UIColor lightGrayColor];
            [cityListView addSubview:lineLable];
        }
    }
}


//获取选择户型
-(void)initVillageType
{
    //上半部灰色
    upView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-216-44)];
    upView.backgroundColor = [UIColor lightGrayColor];
    upView.alpha = 0.8;
    upView.clipsToBounds = YES;
    //增加手势
    upView.userInteractionEnabled = YES;
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideVillageTypeView)];
    [upView addGestureRecognizer:ges];
    
    
    [self.navigationController.view addSubview:upView];
    
    downView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-216-44, SCREEN_WIDTH, 216+44)];
    downView.backgroundColor = [UIColor whiteColor];
    downView.clipsToBounds = YES;
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    toolBar.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *lefttem=[[UIBarButtonItem alloc] initWithTitle:@"设置户型" style:UIBarButtonItemStyleDone target:self action:nil];
    
    UIBarButtonItem *centerSpace=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *right=[[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneClick)];
    toolBar.items=@[lefttem,centerSpace,right];
    [downView addSubview:toolBar];
    
    //选择器
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 216)];
    pickerView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    
    [downView addSubview:pickerView];
    [self.navigationController.view addSubview:downView];
}

#pragma mark - 返回

-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Event Handlers

//点击城市按钮
- (IBAction)cityButtonClick:(id)sender {
    
    isCityButtonClick = !isCityButtonClick;
    
    //隐藏显示
    [self animationHideOrShowListView:isCityButtonClick];
}

//隐藏或者显示城市按钮
- (void)animationHideOrShowListView:(BOOL)isCityButtonClick
{
    CGRect frame = cityListView.frame;
    
    if (isCityButtonClick) {
        frame.size.height = self.view.frame.size.height - 64;
    }else{
        frame.size.height = 0;
    }
    
    [UIView animateWithDuration:0.1 animations:^{
        cityListView.frame = frame;
    }];
}

//隐藏户型视图
-(void)hideVillageTypeView
{
    CGRect frameUp = upView.frame;
    frameUp.size.height = 0;
    
    CGRect frameDown = downView.frame;
    frameDown.size.height = 0;
    
    [UIView animateWithDuration:0.1 animations:^{
        upView.frame = frameUp;
        downView.frame = frameDown;
    }];
}


//城市列表按钮点击
-(void)cityListButtonClick:(UIButton *)button
{
    //记录选中的
    clickIndex = button.tag - 1;
    
    [self.cityButton setTitle:cityArr[clickIndex] forState:UIControlStateNormal];
    isCityButtonClick = NO;
    [self animationHideOrShowListView:isCityButtonClick];
}



//点击小区名称按钮
- (IBAction)villageNameButtonClick:(id)sender {
    
    SLStartSellVillageNameView *villageVC = [[SLStartSellVillageNameView alloc] init];
    villageVC.hidesBottomBarWhenPushed = YES;
    
    villageVC.titleStr = self.cityButton.titleLabel.text;
    [self.navigationController pushViewController:villageVC animated:YES];
}

//点击户型
- (IBAction)typeButtonClick:(id)sender {
    
    [self initVillageType];
    
}


//点击下一步
- (IBAction)nextButtonClick:(id)sender {
    
    SLNextButtonClickViewController *nextVC = [[SLNextButtonClickViewController alloc] init];
    
    [self.navigationController pushViewController:nextVC animated:YES];
    
}

#pragma mark -UIPickerViewdataSource

//组
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

//每组有多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return 8;
    }else if(component == 1){
        return 7;
    }
    return 7;
}

//每行的title
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [NSString stringWithFormat:@"%ld室",row+1];
    }else if (component == 1){
        return [NSString stringWithFormat:@"%ld厅",row];
    }
    return [NSString stringWithFormat:@"%ld卫",row];
}

//选中完成
-(void)doneClick
{
    if (![self.typeButton.titleLabel.text isEqualToString:@""]) {
        [self.typeButton setTitle:villageTypeStr forState:UIControlStateNormal];
    }else
    {
        [self.typeButton setTitle:@"选择户型" forState:UIControlStateNormal];
    }

    [self hideVillageTypeView];
}


//选中了某行
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    if (component == 0) {
        
        shi = row+1;
    }
    
    if (component == 1){
        
        ting = row;
    }
    
    if (component == 2) {
        
        wei = row;
    }
    
//    NSLog(@"component:%ld row :%ld",component,row);
//    NSLog(@"shi:%ld ting :%ld wei:%ld",shi,ting,wei);
    
    villageTypeStr = nil;
    villageTypeStr = [NSString stringWithFormat:@"%ld室%ld厅%ld卫",shi,ting,wei];
    
}



@end
