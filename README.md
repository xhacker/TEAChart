# TEAChart

Simple and intuitive iOS chart library, for the upcoming [Pomotodo](http://pomotodo.com/) app. **Contribution graph**, **clock chart**, and **bar chart**.

Supports Storyboard.

## Usage

See the header files for complete documents.

### Contribution Graph

![Contribution Graph](http://i.imgur.com/9JsSt23.png)

The contribution graph mimics the GitHub one. You can implement the TEAContributionGraphDataSource to customize the style of the graph. 
The methods required to customize it are:
```objective-c
// The DataSource should return an NSDate that occurs inside the month to graph
- (NSDate *)monthForGraph;

// The day variable is an integer from 1 to the last day of the month given by monthForGraph
// Return the value to graph for each calendar day or 0.
- (NSInteger)valueForDay:(NSUInteger)day;
```
There are currently three more DataSource methods to customize the coloring of the graph. 
Each grade is represented by a different color.
```objective-c
// Defines the number of distinct colors in the graph
- (NSUInteger)numberOfGrades;

// Defines what color should be used by each grade.
- (UIColor *)colorForGrade:(NSUInteger)grade;

// Defines the cutoff values used for translating values into grades.
// For example, you may want different grades for the values grade==0, 1 <= grade < 5, 5 <= grade.
// This means there are three grades total
// The minimumValue for the first grade is 0, the minimum for the second grade is 1, and the minimum for the third grade is 5
- (NSInteger)minimumValueForGrade:(NSUInteger)grade;
```

Here is a simple sample of implementing the DataSource required methods after connecting the DataSource in InterfaceBuilder.
I will add delegate methods to adjust the width and spacing in a future release.
```objective-c
// This sample uses Storyboard
@property (weak, nonatomic) IBOutlet TEAContributionGraph *contributionGraph;

// Contribution graph
self.contributionGraph.width = 12;
self.contributionGraph.spacing = 6;

#pragma mark - TEAContributionGraphDataSource Methods
- (NSDate *)monthForGraph
{
	// Graph the current month
    return [NSDate date];
}

- (NSInteger)valueForDay:(NSUInteger)day
{
	// Return 0-5
    return day % 6;
}
```

### Clock Chart

![Clock Chart](http://i.imgur.com/dbk0a5f.png)

```objective-c
// This sample uses Storyboard
@property (weak, nonatomic) IBOutlet TEAClockChart *clockChart;

self.clockChart.data = @[
    [TEATimeRange timeRangeWithStart:[NSDate date] end:[NSDate dateWithTimeIntervalSinceNow:3600]],
    // ...
];
```

### Bar Chart

![Bar Chart](http://i.imgur.com/ScJksKh.png)

Just a bar chart, no label, no interaction, no animation.

```objective-c
#import "TEAChart.h"

TEABarChart *barChart = [[TEABarChart alloc] initWithFrame:CGRectMake(20, 20, 100, 40)];
barChart.data = @[@2, @7, @1, @8, @2, @8];
[self.view addSubview:barChart];
```

## Installation

Use CocoaPods:

```ruby
pod 'TEAChart'
```

Or drag **TEAChart** folder into your project.

## Contribution

Pull requests are welcome! If you want to do something big, please open an issue first.

## License

MIT
