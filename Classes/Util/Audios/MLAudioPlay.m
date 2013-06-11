//
//  MLAudioPlay.m
//  Molearn
//
//  Created by chen jian on 3/25/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import "MLAudioPlay.h"
#import <AVFoundation/AVFoundation.h>

@interface MLAudioPlay()<AVAudioPlayerDelegate>

@property (nonatomic, retain) AVAudioPlayer *player;

@end

@implementation MLAudioPlay

+ (MLAudioPlay *)defaultAudioPlay {
    static MLAudioPlay *__audioPlay = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __audioPlay = [[MLAudioPlay alloc] init];
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setCategory:AVAudioSessionCategoryPlayback error:nil];
        [session setActive:YES error:nil];
    });
    return __audioPlay;
}

- (void)startplay {
    NSError *error = nil;
    
    NSString *url = [self folderPath];
    NSArray *arr = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:[[NSURL alloc] initFileURLWithPath:url] includingPropertiesForKeys:nil options:0 error:&error];
    NSURL *file = [arr objectAtIndex:1];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:file error:nil];
    [_player play];
}




- (void)playWithData:(NSURL *)url {
    self.url = url;
    [self play];
}

- (NSString *)folderPath {
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"molearn"];
}

@end
