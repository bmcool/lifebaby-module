//
//  ViewController.h
//  Pedometer
//
//  Created by Peter de Tagyos on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShakeDelegate

@optional
-(void) incrNumSteps;

@end

@interface ShakeViewController : UIViewController <UIAccelerometerDelegate, ShakeDelegate> {
    float px;
    float py;
    float pz;

    BOOL isChange;
    BOOL isSleeping;
}

@property (assign, nonatomic) int numSteps;

@end