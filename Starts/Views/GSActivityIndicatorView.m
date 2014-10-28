//
//  GSActivityIndicatorView.m
//  Starts
//
//  Created by Abner Zhong on 14/10/28.
//  Copyright (c) 2014年 abner.zhong.me. All rights reserved.
//

#import "GSActivityIndicatorView.h"

@implementation GSActivityIndicatorView

- (void)startRotation {
  CABasicAnimation *animation =
      [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
  animation.fromValue = 0;
  animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
  animation.duration = 3;
  animation.repeatCount = 10000;
  [self.layer addAnimation:animation forKey:@"rotation"];
}

- (void)stopRotation {
  [self.layer removeAnimationForKey:@"rotation"];
  [super stopAnimating];
}

@end
