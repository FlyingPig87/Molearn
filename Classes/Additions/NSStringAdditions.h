//
//  NSStringAdditions.h
//  CityGuide
//
//  Created by Chen Witness on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)
+ (NSString *)UUID;
+ (NSString *)cachesDirectory;
+ (BOOL)validateEmail:(NSString*)email;
@end
