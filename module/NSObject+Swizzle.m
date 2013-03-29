//
//  NSObject+Swizzle.m
//  module
//
//  Created by Lin Chi-Cheng on 13/3/29.
//  Copyright (c) 2013年 lifebaby. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import "MethodSwizzle.h"

@implementation NSObject (Swizzle)
+ (void)swizzleMethod:(SEL)orig_sel withMethod:(SEL)alt_sel {
    NSString *originalMethodName = [NSString stringWithUTF8String:sel_getName(orig_sel)];
    NSString *alternateMethodName = [NSString stringWithUTF8String:sel_getName(alt_sel)];
    NSLog(@"Attempting to swizzle in class '%@': swapping method '%@' with '%@'...",[self class], originalMethodName, alternateMethodName);
	
    Swizzle([self class], orig_sel, alt_sel);
}

@end