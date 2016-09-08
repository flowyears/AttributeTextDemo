//
//  YYTextViewVC.m
//  MyYYTextDemo
//
//  Created by boolean on 16/9/6.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "YYTextViewVC.h"
#import "YYTextViewView.h"
#import <YYText.h>
#import <UIView+YYAdd.h>

@interface YYTextViewVC ()<YYHiglightTextClickDelegate>

@end

@implementation YYTextViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(done)];
    
    YYTextViewView *scrollView = [[YYTextViewView alloc] initWithFrame:self.view.bounds];
    scrollView.clickDelegate = self;
    scrollView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scrollView];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)done
{
    [self.view endEditing:YES];
}
#pragma mark - YYHiglightTextClickDelegate
- (void)label:(YYTextViewVC *)label
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
