//
//  MoveViewController.h
//  module
//
//  Created by Lin Chi-Cheng on 13/3/26.
//  Copyright (c) 2013年 lifebaby. All rights reserved.
//

#import "MotionViewController.h"

@protocol MoveDelegate

@required
- (void)locationUpdate:(CLLocation *)location distance:(CLLocationDistance)distance;

@optional
- (void)locationError:(NSError *)error;

@end

@interface MoveViewController : MotionViewController<MoveDelegate>

@end
