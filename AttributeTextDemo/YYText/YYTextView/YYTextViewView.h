//
//  YYTextViewView.h
//  MyYYTextDemo
//
//  Created by boolean on 16/9/7.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYHiglightTextClickDelegate.h"

@interface YYTextViewView : UIView
@property(nonatomic,weak)id<YYHiglightTextClickDelegate> clickDelegate;

@end
