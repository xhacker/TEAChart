//
//  TEABarChart.m
//  Xhacker
//
//  Created by Xhacker on 2013-07-25.
//  Copyright (c) 2013 Xhacker. All rights reserved.
//

#import "TEABarChart.h"

@implementation TEABarChart

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
    
    _autoMax = YES;
    _barColor = [UIColor colorWithRed:106.0/255 green:175.0/255 blue:232.0/255 alpha:1];
    _barSpacing = 8;
    _backgroundColor = [UIColor colorWithWhite:0.97 alpha:1];
    _roundToPixel = YES;
}

- (void)drawRect:(CGRect)rect
{    
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    double max = self.autoMax ? [[self.data valueForKeyPath:@"@max.self"] doubleValue] : self.max;
    CGFloat barMaxHeight = CGRectGetHeight(rect);
    NSInteger numberOfBars = self.data.count;
    CGFloat barWidth = (CGRectGetWidth(rect) - self.barSpacing * (numberOfBars - 1)) / numberOfBars;
    
    for (NSInteger i = 0; i < numberOfBars; i += 1) {
        CGFloat barHeight = barMaxHeight * [self.data[i] floatValue] / max;
        if (barHeight > barMaxHeight) {
            barHeight = barMaxHeight;
        }
        if (self.roundToPixel) {
            barHeight = (int)barHeight;
        }
        
        [self.backgroundColor setFill];
        CGRect backgroundRect = CGRectMake(i * (barWidth + self.barSpacing), 0, barWidth, barMaxHeight);
        CGContextFillRect(context, backgroundRect);
        
        [self.barColor setFill];
        CGRect barRect = CGRectMake(i * (barWidth + self.barSpacing), barMaxHeight - barHeight, barWidth, barHeight);
        CGContextFillRect(context, barRect);
    }
}

#pragma mark Setters

- (void)setData:(NSArray *)data
{
    _data = data;
    [self setNeedsDisplay];
}

- (void)setMax:(CGFloat)max
{
    _max = max;
    [self setNeedsDisplay];
}

- (void)setAutoMax:(BOOL)autoMax
{
    _autoMax = autoMax;
    [self setNeedsDisplay];
}

- (void)setBarColor:(UIColor *)barColor
{
    _barColor = barColor;
    [self setNeedsDisplay];
}

- (void)setBarSpacing:(NSInteger)barSpacing
{
    _barSpacing = barSpacing;
    [self setNeedsDisplay];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
    [self setNeedsDisplay];
}

@end
