//
//  UINavigationItemAdditions.m
//  iTravel
//
//  Created by COLD FRONT on 12-6-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UINavigationItemAdditions.h"
#import "UIColorAdditions.h"

@implementation UINavigationItem (CityGuide)

+ (UILabel *)titleViewForTitle:(NSString *)title {
    UILabel *titleView = [[UILabel alloc] init];
    titleView.font = [UIFont boldSystemFontOfSize:20];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.textColor = [UIColor colorWithRGB:0x465d74];
    titleView.text = title;
    titleView.shadowColor = [UIColor colorWithWhite:1 alpha:0.3f];
    titleView.shadowOffset = CGSizeMake(0, 1);
    [titleView sizeToFit];
    return [titleView autorelease];
}

@end
