//
//  Station.m
//  module-test
//
//  Created by Lin Chi-Cheng on 13/3/28.
//  Copyright (c) 2013年 lifebaby. All rights reserved.
//

#import "Station.h"

@implementation Station

-(id) initWithDictionary:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        _cacheData = data;
        
        self.weather = [Weather new];
        
        [self setValuesForKeysWithDictionary:[_cacheData objectForKey:@"main"]];
        [self.weather setValuesForKeysWithDictionary:[[_cacheData objectForKey:@"weather"] objectAtIndex:0]];
    }
    return self;
}

-(CGFloat) tempC
{
    return self.temp - 273.15;
}

-(CGFloat) tempF
{
    return self.temp * 9/5 - 459.67;
}

@end
