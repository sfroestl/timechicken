//
//  TCDetailViewController.m
//  TimeChicken
//
//  Created by Sebastian Fröstl on 13.11.12.
//  Copyright (c) 2012 Sebastian Fröstl. All rights reserved.
//

#import "TCTaskViewController.h"
#import "TCTask.h"

@interface TCTaskViewController ()
- (void)configureView;
@end

@implementation TCTaskViewController

@synthesize detailItem = _detailItem;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    
    if (self.detailItem) {
        self.title = self.detailItem.title;
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"EEEE MMMM d, YYYY"];
        self.projectDetails.text
            = [NSString stringWithFormat: @"Project: %@\nDueDate: %@\nworkedTime: %d",self.detailItem.project,[dateFormat stringFromDate:self.detailItem.dueDate],self.detailItem.workedTime];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
