//
//  ViewController.m
//  Pedometer
//
//  Created by Peter de Tagyos on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PedometerViewController.h"

#define kUpdateFrequency    60.0

@implementation PedometerViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Enable listening to the accelerometer
    [[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0 / kUpdateFrequency];
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
    
    px = py = pz = 0;
    _numSteps = 0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

#pragma mark -
#pragma mark - Orientation methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark - UIAccelerometerDelegate methods

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    float xx = acceleration.x;
    float yy = acceleration.y;
    float zz = acceleration.z;
        
    float dot = (px * xx) + (py * yy) + (pz * zz);
    float a = ABS(sqrt(px * px + py * py + pz * pz));
    float b = ABS(sqrt(xx * xx + yy * yy + zz * zz));
    
    dot /= (a * b);
    
    if (dot <= 0.82) {
        if (!isSleeping) {
            isSleeping = YES;
            [self performSelector:@selector(wakeUp) withObject:nil afterDelay:0.3];
            [self incrNumSteps];
        }
    }
    
    px = xx; py = yy; pz = zz;
    
}

#pragma mark -
#pragma mark - Private methods

- (void)wakeUp {
    isSleeping = NO;
}

#pragma mark -
#pragma mark - Public methods

-(void) resetNumSteps
{
    _numSteps = 0;
}

#pragma mark -
#pragma mark - PedometerDelegate optional methods

-(void) incrNumSteps
{
    _numSteps += 1;
}

#pragma mark -
#pragma mark - dealloc

-(void)dealloc
{
    [[UIAccelerometer sharedAccelerometer] setDelegate:nil];
}

@end
