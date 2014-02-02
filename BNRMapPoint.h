//
//  BNRMapPoint.h
//  WhereAmI2
//
//  Created by Arek Bolton on 2/2/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject
{
}

- (id)initWithCoordinate: (CLLocationCoordinate2D)c title:(NSString *) t;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic, readonly) NSString *title;

@end
