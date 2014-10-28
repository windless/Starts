//
//  LoginLayout.h
//  Starts
//
//  Created by Abner Zhong on 14/10/28.
//  Copyright (c) 2014年 abner.zhong.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol GSLoginLayoutDelegat<NSObject>

- (void)startLoging;
- (void)onDismiss;

@end

@interface GSLoginLayout : NSObject<UITextFieldDelegate>

@property(nonatomic, strong) UIView *view;
@property(nonatomic, weak) id<GSLoginLayoutDelegat> delegate;

- (void)showLoginForm;
- (void)showProfile;
- (void)dismiss;
- (void)setLoging;
- (void)showErrorMessage:(NSString *)message;

@end
