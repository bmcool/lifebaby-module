//
//  UIViewController+Addition.m
//  module
//
//  Created by Lin Chi-Cheng on 13/3/29.
//  Copyright (c) 2013年 lifebaby. All rights reserved.
//

#import "UIViewController+StoryboardExtend.h"

@implementation UIViewController (StoryboardExtend)

-(void) storyboardXibViewToXib
{
    for (UIView *v in [self.view subviews]) {
        NSString *c = [[v class] description];
        
        @try {
            UIView *_v = [[[NSBundle mainBundle] loadNibNamed:c owner:self options:nil] objectAtIndex:0];
            [_v setFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
            [v addSubview:_v];
        }
        @catch (NSException *exception) {
            
        }
    }
}

@end
