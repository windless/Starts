//
//  UIColor+hexColor.h
//  Starts
//
//  Created by Abner Zhong on 14/10/27.
//  Copyright (c) 2014年 abner.zhong.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (hexColor)

+ (UIColor *)hexColor:(int)hex;
+ (UIColor *)hexColor:(int)hex alpha:(CGFloat)alpha;

@end
