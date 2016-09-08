//
//  Utillity.h
//  Learning
//
//  Created by boolean on 16/5/31.
//  Copyright © 2016年 fezo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utility : NSObject
#pragma mark - Date
/**
 *  时间戳转字符串
 *
 *  @param timeInterval 时间戳
 *  @param formatter    字符串格式
 *
 *  @return 时间字符串
 */
+ (NSString *)timeIntervalToString:(NSTimeInterval)timeInterval
                         formatter:(NSString *)formatter;

/**
 *  日期转时间字符串
 *
 *  @param date      日期
 *  @param formatter 字符串格式
 *
 *  @return 时间字符串
 */
+ (NSString *)dateToString:(NSDate *)date formatter:(NSString *)formatter;

#pragma mark - Json
/**
 *  对象转json（对象只能是字典或数组，包含的对象只能是NSString, NSNumber, NSArray, NSDictionary, or NSNull）
 */
+ (NSString *)objectToJsonString:(id)object;

/**
 *  json转对象
 */
+ (id)jsonStringToObjec:(NSString *)jsonStr;

/**
 *  画圆
 *
 *  @param size  圆形的尺寸
 *  @param color 圆的颜色
 *
 *  @return
 */
+ (UIImage *)drawCircleWithSize:(CGSize )size color:(UIColor *)color;

/**
 *  是否第一次启动app
 *
 *  @return
 */
+ (BOOL)isFirstLaunch;

/**
 *  获取导航条下的阴影
 *
 *  @param view
 *
 *  @return 
 */
+ (UIImageView *)findHairlineImageViewUnder:(UIView *)view;

/**
 *  本地通知重复时间间隔转中文
 *
 *  @param calendarUnit 时间间隔
 *
 *  @return
 */
+ (NSString *)calendarUnitToString:(NSCalendarUnit)calendarUnit;

/**
 *  字符串转时间间隔
 *
 *  @param string 字符串
 *
 *  @return
 */
+ (NSCalendarUnit)repeatIntervalStringToCalendarUnit:(NSString *)string;

#pragma mark - 常用功能
/**
 *  打电话
 *
 *  @param phoneNumber
 */
+ (void)callPhoneNumber:(NSString *)phoneNumber;
/**
 *  跳转到app store评价
 *
 *  @param appId appId
 */
+ (void)commentAppWithAppId:(NSString *)appId;


#pragma mark - NSRegularExpression正则
/**
 *  正则@ @昵称
 *
 *  @return
 */
+ (NSRegularExpression *)regexAt;
/**
 *  正则话题 #这是话题#
 *
 *  @return
 */
+ (NSRegularExpression *)regexTopic;

/**
 *  正则email
 *
 *  @return
 */
+ (NSRegularExpression *)regexEmail;

/**
 *  正则URL
 *
 *  @return
 */
+ (NSRegularExpression *)regexUrl;
+ (NSRegularExpression *)regexPhone;
+ (NSRegularExpression *)regexPhoneNumber;
/**
 *  正则 微博表情
 *
 *  @return 
 */
+ (NSRegularExpression *)regexEmoticon;
@end
