//
//  TEAViewController.m
//  TEAChartDemo
//
//  Created by Xhacker on 11/11/2013.
//  Copyright (c) 2013 Xhacker. All rights reserved.
//

#import "TEAViewController.h"
#import "TEAChart.h"

@interface TEAViewController ()

@property (weak, nonatomic) IBOutlet TEABarChart *barChart;

@end

@implementation TEAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.barChart.data = @[@3, @1, @4, @1, @5, @9, @2, @6, @5, @3];
    self.barChart.barSpacing = 10;
}

@end
