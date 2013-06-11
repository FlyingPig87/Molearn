//
//  NSURLAdditions.m
//  CityGuide
//
//  Created by Chen Witness on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSURLAdditions.h"

@implementation NSURL (Additions)
+ (NSURL *)cachesDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory
                                                   inDomains:NSUserDomainMask] lastObject];
}
@end
