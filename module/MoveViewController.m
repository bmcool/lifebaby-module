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
        CLLocationDistance distance = [newLocation distanceFromLocation:oldLocation];
        if (distance > 0 && newLocation.speed > 0) {
            [self locationUpdate:newLocation distance:distance];
        }
    }
}

-(void) locationUpdate:(CLLocation *)location distance:(CLLocationDistance)distance
{
    NSLog(@"Not Implemented %s", __FUNCTION__);
}

-(void) locationError:(NSError *)error
{
    NSLog(@"Not Implemented %s", __FUNCTION__);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [self locationError:error];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
