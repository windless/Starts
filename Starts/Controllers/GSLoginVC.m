//
//  LoginVC.m
//  Starts
//
//  Created by Abner Zhong on 14/10/27.
//  Copyright (c) 2014年 abner.zhong.me. All rights reserved.
//

#import "GSLoginVC.h"
#import "UIColor+hexColor.h"
#import <TKRoundedView.h>
#import "UIColor+hexColor.h"
#import "UIView+GSLayout.h"
#import "GSActivityIndicatorView.h"
#import "GSLoginLayout.h"

@interface GSLoginVC ()

@property(nonatomic, strong) GSLoginLayout *loginLayout;

@end

@implementation GSLoginVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    _loginLayout = [[GSLoginLayout alloc] init];
    _loginLayout.delegate = self;
  }
  return self;
}

- (void)loadView {
  self.view = self.loginLayout.view;
}

- (void)viewWillAppear:(BOOL)animated {
  dispatch_after(
      dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)),
      dispatch_get_main_queue(), ^{ [self.loginLayout showLoginForm]; });
}

#pragma mark LoginLayoutDelegate

- (void)startLoging {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)),
                 dispatch_get_main_queue(), ^{
      [self.loginLayout showProfile];
      dispatch_after(
          dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)),
          dispatch_get_main_queue(), ^{ [self.loginLayout dismiss]; });
  });
}

- (void)onDismiss {
  [self willMoveToParentViewController:nil];
  [self.view removeFromSuperview];
  [self didMoveToParentViewController:nil];
  [self removeFromParentViewController];
}

@end
