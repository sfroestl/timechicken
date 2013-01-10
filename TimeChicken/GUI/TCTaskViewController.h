//
//  TCDetailViewController.h
//  TimeChicken
//
//  Created by Sebastian Fröstl on 13.11.12.
//  Copyright (c) 2012 Sebastian Fröstl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TCTask;

@interface TCTaskViewController : UIViewController

@property (strong, nonatomic) TCTask *detailItem;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *projectTextField;
@property (weak, nonatomic) IBOutlet UITextField *dueDateTextField;
@property (weak, nonatomic) IBOutlet UILabel *workedTimeLabel;

@property (weak, nonatomic) IBOutlet UIButton *completeButton;

- (IBAction)textFieldTextChanged:(id)sender;
- (IBAction)titleFieldTextChanged:(id)sender;
- (IBAction)pressedCompleteButton:(id)sender;
- (IBAction)projectFieldTextChanged:(id)sender;
- (IBAction)dueDateFieldTextChanged:(id)sender;

@end
