//
//  UIWindow+RootViewController.m
//  TensWeiBo
//
//  Created by gh on 15-10-7.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "UIWindow+RootViewController.h"

@implementation UIWindow (RootViewController)

- (void)setWindowRootViewController{

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NSString *oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"version"];
    
    NSDictionary *infoDictionary = [NSBundle mainBundle].infoDictionary;
    NSString *version = infoDictionary[@"CFBundleVersion"];
    
    if ([oldVersion isEqualToString:version]) {
        
        self.rootViewController = [storyboard instantiateInitialViewController];
    } else {
    
        self.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"WelcomePageController"];
        
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:@"version"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

}

@end
