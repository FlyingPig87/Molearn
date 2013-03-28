//
//  MLHTTPClient.h
//  Molearn
//
//  Created by chen jian on 3/26/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLHTTPClient : NSObject

+ (MLHTTPClient *)sharedInstance;

- (void)loginWithUserName:(NSString *)userName
                 password:(NSString *)password
                  success:(void(^)(BOOL isSuccess))success
                  failure:(void(^)(NSError *error))failure;

- (void)registerWithUserName:(NSString *)userName
                    password:(NSString *)password
                     success:(void(^)(BOOL isSuccess))success
                     failure:(void(^)(NSError *error))failure;


@end
