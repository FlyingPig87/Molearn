//
//  MLPinAnnotationView.m
//  Molearn
//
//  Created by chen jian on 4/2/13.
//  Copyright (c) 2013 cj. All rights reserved.
//

#import "MLPinAnnotationView.h"
#import "MLAnnotation.h"

@interface MLPinAnnotationView()

@property (nonatomic, assign) id<MLPinAnnotationDelegate> delegate;
@property (nonatomic, assign) id<MKAnnotation> annotation;

@end

@implementation MLPinAnnotationView

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier withDelegate:(id<MLPinAnnotationDelegate>)delegate {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *icon = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home"]] autorelease];
        [icon sizeToFit];
        self.leftCalloutAccessoryView = icon;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [btn addTarget:self action:@selector(pushToDetail) forControlEvents:UIControlEventTouchUpInside];
        self.rightCalloutAccessoryView = btn;
        self.canShowCallout = YES;
        self.pinColor = MKPinAnnotationColorPurple;
        self.animatesDrop = YES;
        
        self.delegate = delegate;
        self.annotation = annotation;
    }
    return self;
}

- (void)pushToDetail {
    if ([_delegate respondsToSelector:@selector(btnClick:)]) {
        [_delegate btnClick:self.annotation];
    }
}

@end
