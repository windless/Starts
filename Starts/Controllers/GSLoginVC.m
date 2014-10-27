//
//  LoginVC.m
//  Starts
//
//  Created by Abner Zhong on 14/10/27.
//  Copyright (c) 2014年 abner.zhong.me. All rights reserved.
//

#import "GSLoginVC.h"
#import "UIColor+hexColor.h"

@interface GSLoginVC ()
@property(nonatomic, strong) UILabel *logoLabel;
@property(nonatomic, strong) UIView *loginForm;
@end

@implementation GSLoginVC

- (void)loadView {
  self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.view.backgroundColor = [UIColor hexColor:0x3097FF];
}

- (void)viewWillAppear:(BOOL)animated {
  dispatch_after(
      dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)),
      dispatch_get_main_queue(), ^{ [self dismiss]; });
}

- (void)dismiss {
  [UIView animateWithDuration:1
      animations:^{ self.view.alpha = 0; }
      completion:^(BOOL finished) {
          [self willMoveToParentViewController:nil];
          [self.view removeFromSuperview];
          [self didMoveToParentViewController:nil];
          [self removeFromParentViewController];
      }];
}

@end
