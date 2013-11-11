//
//  TEATimeRange.m
//  TEAChartDemo
//
//  Created by Xhacker on 11/12/2013.
//  Copyright (c) 2013 Xhacker. All rights reserved.
//

#import "TEATimeRange.h"

@implementation TEATimeRange

+ (instancetype)timeRangeWithStart:(NSDate *)startTime end:(NSDate *)endTime
{
    return [[TEATimeRange alloc] initWithStart:startTime end:endTime];
}

- (id)initWithStart:(NSDate *)startTime end:(NSDate *)endTime
{
    self = [super init];
    if (self) {
        _start = startTime;
        _end = endTime;
    }
    return self;
}

@end
