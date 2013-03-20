//
//  UINavigationControllerAdditions.m
//  iTravel
//
//  Created by COLD FRONT on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UINavigationControllerAdditions.h"

@implementation UINavigationController (CityGuide)

- (id)duplicateWithNavigationBarClass:(Class)navigationBarClass {
    // ensure navigation bar instantiated
    [self navigationBar];
    
    // archive camera controller
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeRootObject:self];
    [archiver finishEncoding];
    [archiver release];
    
    // Unarchive the navigation controller and ensure that our UINavigationBar subclass is used.
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [unarchiver setClass:navigationBarClass forClassName:@"UINavigationBar"];
    id result = [unarchiver decodeObject];
    [unarchiver finishDecoding];
    [unarchiver release];
    
    return result;
}

@end
