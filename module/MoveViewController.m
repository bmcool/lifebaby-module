//
//  MoveViewController.m
//  module
//
//  Created by Lin Chi-Cheng on 13/3/26.
//  Copyright (c) 2013年 lifebaby. All rights reserved.
//

#import "MoveViewController.h"

@interface MoveViewController ()

@end

@implementation MoveViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if (newLocation.horizontalAccuracy > 0)
    {
        NSLog(@"newLocation.coordinate.latitude = %f", newLocation.coordinate.latitude);
        NSLog(@"newLocation.coordinate.latitude = %f", newLocation.coordinate.longitude);
        NSLog(@"newLocation.coordinate.latitude = %f", newLocation.altitude);
        
        NSLog(@"oldLocation.coordinate.latitude = %f", oldLocation.coordinate.latitude);
        NSLog(@"oldLocation.coordinate.latitude = %f", oldLocation.coordinate.longitude);
        NSLog(@"oldLocation.coordinate.latitude = %f", oldLocation.altitude);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
