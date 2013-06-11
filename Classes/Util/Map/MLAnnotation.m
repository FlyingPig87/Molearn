//
//  MLAnnotation.m
//  Molearn
//
//  Created by chen jian on 4/1/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import "MLAnnotation.h"
@interface MLAnnotation()
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@end

@implementation MLAnnotation

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
    self = [super init];
    if (self) {
        self.coordinate = coordinate;
    }
    return self;
}

- (void)dealloc {
    [_title release];
    [_detail release];
    [super dealloc];
}


@end
