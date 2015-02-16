//
//  NSDate+TEAExtensions.h
//  TEAChartDemo
//
//  Created by Xhacker Liu on 1/31/14.
//  Copyright (c) 2014 Xhacker. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __IPHONE_8_0
#define TEACalendarIdentifierGregorian NSCalendarIdentifierGregorian
#else
#define TEACalendarIdentifierGregorian NSGregorianCalendar
#endif

@interface NSDate (TEAExtensions)

- (NSDate *)tea_nextDay;

@end
