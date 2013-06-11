//
//  MLLocationManage.h
//  Molearn
//
//  Created by chen jian on 3/28/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^MLLocationManagerLocationUpdateBlock)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation);

typedef void (^MLLocationManagerLocationUpdateFailBlock)(CLLocationManager *manager, NSError *error);

@protocol MLLocationManagerDelegate;
@interface MLLocationManage : NSObject

@property (nonatomic, assign) id<MLLocationManagerDelegate> delegate;

+ (MLLocationManage *)sharedInstance;

- (id)initWithUserDistanceFilter:(CLLocationDistance)userDistanceFilter
             userDesiredAccuracy:(CLLocationAccuracy)userDesiredAccuracy
                         purpose:(NSString *)purpose
                        delegate:(id<MLLocationManagerDelegate>)delegate;

- (void)startUpdatingLocation;
- (void)startUpdatingLocationWithBlock:(MLLocationManagerLocationUpdateBlock)block errorBlock:(MLLocationManagerLocationUpdateFailBlock)errorBlock;
- (void)updateUserLocation;
- (void)stopUpdatingLocation;


@end

@protocol MLLocationManagerDelegate <NSObject>
@optional
- (void)locationManager:(MLLocationManage *)manager didFailWithError:(NSError *)error;
- (void)locationManager:(MLLocationManage *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;
- (void)locationManager:(MLLocationManage *)manager didEnterRegion:(CLRegion *)region;
- (void)locationManager:(MLLocationManage *)manager didExitRegion:(CLRegion *)region;
- (void)locationManager:(MLLocationManage *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error;

@end

