//
//  MLAudioPlay.h
//  Molearn
//
//  Created by chen jian on 3/25/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLAudioPlay : NSObject

+ (MLAudioPlay *)defaultAudioPlay;

@property (nonatomic, retain) NSData *musicData;
@property (nonatomic, retain) NSURL *url;

- (void)play;

- (void)playWithData:(NSURL *)url;

@end
