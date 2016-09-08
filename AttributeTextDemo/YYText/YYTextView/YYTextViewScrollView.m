//
//  YYTextViewScrollView.m
//  MyYYTextDemo
//
//  Created by boolean on 16/9/6.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "YYTextViewScrollView.h"
#import <YYText.h>
#import <UIView+YYAdd.h>
#import <NSString+YYAdd.h>
#import <UIImage+YYAdd.h>
#import <NSBundle+YYAdd.h>
#import <YYImage.h>

@interface YYTextViewScrollView ()<YYTextViewDelegate>

@end

@implementation YYTextViewScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addUI];
    }
    return self;
}

- (void)addUI
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:DaoXiang];
    [text yy_setFont:[UIFont systemFontOfSize:20] range:text.yy_rangeOfAll];
    text.yy_lineSpacing = 20;
    
    
    {
        NSRange range0 = [[text string] rangeOfString:@"对这个世界如果你有太多的抱怨" options:NSCaseInsensitiveSearch];
        //字体
        [text yy_setFont:[UIFont systemFontOfSize:25] range:range0];
        //文字颜色
        [text yy_setColor:[UIColor purpleColor] range:range0];
        //文字间距
        [text yy_setKern:@(2) range:range0];
        //??未生效
        //[text yy_setBackgroundColor:[UIColor yellowColor] range:range0];
        //[text yy_setAttribute:YYTextBackgroundBorderAttributeName value:[UIColor greenColor] range:range0];
    }
    
    {
        NSRange range1 = [[text string] rangeOfString:@"跌倒了 就不敢继续往前走" options:NSCaseInsensitiveSearch];
        //文字描边（空心字）默认黑色，必须设置width
        [text yy_setStrokeColor:[UIColor orangeColor] range:range1];
        [text yy_setStrokeWidth:@(2) range:range1];
    }
    
    {
        NSRange range2 = [[text string] rangeOfString:@"为什麼 人要这麼的脆弱 堕落" options:NSCaseInsensitiveSearch];
        
        YYTextDecoration *decoration = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle
                                                                       width:@(1)
                                                                       color:[UIColor blueColor]];
        //删除样式
        [text yy_setTextStrikethrough:decoration range:range2];
        //下划线
        [text yy_setTextUnderline:decoration range:range2];
    }
    
    {
        NSRange range3 = [[text string] rangeOfString:@"请你打开电视看看 多少人" options:NSCaseInsensitiveSearch];
        
        //边框
        YYTextBorder *border = [YYTextBorder new];
        border.strokeColor = [UIColor colorWithRed:1.000 green:0.029 blue:0.651 alpha:1.000];
        border.strokeWidth = 3;
        border.lineStyle = YYTextLineStylePatternCircleDot;
        border.cornerRadius = 3;
        border.insets = UIEdgeInsetsMake(0, -2, 0, -2);
        
        [text yy_setTextBorder:border range:range3];
    }
    
    {
        NSRange range4 = [[text string] rangeOfString:@"为生命在努力勇敢的走下去" options:NSCaseInsensitiveSearch];
        
        //阴影
        NSShadow *shadow = [[NSShadow alloc] init];
        [shadow setShadowColor:[UIColor redColor]];
        [shadow setShadowBlurRadius:1.0];
        [shadow setShadowOffset:CGSizeMake(2, 2)];
        [text yy_setShadow:shadow range:range4];
    }
    
    {
        NSRange range5 = [[text string] rangeOfString:@"我们是不是该知足" options:NSCaseInsensitiveSearch];
        
        //文本内阴影
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor redColor];
        shadow.offset = CGSizeMake(0, 2);
        shadow.radius = 1;
        [text yy_setTextInnerShadow:shadow range:range5];
    }
    
    {
        //多重阴影
        NSRange range6 = [[text string] rangeOfString:@"珍惜一切就算没有拥有" options:NSCaseInsensitiveSearch];
        
        
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor redColor];
        shadow.offset = CGSizeMake(0, -1);
        shadow.radius = 1.5;
        YYTextShadow *subShadow = [YYTextShadow new];
        subShadow.color = [UIColor greenColor];
        subShadow.offset = CGSizeMake(0, 1);
        subShadow.radius = 1.5;
        shadow.subShadow = subShadow;
        [text yy_setTextShadow:shadow range:range6];
        
        YYTextShadow *shadow1 = [YYTextShadow new];
        shadow1.color = [UIColor orangeColor];
        shadow1.offset = CGSizeMake(0, 2);
        shadow1.radius = 1;
        [text yy_setTextInnerShadow:shadow range:range6];
    }
    
    
    {
        //斜体 未生效
        NSRange range7 = [[text string] rangeOfString:@"还记得你说家是唯一的城堡" options:NSCaseInsensitiveSearch];
        
        [text yy_setObliqueness:@(0.6) range:range7];
    }
    
    {//文本高亮简单版
        NSRange range8 = [[text string] rangeOfString:@"随著稻香河流继续奔跑" options:NSCaseInsensitiveSearch];
        [text yy_setTextHighlightRange:range8
                                 color:[UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000]
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                                 [AppUtility showMessage:[NSString stringWithFormat:@"Tap: %@",[text.string substringWithRange:range]]];
                             }];
    }
    
    
    {//文本高亮pro
        UIColor *colorNormal = [UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000];
        UIColor *colorHighlight = [UIColor purpleColor];
        
        NSRange range9 = [[text string] rangeOfString:@"微微笑 小时候的梦我知道" options:NSCaseInsensitiveSearch];
        
        
        YYTextDecoration *decorationNomal = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle
                                                                            width:@(1)
                                                                            color:colorNormal];
        YYTextDecoration *decorationHighlight = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle
                                                                                width:@(1)
                                                                                color:colorHighlight];
        //未点击时颜色
        [text yy_setColor:colorNormal range:range9];
        //未点击时下划线
        [text yy_setTextUnderline:decorationNomal range:range9];
        
        //点击后的状态
        YYTextHighlight *highlight = [YYTextHighlight new];
        [highlight setColor:colorHighlight];
        [highlight setUnderline:decorationHighlight];
        highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            [AppUtility showMessage:[NSString stringWithFormat:@"Tap: %@",[text.string substringWithRange:range]]];
        };
        [text yy_setTextHighlight:highlight range:range9];
    }
    
    
    // 高亮状态的背景
    YYTextBorder *highlightBorder = [YYTextBorder new];
    highlightBorder.insets = UIEdgeInsetsMake(-2, 0, -2, 0);
    highlightBorder.cornerRadius = 3;
    highlightBorder.fillColor = [UIColor greenColor];
    
    //@用户名称
    NSArray *resultAt= [[Utility regexAt] matchesInString:text.string options:kNilOptions range:text.yy_rangeOfAll];
    
    for (NSTextCheckingResult *at in resultAt)
    {
        if (at.range.location == NSNotFound && at.range.length <= 1)
        {
            continue;
        }
        
        if ([text yy_attribute:YYTextHighlightAttributeName atIndex:at.range.location] == nil)
        {
            [text yy_setColor:[UIColor blueColor] range:at.range];
            // 高亮状态
            YYTextHighlight *highlight = [YYTextHighlight new];
            [highlight setBackgroundBorder:highlightBorder];
            // 数据信息，用于稍后用户点击
            NSString *atName = [text.string substringWithRange:NSMakeRange(at.range.location + 1, at.range.length - 1)];
            highlight.userInfo = @{@"linkValue" : atName,@"linkType":@(LinkTypeAt)};
            [text yy_setTextHighlight:highlight range:at.range];
        }
    }
    
    //#话题#
    NSArray *resultTopic = [[Utility regexTopic] matchesInString:text.string options:kNilOptions range:text.yy_rangeOfAll];
    
    for (NSTextCheckingResult *at in resultTopic)
    {
        if (at.range.location == NSNotFound && at.range.length <= 1)
        {
            continue;
        }
        
        if ([text yy_attribute:YYTextHighlightAttributeName atIndex:at.range.location] == nil)
        {
            [text yy_setColor:[UIColor blueColor] range:at.range];
            // 高亮状态
            YYTextHighlight *highlight = [YYTextHighlight new];
            [highlight setBackgroundBorder:highlightBorder];
            // 数据信息，用于稍后用户点击
            highlight.userInfo = @{@"linkValue" : [text.string substringWithRange:NSMakeRange(at.range.location, at.range.length)],@"linkType":@(LinkTypeTopic)};
            [text yy_setTextHighlight:highlight range:at.range];
        }
    }
    
    
    

    
    NSArray *resultPhone = [[Utility regexPhone] matchesInString:text.string options:kNilOptions range:text.yy_rangeOfAll];
    
    for (NSTextCheckingResult *at in resultPhone)
    {
        if (at.range.location == NSNotFound && at.range.length <= 1)
        {
            continue;
        }
        
        if ([text yy_attribute:YYTextHighlightAttributeName atIndex:at.range.location] == nil)
        {
            [text yy_setColor:[UIColor blueColor] range:at.range];
            // 高亮状态
            YYTextHighlight *highlight = [YYTextHighlight new];
            [highlight setBackgroundBorder:highlightBorder];
            // 数据信息，用于稍后用户点击
            highlight.userInfo = @{kWBLinkPhoneName : [text.string substringWithRange:NSMakeRange(at.range.location, at.range.length)],@"type":@(LinkTypePhoneNum)};
            [text yy_setTextHighlight:highlight range:at.range];
        }
    }
    
    YYImage *image = [YYImage imageNamed:@"zuqiu"];

    image.preloadAllAnimatedImageFrames = YES;
    YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, 300, 300);
    imageView.autoPlayAnimatedImage = NO;
    [imageView startAnimating];
    
    NSMutableAttributedString *attachText = [NSMutableAttributedString yy_attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.size alignToFont:[UIFont systemFontOfSize:16] alignment:YYTextVerticalAlignmentBottom];
    [text appendAttributedString:attachText];
    
    
//    UIImage *image0 = [UIImage imageNamed:@"butterfly"];
//    UIImageView *imageView0 = [[UIImageView alloc] initWithImage:image0];
//    imageView0.frame = CGRectMake(0, 0, 300, 300);
//    
//    NSMutableAttributedString *attachText0 = [NSMutableAttributedString yy_attachmentStringWithContent:imageView0
//                                                                                           contentMode:UIViewContentModeCenter
//                                                                                        attachmentSize:imageView0.size
//                                                                                           alignToFont:[UIFont systemFontOfSize:20]
//                                                                                             alignment:YYTextVerticalAlignmentBottom];
//    [text appendAttributedString:attachText0];
    
    
    
    NSMutableDictionary *mapper = [NSMutableDictionary new];
    mapper[@":smile:"] = [self imageWithName:@"002"];
    mapper[@":cool:"] = [self imageWithName:@"013"];
    mapper[@":biggrin:"] = [self imageWithName:@"047"];
    mapper[@":arrow:"] = [self imageWithName:@"007"];
    mapper[@":confused:"] = [self imageWithName:@"041"];
    mapper[@":cry:"] = [self imageWithName:@"010"];
    mapper[@":wink:"] = [self imageWithName:@"085"];
    mapper[@":zuqiu:"] = [self imageWithName:@"zuqiu"];
    
    YYTextSimpleEmoticonParser *parser = [YYTextSimpleEmoticonParser new];
    parser.emoticonMapper = mapper;
    
    YYTextLinePositionSimpleModifier *mod = [YYTextLinePositionSimpleModifier new];
   // mod.fixedLineHeight = 22;
    
    
    
    CGSize size = CGSizeMake(SCREEN_WIDTH, CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:size text:text];
    
    // 获取文本显示位置和大小
    //    layout.textBoundingRect; // get bounding rect
    //    layout.textBoundingSize; // get bounding size
    
    YYTextView *yyTextView = [YYTextView new];
    yyTextView.editable = NO;
    yyTextView.delegate = self;
    yyTextView.dataDetectorTypes = UIDataDetectorTypeAll;
    yyTextView.textParser = parser;
    //yyTextView.linePositionModifier = mod;
    yyTextView.frame = CGRectMake(0, 0, SCREEN_WIDTH, layout.textBoundingSize.height);
    yyTextView.textAlignment = NSTextAlignmentCenter;
    yyTextView.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    yyTextView.backgroundColor = RGBCOLOR(246, 246, 246);
    yyTextView.attributedText = text;
    [self addSubview:yyTextView];
    
    
    //self.contentSize = CGSizeMake(SCREEN_WIDTH, layout.textBoundingSize.height);
    self.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
}

- (UIImage *)imageWithName:(NSString *)name {
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"EmoticonQQ" ofType:@"bundle"]];
    NSString *path = [bundle pathForScaledResource:name ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    YYImage *image = [YYImage imageWithData:data scale:2];
    image.preloadAllAnimatedImageFrames = YES;
    return image;
}


- (BOOL)textView:(YYTextView *)textView shouldTapHighlight:(YYTextHighlight *)highlight inRange:(NSRange)characterRange
{
    return YES;
}
- (void)textView:(YYTextView *)textView didTapHighlight:(YYTextHighlight *)highlight inRange:(NSRange)characterRange rect:(CGRect)rect
{
    if ([self.clickDelegate respondsToSelector:@selector(label:tapHighlight:inRange:)])
    {
        YYTextHighlight *highlight = [textView.attributedText yy_attribute:YYTextHighlightAttributeName atIndex:characterRange.location];
        [self.clickDelegate label:textView tapHighlight:highlight inRange:characterRange];
    }
}
- (BOOL)textView:(YYTextView *)textView shouldLongPressHighlight:(YYTextHighlight *)highlight inRange:(NSRange)characterRange
{

    return YES;
}
- (void)textView:(YYTextView *)textView didLongPressHighlight:(YYTextHighlight *)highlight inRange:(NSRange)characterRange rect:(CGRect)rect
{

}
@end
