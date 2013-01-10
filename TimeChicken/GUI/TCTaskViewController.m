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
//    [self.completeButton setBackgroundColor:[UIColor lightGrayColor]];
    

    if (self.detailItem) {
        self.titleTextField.text = self.detailItem.title;
        self.textField.text = self.detailItem.desc;
        self.projectTextField.text = self.detailItem.project;
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"EEEE MMMM d, YYYY"];
        self.dueDateTextField.text = [dateFormat stringFromDate:self.detailItem.dueDate];
        self.title = [NSString stringWithFormat: @"workedTime %d", self.detailItem.workedTime];
        if(!self.detailItem.completed){
            [self.completeButton setTitle:@"complete" forState:UIControlStateNormal];
        } else {
            [self.completeButton setTitle:@"reopen" forState:UIControlStateNormal];
        }
    }
}

- (void)viewDidLoad
{
    
    self.title = self.detailItem.title;
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldTextChanged:(id)sender {
    self.detailItem.desc = self.textField.text;
}

- (IBAction)titleFieldTextChanged:(id)sender {
    self.detailItem.title = self.titleTextField.text;

}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)pressedCompleteButton:(id)sender {
    if(self.detailItem.completed) {
        self.detailItem.completed = NO;
        [self configureView];
    } else {
        self.detailItem.completed = YES;
        [self configureView];
    }
}

- (IBAction)projectFieldTextChanged:(id)sender {
    self.detailItem.project = self.projectTextField.text;
}

- (IBAction)dueDateFieldTextChanged:(id)sender {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMdd"];
    NSDate *date = [dateFormat dateFromString:self.dueDateTextField.text];
    self.detailItem.dueDate = date;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}
@end
