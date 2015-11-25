//
//  QuestionViewController.m
//  Memoir
//
//  Created by dima on 25.11.15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

#import "SettingsViewController.h"
#import "AppDelegate.h"
#import "User.h"

@interface SettingsViewController ()

@property (strong, nonatomic) AppDelegate *app;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
  
  [super viewDidLoad];
  self.app = [[UIApplication sharedApplication] delegate];

  [self userControlChanged:nil];
}

- (IBAction)userControlChanged:(UISegmentedControl *)sender {
  
  NSUInteger index;
  if (sender) {
    index = sender.selectedSegmentIndex;
  } else {
    index = self.userControl.selectedSegmentIndex;
  }
  
  NSString *userId = @"";
  switch (index) {
    case 0:
      userId = @"1";
      break;
    case 1:
      userId = @"2";
      break;
    case 2:
      userId = @"3";
      break;
    case 3:
      userId = @"4";
      break;
    default:
      break;
  }
  
  NSError *error;
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userId==%@", userId];
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
  [fetchRequest setPredicate:predicate];
  NSArray *users = [self.app.managedObjectContext executeFetchRequest:fetchRequest error:&error];
  
  self.user = users.firstObject;
  [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
  if (cell == nil) {
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
  }
  
  switch (indexPath.section) {
    case 0:
      switch (indexPath.row) {
        case 0:
          cell.textLabel.text = @"Name";
          cell.detailTextLabel.text = self.user.name;
          break;
        case 1:
          cell.textLabel.text = @"UserId";
          cell.detailTextLabel.text = self.user.userId;
          break;
        case 2:
          cell.textLabel.text = @"Category";
          cell.detailTextLabel.text = self.user.category;
          break;
        default:
          break;
      }
      break;
    case 1:
      switch (indexPath.row) {
        case 0:
          cell.textLabel.text = @"IsTraining";
          cell.detailTextLabel.text = @"NO";
          if ([self.user.isTraining  isEqual: @1]) {
            cell.detailTextLabel.text = @"YES";
          }
          break;
        default:
          break;
      }
      break;
    case 2:
      switch (indexPath.row) {
        case 0:
          cell.textLabel.text = @"Score";
          cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", self.user.score];
          break;
        case 1:
          cell.textLabel.text = @"CountMoves";
          cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", self.user.countMoves];
          break;
        default:
          break;
      }
      break;
    default:
      break;
  }
  return cell;
}

@end