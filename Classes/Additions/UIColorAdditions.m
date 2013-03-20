//
//  UIColorAdditions.m
//  CityGuide
//
//  Created by COLD FRONT on 12-5-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIColorAdditions.h"

@implementation UIColor(RGB)

+ (UIColor *)colorWithRGB:(int)rgb {
    return [UIColor colorWithRed:((rgb & 0xFF0000) >> 16) / 255.0f
                           green:((rgb & 0xFF00) >> 8) / 255.0f
                            blue:((rgb & 0xFF)) / 255.0f
                           alpha:1.0f];
}

+ (UIColor*)colorWithRGB:(int)rgb alpha:(float)alpha {
    return [UIColor colorWithRed:((rgb & 0xFF0000) >> 16) / 255.0f
                           green:((rgb & 0xFF00) >> 8) / 255.0f
                            blue:((rgb & 0xFF)) / 255.0f
                           alpha:alpha];
}

+ (UIColor *)defaultDarkTextColor {
    return [UIColor colorWithRGB:0x32465a];
}
+ (UIColor *)defaultLightTextColor {
    return [UIColor colorWithRGB:0x6c7680];
}
+ (UIColor *)normalButtonTextColor {
    return [UIColor colorWithRGB:0x735823];
}
+ (UIColor *)disableButtonTextColor {
    return [UIColor colorWithRGB:0xefdc8f];
}

@end
