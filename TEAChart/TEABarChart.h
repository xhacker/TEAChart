//
//  TEABarChart.h
//  Xhacker
//
//  Created by Xhacker on 2013-07-25.
//  Copyright (c) 2013 Xhacker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TEABarChart : UIView

// Array of NSNumber
@property (nonatomic) NSArray *data;

// Max y value for chart (only works when autoMax is NO)
@property (nonatomic) CGFloat max;

// Auto set max value
@property (nonatomic) BOOL autoMax;

@property (nonatomic) UIColor *barColor;
@property (nonatomic) NSInteger barSpacing;
@property (nonatomic) UIColor *backgroundColor;

// Round bar height to pixel for sharper chart
@property (nonatomic) BOOL roundToPixel;

@end
