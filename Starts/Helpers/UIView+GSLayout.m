//
//  UIView+GSLayout.m
//  Starts
//
//  Created by Abner Zhong on 14/10/28.
//  Copyright (c) 2014年 abner.zhong.me. All rights reserved.
//

#import "UIView+GSLayout.h"

@implementation UIView (GSLayout)

#pragma mark properties

- (CGFloat)gsl_width {
  return self.frame.size.width;
}

- (void)setGsl_width:(CGFloat)width {
  CGRect originRect = self.frame;
  self.frame = CGRectMake(originRect.origin.x, originRect.origin.y, width,
                          originRect.size.height);
}

- (CGFloat)gsl_height {
  return self.frame.size.height;
}

- (void)setGsl_height:(CGFloat)height {
  CGRect originRect = self.frame;
  self.frame = CGRectMake(originRect.origin.x, originRect.origin.y,
                          originRect.size.width, height);
}

- (CGFloat)gsl_top {
  return self.frame.origin.y;
}

- (void)setGsl_top:(CGFloat)top {
  CGRect originRect = self.frame;
  CGFloat height = originRect.size.height + (originRect.origin.y - top);
  if (height < 0) {
    height = 0;
  }
  self.frame =
      CGRectMake(originRect.origin.x, top, originRect.size.width, height);
}

- (CGFloat)gsl_bottom {
  return self.frame.origin.y + self.frame.size.height;
}

- (void)setGsl_bottom:(CGFloat)bottom {
  CGRect originRect = self.frame;
  self.frame = CGRectMake(originRect.origin.x, originRect.origin.y,
                          originRect.size.width, bottom - originRect.origin.y);
}

- (CGFloat)gsl_left {
  return self.frame.origin.x;
}

- (void)setGsl_left:(CGFloat)left {
  CGRect originFrame = self.frame;
  CGFloat width = originFrame.size.width + (originFrame.origin.x - left);
  if (width < 0) {
    width = 0;
  }

  self.frame =
      CGRectMake(left, originFrame.origin.y, width, originFrame.size.height);
}

- (CGFloat)gsl_right {
  return self.frame.origin.x + self.frame.size.width;
}

- (void)setGsl_right:(CGFloat)right {
  CGRect originFrame = self.frame;
  self.frame =
      CGRectMake(originFrame.origin.x, originFrame.origin.y,
                 right - originFrame.origin.x, originFrame.size.height);
}

- (CGFloat)gsl_centerX {
  return self.center.x;
}

- (void)setGsl_centerX:(CGFloat)centerX {
  self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)gsl_centerY {
  return self.center.y;
}

- (void)setGsl_centerY:(CGFloat)centerY {
  self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)gsl_originX {
  return self.frame.origin.x;
}

- (void)setGsl_originX:(CGFloat)originX {
  CGRect originFrame = self.frame;
  self.frame = CGRectMake(originX, originFrame.origin.y, originFrame.size.width,
                          originFrame.size.height);
}

- (CGFloat)gsl_originY {
  return self.frame.origin.y;
}

- (void)setGsl_originY:(CGFloat)originY {
  CGRect originFrame = self.frame;
  self.frame = CGRectMake(originFrame.origin.x, originY, originFrame.size.width,
                          originFrame.size.height);
}

#pragma mark layout methods

- (void)gsl_below:(UIView *)aboveView withOffset:(CGFloat)offset {
  self.frame = CGRectMake(self.gsl_left, aboveView.gsl_bottom + offset,
                          self.gsl_width, self.gsl_height);
}

- (void)gsl_above:(UIView *)belowView withOffset:(CGFloat)offset {
  self.frame =
      CGRectMake(self.gsl_left, belowView.gsl_top - self.gsl_height - offset,
                 self.gsl_width, self.gsl_height);
}

- (void)gsl_toLeft:(UIView *)rightView withOffset:(CGFloat)offset {
  self.frame = CGRectMake(rightView.gsl_left - self.gsl_width - offset,
                          self.gsl_top, self.gsl_width, self.gsl_height);
}

- (void)gsl_toRight:(UIView *)leftView withOffset:(CGFloat)offset {
  self.frame = CGRectMake(leftView.gsl_right + offset, self.gsl_top,
                          self.gsl_width, self.gsl_height);
}

- (void)gsl_insdie:(UIView *)parentView withPadding:(CGFloat)padding {
  self.frame = CGRectInset(parentView.bounds, padding, padding);
}

- (void)gsl_insdie:(UIView *)parentView withEdge:(UIEdgeInsets)edge {
  self.gsl_left = edge.left;
  self.gsl_top = edge.top;
  self.gsl_width = parentView.gsl_width - edge.left - edge.right;
  self.gsl_height = parentView.gsl_height - edge.top - edge.bottom;
}

- (void)gsl_horizontalCenterIn:(UIView *)parentView {
  self.gsl_centerX = parentView.bounds.size.width / 2;
}

- (void)gsl_verticalCenterIn:(UIView *)parentView {
  self.gsl_centerY = parentView.bounds.size.height / 2;
}

@end
