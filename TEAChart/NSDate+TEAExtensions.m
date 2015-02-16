//
//  NSDate+TEAExtensions.m
//  TEAChartDemo
//
//  Created by Xhacker Liu on 1/31/14.
//  Copyright (c) 2014 Xhacker. All rights reserved.
//

#import "NSDate+TEAExtensions.h"

@implementation NSDate (TEAExtensions)

- (NSDate *)tea_nextDay
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = 1;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:TEACalendarIdentifierGregorian];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

@end
