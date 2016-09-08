//
//  YYTextViewScrollView.h
//  MyYYTextDemo
//
//  Created by boolean on 16/9/6.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYHiglightTextClickDelegate.h"

@interface YYTextViewScrollView : UIScrollView
@property(nonatomic,weak)id<YYHiglightTextClickDelegate> clickDelegate;

@end
