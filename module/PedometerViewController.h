//
//  ViewController.h
//  Pedometer
//
//  Created by Peter de Tagyos on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PedometerDelegate

@optional
-(void) incrNumSteps;

@end

@interface PedometerViewController : UIViewController <UIAccelerometerDelegate, PedometerDelegate> {
    float px;
    float py;
    float pz;

    BOOL isChange;
    BOOL isSleeping;
}

@property (assign, nonatomic, readonly) int numSteps;

-(void) resetNumSteps;

@end
