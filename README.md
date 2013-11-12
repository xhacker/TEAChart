# TEAChart

Simple and intuitive iOS chart library, for the upcoming [Pomotodo](http://pomotodo.com/) app. **Contribution graph**, **clock chart**, and **bar chart**.

Supports Storyboard.

## Usage

See the header files for complete documents.

### Contribution Graph

![Contribution Graph](http://i.imgur.com/9JsSt23.png)

The contribution graph mimics the GitHub one. Currently lacks of customization options.

```objective-c
// This sample uses Storyboard
@property (weak, nonatomic) IBOutlet TEAContributionGraph *contributionGraph;

self.contributionGraph.width = 12;
self.contributionGraph.spacing = 6;
self.contributionGraph.data = @[@3, @1, @4, @1, @1, @4, @1, @5, @0, @5, @6, @3, @1, @4, @1, @5, @9, @2, @6, @0, @2, @6, @3, @2, @3, @1, @4, @1, @5, @9];
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
