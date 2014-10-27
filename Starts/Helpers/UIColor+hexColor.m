//
//  UIColor+hexColor.m
//  Starts
//
//  Created by Abner Zhong on 14/10/27.
//  Copyright (c) 2014年 abner.zhong.me. All rights reserved.
//

#import "UIColor+hexColor.h"

@implementation UIColor (hexColor)

+ (UIColor *)hexColor:(int)hex {
  return [self hexColor:hex alpha:1.0f];
}

+ (UIColor *)hexColor:(int)hex alpha:(CGFloat)alpha {
  return [UIColor colorWithRed:((hex & 0xFF0000) >> 16) / 255.0
                         green:((hex & 0x00FF00) >> 8) / 255.0
                          blue:((hex & 0xFF) >> 0) / 255.0
                         alpha:alpha];
}

@end
