//
//  TCDetailViewController.h
//  TimeChicken
//
//  Created by Sebastian Fröstl on 13.11.12.
//  Copyright (c) 2012 Sebastian Fröstl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TCTask;

@interface TaskDetailViewController : UIViewController

@property (strong, nonatomic) TCTask *detailItem;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descTextView;
@property (weak, nonatomic) IBOutlet UIButton *completeButton;

- (IBAction)textFieldTextChanged:(id)sender;
- (IBAction)titleFieldTextChanged:(id)sender;
- (IBAction)pressedCompleteButton:(id)sender;

@end
