//
//  MLPinAnnotationView.h
//  Molearn
//
//  Created by chen jian on 4/2/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import <MapKit/MapKit.h>

@protocol MLPinAnnotationDelegate <NSObject>

- (void)btnClick:(id<MKAnnotation>)annotation;

@end

@interface MLPinAnnotationView : MKPinAnnotationView


- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier withDelegate:(id<MLPinAnnotationDelegate>)delegate;

@end
