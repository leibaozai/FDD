//
//  SLUIFactory.h
//  MyProjectFDD
//
//  Created by mac on 15-5-5.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 UI的工厂类，可以快速创建一些通用的UI控件
 */
@interface SLUIFactory : NSObject

/**
 创建调整位置的BBI
 */
+ (UIBarButtonItem *)createSpaceBBIWithWidth:(CGFloat)width;

/**
 创建只有标题的BBI
 */
+ (UIBarButtonItem *)createTitleBBIWithTitle:(NSString *)title target:(id)target action:(SEL)selector;

/**
 创建只有图片的BBI
 */
+(UIBarButtonItem *)createImageBBIWithImage:(UIImage *)image target:(id)target action:(SEL)selector;

/**
 创建返回的BBI
 */
+ (UIBarButtonItem *)createBackBBIWithTarget:(id)target action:(SEL)selector;

/**
 创建返回的BBI数组
 */
+ (NSArray *)createBackBBIArrayWithTarget:(id)target action:(SEL)selector;


@end
