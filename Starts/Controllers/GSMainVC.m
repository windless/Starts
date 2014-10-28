//
//  MainVC.m
//  Starts
//
//  Created by Abner Zhong on 14/10/27.
//  Copyright (c) 2014年 abner.zhong.me. All rights reserved.
//

#import "GSMainVC.h"
#import "GSLoginVC.h"
#import "UIColor+hexColor.h"
#import "UIView+GSLayout.h"

@interface GSMainVC ()

@property(nonatomic, strong) GSLoginVC *loginVC;

@end

@implementation GSMainVC

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    _loginVC = [[GSLoginVC alloc] init];
  }
  return self;
}

- (void)loadView {
  self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (void)viewDidLoad {
  UIWindow *window = [UIApplication sharedApplication].keyWindow;

  [self.loginVC willMoveToParentViewController:self];
  [window addSubview:self.loginVC.view];
  [self.loginVC didMoveToParentViewController:self];

  self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
  self.navigationController.navigationBar.barTintColor =
      [UIColor hexColor:0x3097FF];

  self.title = @"GitHub Stars";

  UIImageView *profileView = [[UIImageView alloc] init];
  profileView.gsl_width = 24;
  profileView.gsl_height = 24;
  profileView.layer.cornerRadius = 12;
  profileView.backgroundColor = [UIColor hexColor:0xeeeeee];
  self.navigationItem.leftBarButtonItem =
      [[UIBarButtonItem alloc] initWithCustomView:profileView];
}

@end
