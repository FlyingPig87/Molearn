//
//  MLFileManage.m
//  Molearn
//
//  Created by chen jian on 4/2/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import "MLFileManage.h"
#import "AFHTTPClient.h"
#import "JSONKit.h"

@implementation MLFileManage

+ (MLFileManage *)sharedInstance {
    static MLFileManage *__fileManage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __fileManage = [[MLFileManage alloc] init];
    });
    return __fileManage;
}

- (void)test {
    NSFileManager *fileManage = [NSFileManager defaultManager];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path1 = [path stringByAppendingPathComponent:@"molearn"];
    NSError *error = nil;
    BOOL *isDirectory = NULL;
    if ([fileManage fileExistsAtPath:path isDirectory:isDirectory]) {
        NSLog(@"file exist");
    }else {
        if ([fileManage createDirectoryAtPath:path1 withIntermediateDirectories:YES attributes:nil error:&error]) {
            NSLog(@"success:%@",path);
        }else {
            NSLog(@"error:%@",error);
        }
    }
    
    
    NSString *path2 = [path stringByAppendingPathComponent:@"test"];
    [fileManage createDirectoryAtPath:path2 withIntermediateDirectories:YES attributes:nil error:&error];
    
    NSArray *content = [fileManage contentsOfDirectoryAtURL:[NSURL fileURLWithPath:path1] includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:&error];
    NSLog(@"%@",[content objectAtIndex:0]);
    
    NSURL *url = [content objectAtIndex:0];
    NSLog(@"lastpath:%@",[url lastPathComponent]);
    
    path2 = [path2 stringByAppendingPathComponent:[url lastPathComponent]];
    [fileManage moveItemAtURL:url toURL:[NSURL fileURLWithPath:path2 isDirectory:YES] error:&error];
    NSLog(@"remove err:%@",error);

//    NSString *file = [path1 stringByAppendingPathComponent:[content objectAtIndex:0]];
//    [fileManage attributesOfFileSystemForPath:<#(NSString *)#> error:<#(NSError **)#>]
//    [path2 stringByAppendingPathComponent:@""];
//
//    [fileManage moveItemAtPath:path1 toPath:path2 error:nil];

//    NSString *fromPath = [[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"];
//    [fileManage copyItemAtPath:fromPath toPath:path error:&error];
}

- (void)start {
    AFHTTPClient *client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"http://music.baidu.com"]];
    [client getPath:@"/data/music/file?link=http://zhangmenshiting.baidu.com/data2/music/38542270/382338211365681661128.mp3?xcode=1c889484e318c2ace5e97799d53c3ca4"
         parameters:nil
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSData *data = [NSData dataWithData:(NSData *)responseObject];
                NSString *fileName = [NSString stringWithFormat:@"ml%d.mp3",rand()];
                NSString *folderPath = [self folderPath];
                NSError *error = nil;
                if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
                    [[NSFileManager defaultManager]createDirectoryAtPath:folderPath
                                             withIntermediateDirectories:YES
                                                              attributes:nil
                                                                   error:&error];
                }
                if (!error) {
                    [data writeToFile:[folderPath stringByAppendingPathComponent:fileName] atomically:YES];
                }
            
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
            }];
    
}

- (NSString *)folderPath {
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"molearn"];
}

@end
