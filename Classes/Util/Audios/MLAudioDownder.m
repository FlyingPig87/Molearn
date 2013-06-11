//
//  MLAudioDownder.m
//  Molearn
//
//  Created by chen jian on 3/25/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import "MLAudioDownder.h"
#import <AVFoundation/AVFoundation.h>

@implementation MLAudioDownder

+ (MLAudioDownder *)sharedInstance {
    static MLAudioDownder *__audioDowner = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __audioDowner = [[MLAudioDownder alloc] init];
    });
    return __audioDowner;
}


@end
