//
//  UIView+Extension.h
//  OCProjectCreat
//
//  Created by yueru on 2017/5/10.
//  Copyright © 2017年 赵攀. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/** 大小 */
@property (nonatomic, assign) CGSize size;
/** 宽度 */
@property (nonatomic, assign) CGFloat width;
/** 高度 */
@property (nonatomic, assign) CGFloat height;
/** x */
@property (nonatomic, assign) CGFloat x;
/** y */
@property (nonatomic, assign) CGFloat y;
/** 中心点x */
@property (nonatomic, assign) CGFloat centerX;
/** 中心点y */
@property (nonatomic, assign) CGFloat centerY;

/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)isShowingOnKeyWindow;

//- (CGFloat)x;
//- (void)setX:(CGFloat)x;
/** 在分类中声明@property, 只会生成方法的声明, 不会生成方法的实现和带有_下划线的成员变量*/

+ (instancetype)viewFromXib;

@end
