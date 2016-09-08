//
//  BaseAttributeVC.m
//  MyYYTextDemo
//
//  Created by boolean on 16/8/24.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "BaseAttributeVC.h"
#import <YYText.h>
#import <UIView+YYAdd.h>
#import <NSString+YYAdd.h>
#import "YYHiglightTextClickDelegate.h"
#import "AttributeScrollView.h"

@interface BaseAttributeVC ()<YYHiglightTextClickDelegate>

@end

@implementation BaseAttributeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    AttributeScrollView *scrollView = [[AttributeScrollView alloc] init];
    scrollView.clickDelegate = self;
    scrollView.backgroundColor = [UIColor greenColor];
    scrollView.scrollEnabled = YES;
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - YYHiglightTextClickDelegate
- (void)label:(YYLabel *)label
 tapHighlight:(YYTextHighlight *)highlight
      inRange:(NSRange)textRange
{
    NSDictionary *info = highlight.userInfo;
    LinkType linkType = [info[@"linkType"] integerValue];
    NSString *linkValue = info[@"linkValue"];
    switch (linkType) {
        case LinkTypeAt:
        {
            [AppUtility showMessage:[NSString stringWithFormat:@"选中at：%@",linkValue]];
        }
            break;
        case LinkTypeTopic:
        {
            [AppUtility showMessage:[NSString stringWithFormat:@"选中话题：%@",linkValue]];
        }
            break;
        case LinkTypeEmail:
        {
            [AppUtility showMessage:[NSString stringWithFormat:@"选中email：%@",linkValue]];
        }
            break;
        case LinkTypeURL:
        {
            [AppUtility showMessage:[NSString stringWithFormat:@"选中url：%@",linkValue]];
        }
            break;
        case LinkTypePhoneNum:
        {
            [AppUtility showMessage:[NSString stringWithFormat:@"选中phone：%@",linkValue]];
        }
            break;
        default:
            break;
    }
}

@end
