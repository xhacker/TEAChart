//
//  TEATimeRange.h
//  TEAChartDemo
//
//  Created by Xhacker on 11/12/2013.
//  Copyright (c) 2013 Xhacker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TEATimeRange : NSObject

@property (nonatomic) NSDate *start;
@property (nonatomic) NSDate *end;

+ (instancetype)timeRangeWithStart:(NSDate *)startTime end:(NSDate *)endTime;

- (id)initWithStart:(NSDate *)startTime end:(NSDate *)endTime;

@end
