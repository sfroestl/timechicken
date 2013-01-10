//
//  TCTaskTableViewController.m
//  TimeChicken
//
//  Created by Christian Schäfer on 10.01.13.
//  Copyright (c) 2013 Sebastian Fröstl. All rights reserved.
//

#import "TCTaskTableViewController.h"
#import "TCTask.h"

@interface TCTaskTableViewController ()
-(void)configureView;
@end


@implementation TCTaskTableViewController


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
    //    [self.completeButton setBackgroundColor:[UIColor lightGrayColor]];
    NSLog(@"tasktablecontroller");
    
    if (self.detailItem) {
        self.titleTextField.text = self.detailItem.title;
        self.projectTextField.text = self.detailItem.project;
        self.workedTimeTextField.text = [NSString stringWithFormat: @"workedTime %d", self.detailItem.workedTime];
        self.descriptionTextField.text = self.detailItem.desc;
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"EEEE MMMM d, YYYY"];
        self.dueDateTextField.text = [dateFormat stringFromDate:self.detailItem.dueDate];
        
//        if(!self.detailItem.completed){
//            [self.completeButton setTitle:@"complete" forState:UIControlStateNormal];
//        } else {
//            [self.completeButton setTitle:@"reopen" forState:UIControlStateNormal];
//        }
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
     self.title = self.detailItem.title;
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)projectFieldTextChanged:(id)sender {
}

- (IBAction)workedTimeFieldTextChanged:(id)sender {
}

- (IBAction)dueDateFieldTextChanged:(id)sender {
}

- (IBAction)descriptionFieldTextChanged:(id)sender {
}

- (IBAction)titleFieldTextChanged:(id)sender {
}
@end