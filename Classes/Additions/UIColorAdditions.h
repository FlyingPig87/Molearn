//
//  UIColorAdditions.h
//  CityGuide
//
//  Created by COLD FRONT on 12-5-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor(RGB)

+ (UIColor *)colorWithRGB:(int)rgb;
+ (UIColor *)colorWithRGB:(int)rgb alpha:(float)alpha;

+ (UIColor *)defaultDarkTextColor;
+ (UIColor *)defaultLightTextColor;

+ (UIColor *)normalButtonTextColor;
+ (UIColor *)disableButtonTextColor;

@end
