//
//  AttributeScrollView.h
//  MyYYTextDemo
//
//  Created by boolean on 16/8/29.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYHiglightTextClickDelegate.h"
@interface AttributeScrollView : UIScrollView
@property(nonatomic,weak)id<YYHiglightTextClickDelegate> clickDelegate;

@end
