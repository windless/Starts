//
//  LoginLayout.m
//  Starts
//
//  Created by Abner Zhong on 14/10/28.
//  Copyright (c) 2014年 abner.zhong.me. All rights reserved.
//

#import "GSLoginLayout.h"
#import "GSActivityIndicatorView.h"
#import "UIView+GSLayout.h"
#import "UIColor+hexColor.h"
#import <TKRoundedView.h>

@interface GSLoginLayout ()

@property(nonatomic, strong) UILabel *logoLabel;
@property(nonatomic, strong) UIView *loginForm;
@property(nonatomic, strong) UILabel *noticeLabel;
@property(nonatomic, strong) UITextField *usernameField;
@property(nonatomic, strong) UITextField *passwordField;
@property(nonatomic, strong) UIActivityIndicatorView *loginIndicatorView;
@property(nonatomic, strong) UILabel *errorMessageLabel;
@property(nonatomic, strong) UIImageView *gravatarView;
@property(nonatomic, strong) UILabel *usernameLabel;
@property(nonatomic, strong) GSActivityIndicatorView *profileLoadingView;

@end

@implementation GSLoginLayout

- (UIView *)view {
  if (!_view) {
    _view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _view.backgroundColor = [UIColor hexColor:0x0397FF];
    [self layoutLogoLabel:_view];
    [self layoutLoginForm:_view];
    [self layoutProfileView:_view];
  }
  return _view;
}

#pragma mark actions

- (void)showLoginForm {
  [UIView animateWithDuration:1
      animations:^{
          self.logoLabel.frame = CGRectOffset(self.logoLabel.frame, 0, -80);
      }
      completion:^(BOOL finished) {
          [UIView animateWithDuration:1
                           animations:^{ self.loginForm.alpha = 1; }];
      }];
}

- (void)showProfile {
  [self.loginIndicatorView stopAnimating];
  [self.profileLoadingView startRotation];

  [UIView animateWithDuration:1
      animations:^{
          self.loginForm.alpha = 0;
          self.profileLoadingView.alpha = 1;
          self.gravatarView.alpha = 1;
      }
      completion:^(BOOL finished){

      }];
}

- (void)dismiss {
  self.profileLoadingView.hidden = YES;
  [self.profileLoadingView stopRotation];

  [UIView animateWithDuration:1
      animations:^{
          self.gravatarView.transform =
              CGAffineTransformMakeScale(24.0 / 120.0, 24.0 / 120.0);
          self.gravatarView.gsl_centerX = 28;
          self.gravatarView.gsl_centerY = 42;
          self.logoLabel.transform =
              CGAffineTransformMakeScale(17.0 / 36.0, 17.0 / 36.0);
          self.logoLabel.gsl_centerY = 20 + 44.0 / 2;
          self.view.gsl_height = 64;
      }
      completion:^(BOOL finished) {
          [UIView animateWithDuration:0.5
              animations:^{ self.view.alpha = 0; }
              completion:^(BOOL finished) {
                  if (self.delegate) {
                    [self.delegate onDismiss];
                  }
              }];
      }];
}

- (void)setLoging {
}

- (void)showErrorMessage:(NSString *)message {
}

- (void)login {
  NSString *username = self.usernameField.text;
  NSString *password = self.passwordField.text;

  NSLog(@"username: %@", username);

  if (!username || username.length == 0) {
    self.errorMessageLabel.text = @"请输入 GitHub 用户名";
    self.errorMessageLabel.hidden = NO;
    return;
  }

  if (!password || password.length == 0) {
    self.errorMessageLabel.text = @"请输入 GitHub 密码";
    self.errorMessageLabel.hidden = NO;
    return;
  }

  self.errorMessageLabel.hidden = YES;
  [self.loginIndicatorView startAnimating];
  self.usernameField.enabled = NO;
  self.passwordField.enabled = NO;

  if (self.delegate) {
    [self.delegate startLoging];
  }
}

#pragma mark layout

- (void)layoutLogoLabel:(UIView *)rootView {
  UILabel *label = [[UILabel alloc] init];
  label.text = @"GitHub Stars";
  label.textColor = [UIColor whiteColor];
  label.font = [UIFont boldSystemFontOfSize:36];
  [label sizeToFit];
  [rootView addSubview:label];
  [label gsl_horizontalCenterIn:rootView];
  label.frame = CGRectOffset(label.frame, 0, 140);

  self.logoLabel = label;
}

- (void)layoutLoginForm:(UIView *)rootView {
  UIView *loginForm = [[UIView alloc] init];
  loginForm.frame = CGRectInset(rootView.frame, 30, 120);
  loginForm.alpha = 0;
  [rootView addSubview:loginForm];
  self.loginForm = loginForm;

  UILabel *noticeLabel = [[UILabel alloc] init];
  noticeLabel.text = @"请输入 GitHub 的用户名和密码";
  noticeLabel.font = [UIFont systemFontOfSize:14];
  noticeLabel.textColor = [UIColor whiteColor];
  noticeLabel.textAlignment = NSTextAlignmentCenter;
  [noticeLabel sizeToFit];
  noticeLabel.gsl_width = loginForm.gsl_width;
  [loginForm addSubview:noticeLabel];
  self.noticeLabel = noticeLabel;

  TKRoundedView *usernameContainer = [[TKRoundedView alloc] init];
  usernameContainer.roundedCorners =
      TKRoundedCornerTopLeft | TKRoundedCornerTopRight;
  usernameContainer.cornerRadius = 4;
  usernameContainer.fillColor = [UIColor whiteColor];
  usernameContainer.borderColor = [UIColor hexColor:0xeeeeee];
  usernameContainer.gsl_width = loginForm.gsl_width;
  usernameContainer.gsl_height = 40;
  [usernameContainer gsl_below:noticeLabel withOffset:10];
  [usernameContainer gsl_horizontalCenterIn:loginForm];
  [loginForm addSubview:usernameContainer];

  UITextField *usernameField = [[UITextField alloc] init];
  [usernameContainer addSubview:usernameField];
  usernameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
  usernameField.clearButtonMode = UITextFieldViewModeWhileEditing;
  usernameField.font = [UIFont systemFontOfSize:12];
  usernameField.placeholder = @"USERNAME";
  usernameField.delegate = self;
  usernameField.returnKeyType = UIReturnKeyNext;
  [usernameField gsl_insdie:usernameContainer
                   withEdge:UIEdgeInsetsMake(1, 10, 1, 5)];
  self.usernameField = usernameField;

  TKRoundedView *passwordContainer = [[TKRoundedView alloc] init];
  passwordContainer.roundedCorners =
      TKRoundedCornerBottomLeft | TKRoundedCornerBottomRight;
  passwordContainer.cornerRadius = 4;
  passwordContainer.fillColor = [UIColor whiteColor];
  passwordContainer.borderColor = [UIColor hexColor:0xeeeeee];
  passwordContainer.gsl_width = loginForm.gsl_width;
  passwordContainer.gsl_height = 40;
  [passwordContainer gsl_horizontalCenterIn:loginForm];
  [passwordContainer gsl_below:usernameContainer withOffset:-1];
  [loginForm addSubview:passwordContainer];

  UITextField *passwordField = [[UITextField alloc] init];
  [passwordContainer addSubview:passwordField];
  passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
  passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
  passwordField.font = [UIFont systemFontOfSize:12];
  passwordField.placeholder = @"PASSWORD";
  passwordField.secureTextEntry = YES;
  passwordField.returnKeyType = UIReturnKeyGo;
  passwordField.delegate = self;
  [passwordField gsl_insdie:passwordContainer
                   withEdge:UIEdgeInsetsMake(1, 10, 1, 5)];
  self.passwordField = passwordField;

  UIActivityIndicatorView *loginIndicatorView =
      [[UIActivityIndicatorView alloc] init];
  loginIndicatorView.gsl_width = 40;
  loginIndicatorView.gsl_height = 40;
  [loginIndicatorView gsl_below:passwordContainer withOffset:10];
  [loginIndicatorView gsl_horizontalCenterIn:loginForm];
  [loginForm addSubview:loginIndicatorView];
  self.loginIndicatorView = loginIndicatorView;

  UILabel *errorMessageLabel = [[UILabel alloc] init];
  errorMessageLabel.font = [UIFont systemFontOfSize:13];
  errorMessageLabel.gsl_width = loginForm.gsl_width;
  errorMessageLabel.gsl_height = 20;
  [errorMessageLabel gsl_horizontalCenterIn:loginForm];
  errorMessageLabel.textColor = [UIColor redColor];
  [errorMessageLabel gsl_below:passwordContainer withOffset:4];
  [loginForm addSubview:errorMessageLabel];
  self.errorMessageLabel = errorMessageLabel;
}

- (void)layoutProfileView:(UIView *)rootView {
  GSActivityIndicatorView *loadingView = [[GSActivityIndicatorView alloc] init];
  loadingView.image = [UIImage imageNamed:@"profile_loading"];
  loadingView.gsl_top = 120;
  loadingView.gsl_width = 160;
  loadingView.gsl_height = 160;
  loadingView.alpha = 0;
  [loadingView gsl_horizontalCenterIn:rootView];
  [rootView addSubview:loadingView];
  self.profileLoadingView = loadingView;

  UIImageView *gravatarView = [[UIImageView alloc] init];
  gravatarView.gsl_width = 120;
  gravatarView.gsl_height = 120;
  gravatarView.backgroundColor = [UIColor hexColor:0xeeeeee];
  gravatarView.center = loadingView.center;
  gravatarView.layer.cornerRadius = 60;
  gravatarView.alpha = 0;
  [rootView addSubview:gravatarView];
  self.gravatarView = gravatarView;
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  if (textField == self.usernameField) {
    [self.passwordField becomeFirstResponder];
  } else {
    [self login];
  }
  return [textField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
  self.errorMessageLabel.hidden = YES;
}

@end
