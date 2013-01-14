//
//  TCMasterViewController.m
//  TimeChicken
//
//  Created by Sebastian Fröstl on 13.11.12.
//  Copyright (c) 2012 Sebastian Fröstl. All rights reserved.
//

#import "TCTaskListViewController.h"

#import "TCTaskViewController.h"
#import "TCTaskStore.h"
#import "TCTask.h"

@implementation TCTaskListViewController


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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTapped:)];
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
    return [[[TCTaskStore taskStore] openTasks] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    TCTask *task = [[[TCTaskStore taskStore] openTasks] objectAtIndex:indexPath.row];
    cell.textLabel.text = task.title;
    cell.detailTextLabel.text = task.desc;
//    cell.imageView.image = task.thumbImage;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    [[TCTaskStore taskStore] moveTaskAtIndexInOpenTasks:[fromIndexPath row]toIndex:[toIndexPath row]];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete task in data model
        TCTaskStore *ts = [TCTaskStore taskStore];
        NSArray *tasks = [ts openTasks];
        TCTask *task = [tasks objectAtIndex:[indexPath row]];
        [ts removeTaskFromOpenTasks:task];
        
        // Remove row from table view with an animation
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should be re-orderable.
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TCTaskViewController *detailController = segue.destinationViewController;
    TCTask *task = [[[TCTaskStore taskStore] openTasks] objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    detailController.detailItem = task;
}

- (void)addTapped:(id)sender {
    TCTask *newTask = [[TCTaskStore taskStore] createNewTask];    
    // Figure out where that item is in the array
    int lastRow = [[[TCTaskStore taskStore] openTasks] indexOfObject:newTask];
    NSIndexPath *ip = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    // insert new row into table
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip ] withRowAnimation:UITableViewRowAnimationRight ];
    
//    [self.tableView selectRowAtIndexPath:ip animated:YES scrollPosition:UITableViewScrollPositionMiddle];
//    [self performSegueWithIdentifier:@"MySegue" sender:self];
}

@end
