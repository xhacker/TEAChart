//
//  TEAContributionGraph.m
//  Xhacker
//
//  Created by Xhacker on 2013-07-28.
//  Copyright (c) 2013 Xhacker. All rights reserved.
//

#import "TEAContributionGraph.h"

static const NSInteger kDayInterval = 24 * 3600;

@implementation TEAContributionGraph

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
    _colors = @[[UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1],
                [UIColor colorWithRed:0.839 green:0.902 blue:0.522 alpha:1],
                [UIColor colorWithRed:0.549 green:0.776 blue:0.396 alpha:1],
                [UIColor colorWithRed:0.267 green:0.639 blue:0.251 alpha:1],
                [UIColor colorWithRed:0.118 green:0.408 blue:0.137 alpha:1]];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
    comp.day = 1;
    NSDate *firstDay = [calendar dateFromComponents:comp];
    
    comp.month = comp.month + 1;
    NSDate *nextMonth = [calendar dateFromComponents:comp];
    
    NSArray *weekdayNames = @[@"S", @"M", @"T", @"W", @"T", @"F", @"S"];
    [[UIColor colorWithWhite:0.56 alpha:1] setFill];
    NSInteger textHeight = self.width * 1.2;
    for (NSInteger i = 0; i < 7; i += 1) {
        [weekdayNames[i] drawInRect:CGRectMake(i * (self.width + self.spacing), 0, self.width, self.width) withFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:self.width * 0.65] lineBreakMode:NSLineBreakByClipping alignment:NSTextAlignmentCenter];
    }
    
    for (NSDate *date = firstDay; [date compare:nextMonth] == NSOrderedAscending; date = [date dateByAddingTimeInterval:kDayInterval]) {
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *comp = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth | NSCalendarUnitDay fromDate:date];
        NSInteger weekday = comp.weekday;
        NSInteger weekOfMonth = comp.weekOfMonth;
        NSInteger day = comp.day;
        
        NSInteger grade = 0;
        NSInteger contributions = day <= self.data.count ? [self.data[day-1] integerValue] : 0;
        if (contributions <= 0) grade = 0;
        else if (contributions <= 3) grade = 1;
        else if (contributions <= 6) grade = 2;
        else if (contributions <= 8) grade = 3;
        else grade = 4;
        
        [self.colors[grade] setFill];
        CGRect backgroundRect = CGRectMake((weekday - 1) * (self.width + self.spacing), (weekOfMonth - 1) * (self.width + self.spacing) + textHeight, self.width, self.width);
        CGContextFillRect(context, backgroundRect);
    }
}

#pragma mark Setters

- (void)setData:(NSArray *)data
{
    _data = data;
    [self setNeedsDisplay];
}

- (void)setColors:(NSArray *)colors
{
    _colors = colors;
    [self setNeedsDisplay];
}

- (void)setWidth:(NSInteger)width
{
    _width = width;
    [self setNeedsDisplay];
}

- (void)setSpacing:(NSInteger)spacing
{
    _spacing = spacing;
    [self setNeedsDisplay];
}

@end
