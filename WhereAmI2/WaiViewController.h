//
//  WaiViewController.h
//  WhereAmI2
//
//  Created by Arek Bolton on 1/29/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WaiViewController : UIViewController
    <CLLocationManagerDelegate , MKMapViewDelegate, UITextFieldDelegate>

{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTextField;
}

-(void) findLocation;

-(void) foundLocation:(CLLocation *)loc;

@end
