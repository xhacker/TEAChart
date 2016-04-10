//
//  TEAClockChart.m
//  Xhacker
//
//  Created by Xhacker on 2013-07-27.
//  Copyright (c) 2013 Xhacker. All rights reserved.
//

#import "TEAClockChart.h"
#import "TEATimeRange.h"
#import "NSDate+TEAExtensions.h"

@implementation TEAClockChart

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadDefaults];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        [self loadDefaults];
    }
    return self;
}

- (void)loadDefaults
{
    self.opaque = NO;
    
    _fillColor = [UIColor colorWithRed:0.922 green:0.204 blue:0.239 alpha:0.25];
    _strokeColor = [UIColor colorWithWhite:0.85 alpha:1];
    _borderWidth = 2;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat radius = MIN(CGRectGetWidth(rect), CGRectGetHeight(rect)) / 2;
    CGFloat originX = CGRectGetWidth(rect) / 2;
    CGFloat originY = CGRectGetHeight(rect) / 2;
        
    // draw sectors
    [self.fillColor setFill];
    [self.data enumerateObjectsUsingBlock:^(TEATimeRange *timeRange, NSUInteger idx, BOOL *stop) {
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:TEACalendarIdentifierGregorian];
        NSDateComponents *startComp = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:timeRange.start];
        NSDateComponents *endComp = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:timeRange.end];
        CGFloat startMinutes = startComp.hour * 60 + startComp.minute;
        CGFloat endMinutes = endComp.hour * 60 + endComp.minute;
        
        CGContextBeginPath(context);
        CGFloat startAngle = startMinutes / (24 * 60) * (2 * M_PI) - M_PI_2;
        
        // use 26 mins for pomo instead of 30 to prevent small overlaps
        CGFloat endAngle = endMinutes / (24 * 60) * (2 * M_PI) - M_PI_2;
        
        // UIView flips the Y-coordinate, so 0 is actually clockwise
        CGContextAddArc(context, originX, originY, radius * 0.9, startAngle, endAngle, 0);
        CGContextAddLineToPoint(context, originX, originY);
        CGContextFillPath(context);
    }];
    
    // draw ring
    CGContextSetLineWidth(context, self.borderWidth);
    [self.strokeColor setStroke];
    CGFloat margin = 0.1;
    CGContextAddEllipseInRect(context, CGRectMake(originX - radius * (1 - margin), originY - radius * (1 - margin), 2 * (1 - margin) * radius, 2 * (1 - margin) * radius));
    CGContextStrokePath(context);
    
    // draw scales
    CGContextSetLineWidth(context, 1);
    for (NSInteger i = 0; i < 24; i += 1) {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, originX, originY);
        CGContextRotateCTM(context, i * M_PI / 12);
        CGContextMoveToPoint(context, 0, radius);
        CGFloat lengthFactor = i % 6 == 0 ? 0.08 : 0.04;
        CGContextAddLineToPoint(context, 0, radius - radius * lengthFactor);
        CGContextStrokePath(context);
        CGContextRestoreGState(context);
    }
}

#pragma mark Setters

- (void)setData:(NSArray *)data
{
    _data = data;
    [self setNeedsDisplay];
}

- (void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
    [self setNeedsDisplay];
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
    _strokeColor = strokeColor;
    [self setNeedsDisplay];
}

@end
