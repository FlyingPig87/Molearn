//
//  MLAudioPlay.m
//  Molearn
//
//  Created by chen jian on 3/25/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import "MLAudioPlay.h"
#import <AVFoundation/AVFoundation.h>

@interface MLAudioPlay()

@property (nonatomic, retain) AVAudioPlayer *player;

@end

@implementation MLAudioPlay

+ (MLAudioPlay *)defaultAudioPlay {
    static MLAudioPlay *__audioPlay = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __audioPlay = [[MLAudioPlay alloc] init];
        __audioPlay.url = [[[NSURL alloc]init]autorelease];
        __audioPlay.musicData = [NSData data];
        AVAudioSession *session = [AVAudioSession sharedInstance];
        NSError *error = nil;
//        if (![session setActive:YES error:&error]) {
//            NSLog(@"active:%@",error);
//        };
//        if (![session setCategory:AVAudioSessionCategoryPlayback error:&error]) {
//            NSLog(@"category:%@",error);
//        };
    });
    return __audioPlay;
}

- (void)play {
    NSError *error = nil;
    
    NSString *url = [self folderPath];
    NSArray *arr = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:[[NSURL alloc] initFileURLWithPath:url] includingPropertiesForKeys:nil options:0 error:&error];
    NSURL *file = [arr objectAtIndex:1];
    self.player = [[[AVAudioPlayer alloc] initWithContentsOfURL:file error:&error] autorelease];
    if (error) {
        NSLog(@"error:%@",error);
        return;
    }
    _player.volume = 1;
    if ([_player prepareToPlay]) {
        [_player play];
    }
}

- (void)playWithData:(NSURL *)url {
    self.url = url;
    [self play];
}

- (NSString *)folderPath {
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"molearn"];
}

@end
