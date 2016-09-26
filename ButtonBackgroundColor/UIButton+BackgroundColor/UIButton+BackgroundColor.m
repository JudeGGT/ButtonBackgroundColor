//
//  UIButton+BackgroundColor.m
//  test
//
//  Created by ggt on 16/9/25.
//  Copyright © 2016年 GGT. All rights reserved.
//

#import "UIButton+BackgroundColor.h"
#import <objc/runtime.h>

const char gp_addObserveredKey; /**< 添加观察者标志，用于移除已存在的观察者 */
const char gp_normalBackgroundColorKey; /**< 默认状态下的背景颜色 */
const char gp_highlightedBackgroundColorKey; /**< 高亮状态下的背景颜色 */

@implementation UIButton (BackgroundColor)

/**
 *  设置普通/高亮状态下的背景颜色
 *
 *  @param color 颜色
 *  @param state 按钮的状态
 */
- (void)gp_setBackgroundColor:(UIColor *)color forState:(GPButtonState)state {
    
    switch (state) {
        case GPButtonStateNormal:
            
            // 添加普通状态下的背景颜色属性
            objc_setAssociatedObject(self, &gp_normalBackgroundColorKey, color, OBJC_ASSOCIATION_RETAIN);
            [self setBackgroundColor:color];
            
            break;
        case GPButtonStateHighlighted:
            
            // 添加高亮状态下的背景颜色属性
            objc_setAssociatedObject(self, &gp_highlightedBackgroundColorKey, color, OBJC_ASSOCIATION_RETAIN);
            break;
    }
    
    // 判断是否已经存在同标志的观察者，如果存在移除
    if (objc_getAssociatedObject(self, &gp_addObserveredKey)) {
        [self removeObserver];
    }
    
    [self addobserver];
}

/**
 *  添加观察者
 */
- (void)addobserver {
    
    [self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:nil];
    
    // 设置属性标志值
    objc_setAssociatedObject(self, &gp_addObserveredKey, @YES, OBJC_ASSOCIATION_ASSIGN);
}

/**
 *  观察者响应方法
 *
 *  @param keyPath
 *  @param object
 *  @param change
 *  @param context
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"highlighted"]) {
        if (self.highlighted) {
            UIColor *highlightedColor = objc_getAssociatedObject(self, &gp_highlightedBackgroundColorKey);
            [self setBackgroundColor:highlightedColor];
            return;
        }
        UIColor *normalColor = objc_getAssociatedObject(self, &gp_normalBackgroundColorKey);
        [self setBackgroundColor:normalColor];
    }
}

/**
 *  移除观察者
 */
- (void)removeObserver {
    
    [self removeObserver:self forKeyPath:@"highlighted"];
    objc_setAssociatedObject(self, &gp_addObserveredKey, @NO, OBJC_ASSOCIATION_ASSIGN);
}

/**
 *  普通状态下的颜色
 *
 *  @return
 */
- (UIColor *)gp_normalBackgroundColor {
    
    return objc_getAssociatedObject(self, &gp_normalBackgroundColorKey);
}

/**
 *  高亮状态下的颜色
 *
 *  @return
 */
- (UIColor *)gp_highlightedBackgroundColor {
    
    return objc_getAssociatedObject(self, &gp_highlightedBackgroundColorKey);
}

- (void)dealloc {
    
    [self removeObserver];
}

@end
