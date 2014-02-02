//
//  WaiViewController.m
//  WhereAmI2
//
//  Created by Arek Bolton on 1/29/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//

#import "WaiViewController.h"
#import "BNRMapPoint.h"

@interface WaiViewController ()

@end

@implementation WaiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc]init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [worldView setShowsUserLocation:YES];
    
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *myLocation = [locations objectAtIndex:0];
    NSLog (@" %@", myLocation);
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *) error
{
    NSLog(@"Could not find location: %@", error);
}

- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    if (t < -180) {
        return;
    }
    [self foundLocation:newLocation];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTextField setHidden:YES];
}

- (void) foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord title:[locationTextField text]];
    [worldView addAnnotation:mp];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    [locationTextField setText:@""];
    [activityIndicator stopAnimating];
    [locationTextField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}

@end
