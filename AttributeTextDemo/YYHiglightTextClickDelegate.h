//
//  YYHiglightTextClickDelegate.h
//  MyYYTextDemo
//
//  Created by boolean on 16/8/29.
//  Copyright © 2016年 boolean. All rights reserved.
//

#ifndef YYHiglightTextClickDelegate_h
#define YYHiglightTextClickDelegate_h
@class YYLabel;
@class YYTextHighlight;


@protocol YYHiglightTextClickDelegate <NSObject>

- (void)label:(UIView *)label
 tapHighlight:(YYTextHighlight *)highlight
      inRange:(NSRange)textRange;

@end

#endif /* YYHiglightTextClickDelegate_h */
