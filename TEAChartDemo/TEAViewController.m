//
//  TEAViewController.m
//  TEAChartDemo
//
//  Created by Xhacker on 11/11/2013.
//  Copyright (c) 2013 Xhacker. All rights reserved.
//

#import "TEAViewController.h"

@interface TEAViewController ()

@property (weak, nonatomic) IBOutlet TEABarChart *barChart;
@property (weak, nonatomic) IBOutlet TEAContributionGraph *contributionGraph;
@property (weak, nonatomic) IBOutlet TEAClockChart *clockChart;

@end

@implementation TEAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Bar chart, the Storyboard way
    self.barChart.data = @[@3, @1, @4, @1, @5, @9, @2, @6, @5, @3];
    self.barChart.barSpacing = 10;
    self.barChart.barColors = @[[UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor]];
  
    // Bar chart, the code way
    TEABarChart *secondBarChart = [[TEABarChart alloc] initWithFrame:CGRectMake(35, 180, 100, 56)];
    secondBarChart.data = @[@2, @7, @1, @8, @2, @8];
    secondBarChart.xLabels = @[@"A", @"B", @"C", @"D", @"E", @"F"];
    [self.view addSubview:secondBarChart];

    // Contribution graph, the code way
    TEAContributionGraph *secondContributionGraph = [[TEAContributionGraph alloc] initWithFrame:CGRectMake(75, 430, 140, 140)];
    [self.view addSubview:secondContributionGraph];
    secondContributionGraph.showDayNumbers = YES;
    secondContributionGraph.delegate = self;

    // Clock chart
    self.clockChart.data = @[
        [TEATimeRange timeRangeWithStart:[NSDate date] end:[NSDate dateWithTimeIntervalSinceNow:3600]],
        [TEATimeRange timeRangeWithStart:[NSDate date] end:[NSDate dateWithTimeIntervalSinceNow:7200]],
        [TEATimeRange timeRangeWithStart:[NSDate date] end:[NSDate dateWithTimeIntervalSinceNow:10800]],
    ];
}

#pragma mark - TEAContributionGraphDataSource Methods

- (void)dateTapped:(NSDictionary *)dict
{
    NSLog(@"date: %@ -- value: %@", dict[@"date"], dict[@"value"]);
}

- (NSDate *)monthForGraph
{
    return [NSDate date];
}

- (NSInteger)valueForDay:(NSUInteger)day
{
    return day % 6;
}

@end
