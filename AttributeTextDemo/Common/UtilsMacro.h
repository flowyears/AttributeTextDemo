//
//  UtilsMacro.h
//  DaMi
//
//  Created by shenjx on 15/4/23.
//  Copyright (c) 2015年 keen. All rights reserved.
//

//UtilsMacro.h 里放的是一些方便使用的宏定义



#define NullFilter(str)  ([str isKindOfClass:[NSNull class]]||str == nil) ? @"" : str  
//由角度转换为弧度：
#define degreesToRadinas(x) (M_PI * (x)/180.0)
#define systemVersionFloatValue [UIDevice currentDevice].systemVersion.floatValue

#define SPACE_CHARACTER @" "//空格符
#define MAIN_SCREEN_SCALE [UIScreen mainScreen].scale

#define LINE_WIDTH(x) (x / [UIScreen mainScreen].scale)

#define iOS_newer(x)   ([[[UIDevice currentDevice] systemVersion] doubleValue] >= x)
#define iOS_older(x)   ([[[UIDevice currentDevice] systemVersion] doubleValue] < x)

#define TIME_FORMATTER_1 @"yyyy/MM/dd HH:mm"
#define TIME_FORMATTER_2 @"yyyy/MM/dd"
#define TIME_FORMATTER_3 @"yyyy/MM"
#define TIME_FORMATTER_4 @"yyyy.MM"
#define TIME_FORMATTER_5 @"yyyy.MM.dd"
#define TIME_FORMATTER_6 @"yy-MM-dd"
#define TIME_FORMATTER_7 @"HH:mm"
#define TIME_FORMATTER_8 @"yy-MM-dd HH:mm"
#define TIME_FORMATTER_9 @"yy-MM-dd HH:mm EEE"


#define SCREEN_WIDTH   [ UIScreen mainScreen ].bounds.size.width
#define SCREEN_HEIGHT   [ UIScreen mainScreen ].bounds.size.height

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 \
alpha:(a)]

#define WEAK_SELF __weak typeof(self) weakSelf = self
#define STRONG_SELF __strong __typeof(weakSelf)strongSelf = weakSelf

//单行文本size
#define MB_TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
//多行文本size
#define MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;



