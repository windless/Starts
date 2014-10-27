//
//  AppDelegate.m
//  Starts
//
//  Created by Abner Zhong on 14/10/27.
//  Copyright (c) 2014年 abner.zhong.me. All rights reserved.
//

#import "AppDelegate.h"
#import "GSMainVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.window.backgroundColor = [UIColor whiteColor];
  GSMainVC *mainVC = [[GSMainVC alloc] init];
  UINavigationController *navController =
      [[UINavigationController alloc] initWithRootViewController:mainVC];
  self.window.rootViewController = navController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
