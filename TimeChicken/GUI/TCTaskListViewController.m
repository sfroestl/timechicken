//
//  TCMasterViewController.m
//  TimeChicken
//
//  Created by Sebastian Fröstl on 13.11.12.
//  Copyright (c) 2012 Sebastian Fröstl. All rights reserved.
//

#import "TCTaskListViewController.h"

#import "TCTaskTableViewController.h"

#import "TCTask.h"

@implementation TCTaskListViewController

@synthesize taskList = _taskList;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    NSLog(@"TCTaskListViewController: viewDidLoad");
    [super viewDidLoad];
    
    self.title = @"Your Tasks";
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]                                              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd                                              target:self action:@selector(addTapped:)];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.taskList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    TCTask *task = [self.taskList objectAtIndex:indexPath.row];
    cell.textLabel.text = task.title;
//    cell.imageView.image = task.thumbImage;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // deletes Item in data model
        [_taskList removeObjectAtIndex:indexPath.row];
        // deletes Item in table view
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should be re-orderable.
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    TCTaskTableViewController *taskDetailController = segue.destinationViewController;
    TCTask *task = [self.taskList objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    taskDetailController.detailItem = task;
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    TCTaskTableViewController *detailController =segue.destinationViewController;
//    TCTask *task = [self.taskList objectAtIndex:self.tableView.indexPathForSelectedRow.row];
//    detailController.detailItem = task;
//}

- (void)addTapped:(id)sender {
    TCTask *newTask = [[TCTask alloc] initWithTitle:@"New Task" desc:nil project:nil dueDate:nil];
    [self.taskList addObject:newTask];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_taskList.count-1 inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:YES];
    
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    [self performSegueWithIdentifier:@"TaskListToTaskSegue" sender:self];
}

@end
