//
//  MLLocationManage.m
//  Molearn
//
//  Created by chen jian on 3/28/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import "MLLocationManage.h"
#import <CoreLocation/CoreLocation.h>

@interface MLLocationManage()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *manage;

@property (nonatomic, assign) BOOL isUpdatingUserLocation;
@property (nonatomic, assign) BOOL isNeedOnceRefresh;

@property (nonatomic, copy) MLLocationManagerLocationUpdateBlock locationBlock;
@property (nonatomic, copy) MLLocationManagerLocationUpdateFailBlock failedBlock;

@end


@implementation MLLocationManage

+ (MLLocationManage *)sharedInstance {
    static MLLocationManage *__locationManage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __locationManage = [[MLLocationManage alloc] init];
    });
    return __locationManage;
}

#pragma mark - init 

#define kDefaultDistanceFilter kCLLocationAccuracyBestForNavigation
#define kDefaultUserDesiredAccuracy kCLLocationAccuracyBest

- (id)init {
    self = [super init];
    if (self) {
        [self _init];
    }
    return self;
}

- (void)_init {
    self.manage = [[CLLocationManager alloc] init];
    self.manage.distanceFilter = kDefaultDistanceFilter;
    self.manage.desiredAccuracy = kDefaultUserDesiredAccuracy;
    self.manage.delegate = self;
    self.isNeedOnceRefresh = NO;
    self.isUpdatingUserLocation = NO;
}

- (id)initWithUserDistanceFilter:(CLLocationDistance)userDistanceFilter userDesiredAccuracy:(CLLocationAccuracy)userDesiredAccuracy purpose:(NSString *)purpose delegate:(id<MLLocationManagerDelegate>)delegate {
    if (self = [super init]) {
        [self _init];
        self.manage.distanceFilter = userDistanceFilter;
        self.manage.desiredAccuracy = userDesiredAccuracy;
        self.delegate = delegate;
    }
    return self;
}

#pragma mark - updateLocation methods

- (void)startUpdatingLocation {
    _isUpdatingUserLocation = YES;
    self.isNeedOnceRefresh = YES;
    [self.manage startUpdatingLocation];
}

- (void)startUpdatingLocationWithBlock:(MLLocationManagerLocationUpdateBlock)block
                            errorBlock:(MLLocationManagerLocationUpdateFailBlock)errorBlock {
    self.locationBlock = block;
    self.failedBlock = errorBlock;
    [self startUpdatingLocation];
}

- (void)updateUserLocation {
    [self startUpdatingLocation];
}

- (void)stopUpdatingLocation {
    _isUpdatingUserLocation = NO;
    _isNeedOnceRefresh = NO;
    [self.manage stopUpdatingLocation];
}

#pragma mark - locationManage delegate

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    if (self.isNeedOnceRefresh) {
        [self stopUpdatingLocation];
        if (self.locationBlock != nil) {
            _locationBlock(manager,newLocation,oldLocation);
        }
        
        if ([self.delegate respondsToSelector:@selector(locationManager:didUpdateToLocation:fromLocation:)]) {
            [_delegate locationManager:self didUpdateToLocation:newLocation fromLocation:oldLocation];
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    [self stopUpdatingLocation];
    
    if (self.failedBlock != nil) {
        _failedBlock(manager,error);
    }
    
    if ([self.delegate respondsToSelector:@selector(locationManager:didFailWithError:)]) {
        [_delegate locationManager:self didFailWithError:error];
    }
}



@end
