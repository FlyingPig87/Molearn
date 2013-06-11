//
//  UIBarButtonItemAdditions.h
//  CityGuide
//
//  Created by COLD FRONT on 12-6-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem(Additions)

+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target
                                        selector:(SEL)selector;

+ (UIBarButtonItem *)rectBarButtonItemWithTitle:(NSString *)title 
                                         target:(id)target 
                                       selector:(SEL)selector;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title 
                                      image:(UIImage *)image
                             highlightImage:(UIImage *)highlightImage
                                     target:(id)target 
                                   selector:(SEL)selector;
+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                               disableImage:(UIImage *)disableImage
                                     target:(id)target
                                   selector:(SEL)selector;
@end
