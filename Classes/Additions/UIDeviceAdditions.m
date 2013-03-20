//
//  UIDeviceAdditions.m
//  CityGuide
//
//  Created by COLD FRONT on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIDeviceAdditions.h"
#import <sys/utsname.h>

@implementation UIDevice(Additions)

//http://stackoverflow.com/questions/11197509/ios-iphone-get-device-model-and-make
//@"i386"      on the simulator
//@"iPod1,1"   on iPod Touch
//@"iPod2,1"   on iPod Touch Second Generation
//@"iPod3,1"   on iPod Touch Third Generation
//@"iPod4,1"   on iPod Touch Fourth Generation
//@"iPhone1,1" on iPhone
//@"iPhone1,2" on iPhone 3G
//@"iPhone2,1" on iPhone 3GS
//@"iPad1,1"   on iPad
//@"iPad2,1"   on iPad 2
//@"iPad3,1"   on 3rd Generation iPad
//@"iPhone3,1" on iPhone 4
//@"iPhone4,1" on iPhone 4S
- (NSString *)platformName {
	static NSString *name = nil;
	if (name == nil) {
		struct utsname systemInfo;
		uname(&systemInfo);
		name = [[NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding] retain];
	}
	return name;
}

@end
