//
//  UINavigationControllerAdditions.h
//  iTravel
//
//  Created by COLD FRONT on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (CityGuide)<NSCoding>

- (id)duplicateWithNavigationBarClass:(Class)navigationBarClass;

@end
