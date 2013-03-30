//
//  UIViewController+Addition.m
//  module
//
//  Created by Lin Chi-Cheng on 13/3/29.
//  Copyright (c) 2013年 lifebaby. All rights reserved.
//

#import "UIViewController+StoryboardExtend.h"

@implementation UIView (Copy)

-(void) copyFromView:(UIView *)view
{
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (UIView *subview in view.subviews) {
        [self addSubview:subview];
    }
    self.backgroundColor = view.backgroundColor;
    
    // keep original view for access property .. use [view viewWithTag:9001]
    [view setTag:9001];
    [view setHidden:YES];
    [self addSubview:view];
}

@end

@implementation UIViewController (StoryboardExtend)

-(void) storyboardXibViewToXib
{
    for (UIView *v in [self.view subviews]) {
        NSString *c = [[v class] description];
        
        @try {
            UIView *_v = [[[NSBundle mainBundle] loadNibNamed:c owner:self options:nil] objectAtIndex:0];
            [v copyFromView:_v];
//            [[v subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
//            [v setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
//            [_v setFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
//            [v addSubview:_v];
        }
        @catch (NSException *exception) {
            
        }
    }
}

@end
