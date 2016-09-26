//
//  UIButton+BackgroundColor.h
//  test
//
//  Created by ggt on 16/9/25.
//  Copyright © 2016年 GGT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSUInteger, GPButtonState) {
    GPButtonStateNormal,
    GPButtonStateHighlighted
};

@interface UIButton (BackgroundColor)

@property (nonatomic, retain, readonly) UIColor *gp_normalBackgroundColor; /**< 普通状态颜色 */
@property (nonatomic, retain, readonly) UIColor *gp_highlightedBackgroundColor; /**< 高亮状态颜色 */

/**
 *  设置普通/高亮状态下的背景颜色
 *
 *  @param color 颜色
 *  @param state 按钮的状态
 */
- (void)gp_setBackgroundColor:(UIColor *)color forState:(GPButtonState)state;


/**
 *  移除观察者
 */
- (void)removeObserver;

@end
