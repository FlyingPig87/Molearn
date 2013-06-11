//
//  MLAnnotation.h
//  Molearn
//
//  Created by chen jian on 4/1/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MLAnnotation : NSObject<MKAnnotation>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, assign, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end
