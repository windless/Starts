//
//  UIView+GSLayout.h
//  Starts
//
//  Created by Abner Zhong on 14/10/28.
//  Copyright (c) 2014年 abner.zhong.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GSLayout)

@property(nonatomic, assign) CGFloat gsl_width;
@property(nonatomic, assign) CGFloat gsl_height;
@property(nonatomic, assign) CGFloat gsl_top;
@property(nonatomic, assign) CGFloat gsl_left;
@property(nonatomic, assign) CGFloat gsl_right;
@property(nonatomic, assign) CGFloat gsl_bottom;
@property(nonatomic, assign) CGFloat gsl_centerX;
@property(nonatomic, assign) CGFloat gsl_centerY;
@property(nonatomic, assign) CGFloat gsl_originX;
@property(nonatomic, assign) CGFloat gsl_originY;

- (void)gsl_below:(UIView *)aboveView withOffset:(CGFloat)offset;
- (void)gsl_above:(UIView *)belowView withOffset:(CGFloat)offset;
- (void)gsl_toLeft:(UIView *)rightView withOffset:(CGFloat)offset;
- (void)gsl_toRight:(UIView *)leftView withOffset:(CGFloat)offset;
- (void)gsl_insdie:(UIView *)parentView withPadding:(CGFloat)padding;
- (void)gsl_insdie:(UIView *)parentView withEdge:(UIEdgeInsets)edge;
- (void)gsl_horizontalCenterIn:(UIView *)parentView;
- (void)gsl_verticalCenterIn:(UIView *)parentView;

@end
