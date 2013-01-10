//
//  TCTaskTableViewController.h
//  TimeChicken
//
//  Created by Christian Schäfer on 10.01.13.
//  Copyright (c) 2013 Sebastian Fröstl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TCTask;

@interface TCTaskTableViewController : UITableViewController

@property (strong, nonatomic) TCTask *detailItem;
@property (weak, nonatomic) IBOutlet UITextField *projectTextField;
@property (weak, nonatomic) IBOutlet UITextField *workedTimeTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITextField *dueDateTextView;


@end
