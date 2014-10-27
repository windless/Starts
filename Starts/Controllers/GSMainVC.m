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
}

@end
