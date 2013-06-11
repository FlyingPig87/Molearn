//
//  MLMapViewController.m
//  Molearn
//
//  Created by chen jian on 3/28/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import "MLMapViewController.h"
#import <MapKit/MapKit.h>
#import "MLLocationManage.h"
#import "MLAnnotation.h"
#import "MLPinAnnotationView.h"
#import "MLShopDetailViewController.h"

#import "MLFileManage.h"

@interface MLMapViewController()<MKMapViewDelegate, MLPinAnnotationDelegate>

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) NSArray *shopPois;

@end

@implementation MLMapViewController

- (id)initWithPois:(NSArray *)pois {
    self = [super init];
    if (self) {
        self.shopPois = [NSArray arrayWithArray:pois];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView = [[[MKMapView alloc] initWithFrame:self.view.bounds] autorelease];
    _mapView.mapType = MKMapTypeStandard;
    _mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    [self.view addSubview:_mapView];
    
    [[MLLocationManage sharedInstance] startUpdatingLocationWithBlock:^(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation) {
//        CLLocationCoordinate2D coor = CLLocationCoordinate2DMake(31.224546+ 1/rand(),121.429138 + 1/rand());
//        [_mapView setCenterCoordinate:coor animated:NO];
//        MKCoordinateRegion userLocation = MKCoordinateRegionMakeWithDistance(coor, 100.0, 100.0);
//        [self.mapView setRegion:userLocation animated:NO];
    } errorBlock:^(CLLocationManager *manager, NSError *error) {
        NSLog(@"user close the location");
    }];
    
    [self addPois:self.shopPois];
    
    UIButton *currentBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    currentBtn.frame = CGRectMake(0, 0, 40, 40);
    [currentBtn addTarget:self action:@selector(currentLocation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:currentBtn];
}

- (void)addPois:(NSArray *)pois {
    NSMutableArray *shopItems = [NSMutableArray arrayWithCapacity:pois.count];
    
    for (int i = 0; i<10; i++) {
        MLAnnotation *anotation = [[MLAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(31.224546+ 0.001*i,121.429138 + rand()%1)];
        anotation.title = [NSString stringWithFormat:@"anotation:%d \n ddsadassaadsaasd sad test",i];
//        anotation.detail = [NSString stringWithFormat:@"test"];
        [shopItems addObject:anotation];
    }
    [_mapView addAnnotations:shopItems];
    MKCoordinateRegion region = LPCoordinateRegionForAnnotations(shopItems);
    [_mapView setRegion:region];
}

- (void)currentLocation {
//    [[MLLocationManage sharedInstance] updateUserLocation];
//    [[MLFileManage sharedInstance] test];
    [[MLFileManage sharedInstance] start];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MLAnnotation class]]) {
        MLPinAnnotationView *view = [[[MLPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"anotaion"withDelegate:self] autorelease];
        return view;
    }
    return nil;
}

- (void)btnClick:(id<MKAnnotation>)annotation {
    MLShopDetailViewController *detail = [[MLShopDetailViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
}

#pragma mark - mapRegion
MKCoordinateRegion LPCoordinateRegionForAnnotations(NSArray *annotations) {
	MKCoordinateRegion region;
	MKMapRect rect = {0};
	for (int i = 0; i < annotations.count; ++i) {
		CLLocationCoordinate2D coord = [(MLAnnotation *)[annotations objectAtIndex:i] coordinate];
		MKMapPoint p = MKMapPointForCoordinate(coord);
		double t = 500 / MKMetersPerMapPointAtLatitude(coord.latitude);
		MKMapRect r =  MKMapRectMake(p.x - t / 2, p.y - t / 2, t, t);
//        NSLog(@"t:%f,\n r:%@",t,NSStringFromCGRect([MLMapViewController convert:r]));
		if (i == 0) {
			region = MKCoordinateRegionMakeWithDistance(coord, 2000, 2000);
			rect = r;
		} else {
			rect = MKMapRectUnion(rect, r);
		}
	}
	if (annotations.count > 1) {
		region = MKCoordinateRegionForMapRect(rect);
	}
	return region;
}


- (void)viewDidUnload {
    self.mapView = nil;
}

- (void)dealloc {
    [_shopPois release];
    [_mapView release];
    [super dealloc];
}

@end
