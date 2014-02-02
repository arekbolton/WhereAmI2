//
//  BNRMapPoint.m
//  WhereAmI2
//
//  Created by Arek Bolton on 2/2/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//

#import "BNRMapPoint.h"


@implementation BNRMapPoint

@synthesize coordinate, title;

- (id) initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    if (self) {
        coordinate = c;
        [self setTitle:t];
    }
    
    return self;
}

-(id) init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}



@end
