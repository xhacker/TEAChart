//
//  TEAContributionGraph.h
//  Xhacker
//
//  Created by Xhacker on 2013-07-28.
//  Copyright (c) 2013 Xhacker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TEAContributionGraph : UIView

@property (nonatomic) NSArray *data; // array of integers (wrapped by NSNumber)

@property (nonatomic) NSArray *colors; // array of UIColor, 5 elements
@property (nonatomic) NSInteger width;
@property (nonatomic) NSInteger spacing;

@end
