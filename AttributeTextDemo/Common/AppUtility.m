//
//  AppUtility.m
//  MyYYTextDemo
//
//  Created by boolean on 16/8/29.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "AppUtility.h"
#import <YYLabel.h>
#import <UIView+YYAdd.h>
#import <NSString+YYAdd.h>
#import "AppDelegate.h"

@implementation AppUtility
+ (void)showMessage:(NSString *)msg
{
    
    UIApplication *application = [UIApplication sharedApplication];
    AppDelegate *delegate = (AppDelegate *)application.delegate;
    UIWindow *window = delegate.window;
    
    CGFloat padding = 10;
    
    YYLabel *label = [YYLabel new];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:0.730];
    label.width = window.width;
    label.textContainerInset = UIEdgeInsetsMake(padding, padding, padding, padding);
    label.height = [msg heightForFont:label.font width:label.width] + 2 * padding;
    
    label.bottom = 64;
    [window addSubview:label];
    [UIView animateWithDuration:0.3 animations:^{
        label.top = 64;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            label.bottom = 64;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}




@end
