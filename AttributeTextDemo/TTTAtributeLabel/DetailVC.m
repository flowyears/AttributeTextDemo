//
//  DetailVC.m
//  AttributedLabelDemo
//
//  Created by boolean on 16/8/22.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "DetailVC.h"
#import "TTTLabelScrollView.h"


@interface DetailVC ()
@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    TTTLabelScrollView *scrollView = [[TTTLabelScrollView alloc] init];
    scrollView.backgroundColor = [UIColor greenColor];
    scrollView.scrollEnabled = YES;
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
