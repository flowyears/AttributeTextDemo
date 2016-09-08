//
//  Utillity.m
//  Learning
//
//  Created by boolean on 16/5/31.
//  Copyright © 2016年 fezo. All rights reserved.
//

#import "Utility.h"
#import "AppDelegate.h"


@implementation Utility
+ (NSString *)timeIntervalToString:(NSTimeInterval)timeInterval
                         formatter:(NSString *)formatter
{
    if (timeInterval > 1000000000000)
    {
        timeInterval = timeInterval/1000;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString *dateStr = [[self class] dateToString:date formatter:formatter];
    return dateStr;
}
+ (NSString *)dateToString:(NSDate *)date
                 formatter:(NSString *)formatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:formatter];
    NSString *dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}


+ (NSString *)objectToJsonString:(id)object
{
    if ([NSJSONSerialization isValidJSONObject:object])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                           options:kNilOptions
                                                             error:&error];
        NSString *result = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return result;
    }
    return nil;
}

+ (id)jsonStringToObjec:(NSString *)jsonStr
{
    if (jsonStr)
    {
        NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        return result;
    }
    return nil;
}

/**
 *  画圆
 *
 *  @param size  圆形的尺寸
 *  @param color 圆的颜色
 *
 *  @return
 */
+ (UIImage *)drawCircleWithSize:(CGSize )size color:(UIColor *)color
{
    UIImage *resultImg = nil;
    
    CGFloat lineWidth = 1.0;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGRect rect = CGRectMake(lineWidth, lineWidth, size.width-lineWidth*2, size.height-lineWidth*2);

    
    CGContextRef currentContex = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(currentContex, lineWidth);
    CGContextSetStrokeColorWithColor(currentContex, color.CGColor);
    CGContextAddEllipseInRect(currentContex, rect);
    CGContextStrokePath(currentContex);
    
    resultImg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultImg;
}

+ (BOOL)isFirstLaunch
{
    BOOL hadLaunched = [[[NSUserDefaults standardUserDefaults] objectForKey:@"had_launched"] boolValue];//是否已经启动过这个app
    if (!hadLaunched)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"had_launched"];
    }
    return hadLaunched ? NO:YES;
}


+ (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews)
    {
        UIImageView *imageView = [[self class] findHairlineImageViewUnder:subview];
        if (imageView)
        {
            return imageView;
        }
    }
    return nil;
}

//本地通知重复时间间隔转中文
+ (NSString *)calendarUnitToString:(NSCalendarUnit)calendarUnit
{
    NSString *result = @"";
    switch (calendarUnit)
    {
        case NSCalendarUnitEra:
        {
            result = @"永不";
        }
            break;
        case NSCalendarUnitDay:
        {
            result = @"每天";
        }
            break;
            case NSCalendarUnitHour:
        {
            result = @"每小时";
        }
            break;
        case NSCalendarUnitWeekday:
        {
            result = @"每周";
        }
            break;
        case NSCalendarUnitMonth:
        {
            result = @"每月";
        }
            break;
        case NSCalendarUnitYear:
        {
            result = @"每年";
        }
            break;

        default:
            break;
    }
    return result;
}

+ (NSCalendarUnit)repeatIntervalStringToCalendarUnit:(NSString *)string
{
    NSCalendarUnit result = NSCalendarUnitEra;
    if ([string isEqualToString:@"永不"])
    {
        result = NSCalendarUnitEra;
    }
    else if ([string isEqualToString:@"每天"])
    {
        result = NSCalendarUnitDay;
    }
    else if ([string isEqualToString:@"每小时"])
    {
        result = NSCalendarUnitHour;
    }
    else if ([string isEqualToString:@"每周"])
    {
        result = NSCalendarUnitWeekday;
    }
    else if ([string isEqualToString:@"每月"])
    {
        result = NSCalendarUnitMonth;
    }
    else if ([string isEqualToString:@"每年"])
    {
        result = NSCalendarUnitYear;
    }
    return result;
}

+ (void)callPhoneNumber:(NSString *)phoneNumber
{
    UIApplication *application = [UIApplication sharedApplication];
    AppDelegate *delegate = (AppDelegate *)application.delegate;
    UIWindow *window = delegate.window;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:[NSString stringWithFormat:@"是否拨打 %@",phoneNumber]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *actionDone = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *num = [NSString stringWithFormat:@"tel:%@",phoneNumber];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号
    }];
    [alert addAction:actionCancel];
    [alert addAction:actionDone];
    
    [window.rootViewController presentViewController:alert animated:YES completion:nil];
}

+ (void)commentAppWithAppId:(NSString *)appId
{
    NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8",appId];
    NSURL *webUrl=[NSURL URLWithString:urlStr];
    [[UIApplication sharedApplication]openURL:webUrl];
}

#pragma mark - NSRegularExpression正则

+ (NSRegularExpression *)regexAt
{
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 微博的 At 只允许 英文数字下划线连字符，和 unicode 4E00~9FA5 范围内的中文字符，这里保持和微博一致。。
        // 目前中文字符范围比这个大
        regex = [NSRegularExpression regularExpressionWithPattern:@"@[-_a-zA-Z0-9\u4E00-\u9FA5]+" options:kNilOptions error:NULL];
    });
    return regex;
}

+ (NSRegularExpression *)regexTopic
{
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [NSRegularExpression regularExpressionWithPattern:@"#[^@#]+?#" options:kNilOptions error:NULL];
    });
    return regex;
}

+ (NSRegularExpression *)regexEmail
{
    
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [NSRegularExpression regularExpressionWithPattern:
                 @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" options:kNilOptions error:NULL];
    });
    return regex;
}

+ (NSRegularExpression *)regexUrl
{
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [NSRegularExpression regularExpressionWithPattern:@"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)" options:kNilOptions error:NULL];
    });
    return regex;
}

+ (NSRegularExpression *)regexEmoticon
{
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [NSRegularExpression regularExpressionWithPattern:@"\\[[^ \\[\\]]+?\\]" options:kNilOptions error:NULL];
    });
    return regex;
}


+ (NSRegularExpression *)regexPhone
{
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [NSRegularExpression regularExpressionWithPattern:@"^[1-9][0-9]{4,11}$" options:kNilOptions error:NULL];
    });
    return regex;
}


+ (NSRegularExpression *)regexPhoneNumber
{
    
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [NSRegularExpression regularExpressionWithPattern:
                 @"^[1-9][0-9]{4,11}$" options:kNilOptions error:NULL];
    });
    return regex;
}

@end
