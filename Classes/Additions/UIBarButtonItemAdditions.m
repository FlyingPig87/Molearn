//
//  UIBarButtonItemAdditions.m
//  CityGuide
//
//  Created by COLD FRONT on 12-6-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIBarButtonItemAdditions.h"

@implementation UIBarButtonItem(Additions)

+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target selector:(SEL)selector {
    return [self barButtonItemWithTitle:@" 返回"
                                  image:[UIImage imageNamed:@"btn_back"]
                         highlightImage:[UIImage imageNamed:@"btn_back_h"]
                                 target:target
                               selector:selector];
}

+ (UIBarButtonItem *)rectBarButtonItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector{
    return [self barButtonItemWithTitle:title
                                  image:[UIImage imageNamed:@"btn_rect"]
                         highlightImage:[UIImage imageNamed:@"btn_rect_h"]
                                 target:target
                               selector:selector];
}

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title 
                                      image:(UIImage *)image
                             highlightImage:(UIImage *)highlightImage
                                     target:(id)target 
                                   selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
    button.titleLabel.shadowOffset = CGSizeMake(0, -0.2);
    button.titleLabel.shadowColor = [[[UIColor alloc] initWithWhite:0 alpha:0.2f] autorelease];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [button sizeToFit];
    return [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
}

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                               disableImage:(UIImage *)disableImage
                                     target:(id)target
                                   selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
    button.titleLabel.shadowOffset = CGSizeMake(0, -0.2);
    button.titleLabel.shadowColor = [[[UIColor alloc] initWithWhite:0 alpha:0.2f] autorelease];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:disableImage forState:UIControlStateDisabled];
    [button sizeToFit];
    return [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
}

@end
