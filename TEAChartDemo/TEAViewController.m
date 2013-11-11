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
    
    // Line chart, the Storyboard way
    self.barChart.data = @[@3, @1, @4, @1, @5, @9, @2, @6, @5, @3];
    self.barChart.barSpacing = 10;
    
    // Line chart, the code way
    TEABarChart *secondBarChart = [[TEABarChart alloc] initWithFrame:CGRectMake(35, 180, 100, 40)];
    secondBarChart.data = @[@2, @7, @1, @8, @2, @8];
    [self.view addSubview:secondBarChart];
}

@end
