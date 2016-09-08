//
//  TTTLabelScrollView.m
//  MyYYTextDemo
//
//  Created by boolean on 16/9/5.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "TTTLabelScrollView.h"
#import <TTTAttributedLabel.h>
#import "AppDelegate.h"

static NSString *const phoneNum = @"15711112222";

@interface TTTLabelScrollView ()<TTTAttributedLabelDelegate>
@property(nonatomic,strong)TTTAttributedLabel *aLable;
@end
@implementation TTTLabelScrollView
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
    //NSString *text = @"稻香\n还记得你说家是唯一的城堡 \n随着稻香河流继续奔跑\n微微笑 小时候的梦我知道\n不要哭让萤火虫带着你逃跑 \n乡间的歌谣永远的依靠\n回家吧 回到最初的美好\n\n如果你想请我吃饭，请拨打：15711112222\nhttp://y.qq.com/portal/song/003aAYrm3GE0Ac.html   http://baike.baidu.com/link?url=sv_suB68DbO6ZPaB61LUhvTeQAQnQtkimmuobka0cUfdDicDLs-gsNJJlqYzccRUfZiXpI6wcAOC6YdbOiqskCgY-8i6Xc7ho0xWWQTWJAe,1234@qq.com";
    NSString *text = DaoXiang;
    __block CGSize size;
    
    [self.aLable setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString)
     {
        
        NSRange fontRange         = [[mutableAttributedString string] rangeOfString:@"对这个世界如果你有太多的抱怨"
                                                                    options:NSCaseInsensitiveSearch];

        NSRange strokeColorRange1 = [[mutableAttributedString string] rangeOfString:@"跌倒了 就不敢继续往前走"
                                                                            options:NSCaseInsensitiveSearch];

        NSRange strikeRange       = [[mutableAttributedString string] rangeOfString:@"为什麼 人要这麼的脆弱 堕落"
                                                                      options:NSCaseInsensitiveSearch];

        NSRange fillColorRange    = [[mutableAttributedString string] rangeOfString:@"请你打开电视看看"
                                                                         options:NSCaseInsensitiveSearch];

        NSRange shadowRange       = [[mutableAttributedString string] rangeOfString:@"为生命在努力勇敢的走下去"
                                                                      options:NSCaseInsensitiveSearch];

        NSRange obliquenessRange  = [[mutableAttributedString string] rangeOfString:@"还记得你说家是唯一的城堡"
                                                                           options:NSCaseInsensitiveSearch];


        UIEdgeInsets fillPadding  = UIEdgeInsetsMake(0, 0, 0, 0);
        
        
        
        
        // Core Text APIs use C functions without a direct bridge to UIFont. See Apple's "Core Text Programming Guide" to learn how to configure string attributes.
        UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:16];
        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
    
        if (font) {
            
            {
                //字体
                [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName
                                                value:(__bridge id)font
                                                range:fontRange];
                //文字颜色
                [mutableAttributedString addAttribute:(NSString *)kCTForegroundColorAttributeName
                                                value:[UIColor redColor]
                                                range:fontRange];
                CFRelease(font);

                
            }
            
            {
                //NSStrokeColorAttributeName设置文字描边颜色，需要和NSStrokeWidthAttributeName设置描边宽度，这样就能使文字空心
                //文字描边颜色
                [mutableAttributedString addAttribute:NSStrokeColorAttributeName
                                                value:[UIColor blueColor]
                                                range:strokeColorRange1];
                //文字描边宽度
                [mutableAttributedString addAttribute:NSStrokeWidthAttributeName
                                                value:@(2.0)
                                                range:strokeColorRange1];
                
            }
            
            {
                //删除样式
                [mutableAttributedString addAttribute:kTTTStrikeOutAttributeName
                                                value:@YES
                                                range:strikeRange];
                
                //加上下划线
                [mutableAttributedString addAttribute:NSUnderlineStyleAttributeName
                                                value:[NSNumber numberWithInt:3]
                                                range:strikeRange];
                [mutableAttributedString addAttribute:NSUnderlineColorAttributeName
                                                value:[UIColor greenColor]
                                                range:strikeRange];
            }
            
            {
                //背景色
                [mutableAttributedString addAttribute:kTTTBackgroundFillColorAttributeName
                                                value:[UIColor purpleColor]
                                                range:fillColorRange];
                //控制背景色范围
                [mutableAttributedString addAttribute:kTTTBackgroundFillPaddingAttributeName
                                                value:[NSNumber valueWithUIEdgeInsets:fillPadding]
                                                range:fillColorRange];
                //控制背景色（文字边框）的圆角
                [mutableAttributedString addAttribute:kTTTBackgroundCornerRadiusAttributeName
                                                value:@(4)
                                                range:fillColorRange];
                
                //文字边框颜色
                [mutableAttributedString addAttribute:kTTTBackgroundStrokeColorAttributeName
                                                value:[UIColor purpleColor]
                                                range:fillColorRange];
            }

            {
                //无效
                NSShadow *shadow = [[NSShadow alloc] init];
                [shadow setShadowColor:[UIColor redColor]];
                [shadow setShadowBlurRadius:4.0];
                [shadow setShadowOffset:CGSizeMake(2, 2)];
                //阴影
                [mutableAttributedString addAttribute:NSShadowAttributeName
                                                value:shadow
                                                range:shadowRange];
            }
            
            {
                //无效
                //斜体
                //NSObliquenessAttributeName 设置字体倾斜度，取值为 NSNumber（float），正值右倾，负值左倾
                [mutableAttributedString addAttribute:NSObliquenessAttributeName
                                                value:@(5.0)
                                                range:obliquenessRange];
            }
        }
     
        //高度计算
        size = [TTTAttributedLabel sizeThatFitsAttributedString:mutableAttributedString
                                                withConstraints:CGSizeMake(SCREEN_WIDTH - 20, CGFLOAT_MAX)
                                         limitedToNumberOfLines:0];
        return mutableAttributedString;
    }];
    
    NSRange boldRange1 = [text rangeOfString:@"随著稻香河流继续奔跑" options:NSCaseInsensitiveSearch];
    [self.aLable addLinkToURL:[NSURL URLWithString:@"http://y.qq.com/portal/song/003aAYrm3GE0Ac.html"]
                    withRange:boldRange1];
    
    //电话号码可以自动识别，也可以这样添加
    //    NSRange phoneRange = [text rangeOfString:phoneNum options:NSCaseInsensitiveSearch];
    //    [self.aLable addLinkToPhoneNumber:phoneNum withRange:phoneRange];
    
    NSRange addressRange = [text rangeOfString:@"微微笑 小时候的梦我知道" options:NSCaseInsensitiveSearch];
    [self.aLable addLinkToAddress:@{@"detailAdd":@"幸福街122号",@"lontitude":@"110.011111",@"latitude":@"30.1234"}
                        withRange:addressRange];
    
    self.aLable.frame = CGRectMake(10, 0, SCREEN_WIDTH - 20, size.height);
    
    [self addSubview:self.aLable];
     self.contentSize = CGSizeMake(SCREEN_WIDTH, size.height);
}

#pragma mark - TTTAttributedLabelDelegate
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{
    NSLog(@"linkClick");
    [[UIApplication sharedApplication] openURL:url];
}
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithAddress:(NSDictionary *)addressComponents
{
    NSLog(@"addressClick");
    NSLog(@"detailAdd:%@,lontitude:%f,latitude:%f",addressComponents[@"detailAdd"],
          [addressComponents[@"lontitude"] floatValue],
          [addressComponents[@"latitude"] floatValue]);
}
- (void)attributedLabel:(TTTAttributedLabel *)label
didSelectLinkWithPhoneNumber:(NSString *)phoneNumber
{
    NSLog(@"phoneClick");
    NSString *num = [NSString stringWithFormat:@"tel:%@",phoneNumber];
    //    NSString *num = [NSString stringWithFormat:@"telprompt://%@",number];
    //而这个方法则打电话前先弹框  是否打电话 然后打完电话之后回到程序中 网上说这个方法可能不合法 无法通过审核
    
    UIApplication *application = [UIApplication sharedApplication];
    AppDelegate *delegate = (AppDelegate *)application.delegate;
    UIWindow *window = delegate.window;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:[NSString stringWithFormat:@"是否拨打 %@",phoneNumber]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {}];
    
    UIAlertAction *actionDone = [UIAlertAction actionWithTitle:@"确定"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号
    }];
    [alert addAction:actionCancel];
    [alert addAction:actionDone];
    
    [window.rootViewController presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Getter And Setter
- (TTTAttributedLabel *)aLable
{
    if (!_aLable)
    {
        _aLable = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(10, 80, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 200)];
        _aLable.backgroundColor = RGBCOLOR(246, 246, 246);
        _aLable.lineBreakMode = NSLineBreakByWordWrapping;
        _aLable.numberOfLines = 0;
        _aLable.delegate = self;
        _aLable.lineSpacing = 10;
        //要放在`text`, with either `setText:` or `setText:afterInheritingLabelAttributesAndConfiguringWithBlock:前面才有效
        _aLable.enabledTextCheckingTypes = NSTextCheckingTypePhoneNumber|NSTextCheckingTypeAddress|NSTextCheckingTypeLink;
        //链接正常状态文本属性
        _aLable.linkAttributes = @{NSForegroundColorAttributeName:[UIColor purpleColor],NSUnderlineStyleAttributeName:@(1)};
        //链接高亮状态文本属性
        _aLable.activeLinkAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],NSUnderlineStyleAttributeName:@(1)};
        
    }
    return _aLable;
}



@end
