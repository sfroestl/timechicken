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

    if (self.detailItem) {
        self.titleTextField.text = self.detailItem.title;
        self.textField.text = self.detailItem.desc;
        if(!self.detailItem.completed){
            [self.completeButton setTitle:@"Done!" forState:UIControlStateNormal];
        } else {
            [self.completeButton setTitle:@"Reopen!" forState:UIControlStateNormal];
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
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}
@end
