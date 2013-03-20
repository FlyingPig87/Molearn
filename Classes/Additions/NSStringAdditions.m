//
//  NSStringAdditions.m
//  CityGuide
//
//  Created by Chen Witness on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSStringAdditions.h"

@implementation NSString (Additions)
+ (NSString *)UUID {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *value = [defaults objectForKey:@"__UUID__"];
    if (!value) {
        CFUUIDRef UUID = CFUUIDCreate(NULL);
        value = [(NSString *)CFUUIDCreateString(NULL, UUID) autorelease];
        CFRelease(UUID);
        [defaults setObject:value forKey:@"__UUID__"];
        [defaults synchronize];
    }
    return value;
}

+ (NSString *)cachesDirectory {
    // better cache to improve performance
    static NSString * cachesDirectory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cachesDirectory = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                                                NSUserDomainMask,
                                                                YES) lastObject] retain];
    });
    return cachesDirectory;
}

+ (BOOL)validateEmail:(NSString*)email
{
    if((0 != [email rangeOfString:@"@"].length) &&
       (0 != [email rangeOfString:@"."].length))
    {
        NSCharacterSet* tmpInvalidCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        NSMutableCharacterSet* tmpInvalidMutableCharSet = [[tmpInvalidCharSet mutableCopy] autorelease];
        [tmpInvalidMutableCharSet removeCharactersInString:@"_-"];
        
        /*
         *使用compare option 来设定比较规则，如
         *NSCaseInsensitiveSearch是不区分大小写
         *NSLiteralSearch 进行完全比较,区分大小写
         *NSNumericSearch 只比较定符串的个数，而不比较字符串的字面值
         */
        NSRange range1 = [email rangeOfString:@"@"
                                      options:NSCaseInsensitiveSearch];
        
        //取得用户名部分
        NSString* userNameString = [email substringToIndex:range1.location];
        NSArray* userNameArray   = [userNameString componentsSeparatedByString:@"."];
        
        for(NSString* string in userNameArray)
        {
            NSRange rangeOfInavlidChars = [string rangeOfCharacterFromSet: tmpInvalidMutableCharSet];
            if(rangeOfInavlidChars.length != 0 || [string isEqualToString:@""])
                return NO;
        }
        
        //取得域名部分
        NSString *domainString = [email substringFromIndex:range1.location+1];
        NSArray *domainArray   = [domainString componentsSeparatedByString:@"."];
        
        for(NSString *string in domainArray)
        {
            NSRange rangeOfInavlidChars=[string rangeOfCharacterFromSet:tmpInvalidMutableCharSet];
            if(rangeOfInavlidChars.length !=0 || [string isEqualToString:@""])
                return NO;
        }
        
        return YES;
    }
    else {
        return NO;
    }
}
@end
