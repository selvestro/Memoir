//
//  ViewController.m
//  Memoir
//
//  Created by dima on 25.11.15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "MainViewController.h"
#import "QuestionViewController.h"
#import "User.h"
#import "DataManager.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIView *userOneView;
@property (weak, nonatomic) IBOutlet UILabel *userOneLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userOneImageView;
@property (weak, nonatomic) IBOutlet UIButton *userOneButton;
@property (weak, nonatomic) IBOutlet UISwitch *userOneSwitch;
@property (weak, nonatomic) IBOutlet UIView *userOneIndicatorView;

@property (weak, nonatomic) IBOutlet UIView *userTwoView;
@property (weak, nonatomic) IBOutlet UILabel *userTwoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userTwoImageView;
@property (weak, nonatomic) IBOutlet UIButton *userTwoButton;
@property (weak, nonatomic) IBOutlet UISwitch *userTwoSwitch;
@property (weak, nonatomic) IBOutlet UIView *userTwoIndicatorView;

@property (weak, nonatomic) IBOutlet UIView *userThreeView;
@property (weak, nonatomic) IBOutlet UILabel *userThreeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userThreeImageView;
@property (weak, nonatomic) IBOutlet UIButton *userThreeButton;
@property (weak, nonatomic) IBOutlet UISwitch *userThreeSwitch;
@property (weak, nonatomic) IBOutlet UIView *userThreeIndicatorView;

@property (weak, nonatomic) IBOutlet UIView *userFourView;
@property (weak, nonatomic) IBOutlet UILabel *userFourLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userFourImageView;
@property (weak, nonatomic) IBOutlet UIButton *userFourButton;
@property (weak, nonatomic) IBOutlet UISwitch *userFourSwitch;
@property (weak, nonatomic) IBOutlet UIView *userFourIndicatorView;

@end

@implementation MainViewController

- (void)viewDidLoad {
  [super viewDidLoad];
    
  [DataManager uploadInitialData];
  [DataManager uploadQuestions];

  self.users = [DataManager allUsers];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  NSLog(@"ROOT, NOW CONTROLLERS: %lu", (unsigned long)self.navigationController.viewControllers.count);
  
  [self configureAppearance];
}

- (void)configureAppearance {
  for (User *user in self.users) {
    if ([user.userId isEqualToString:@"1"]) {
      self.userOneLabel.text = user.name;
      [self.userOneSwitch setOn:[user.isTraining isEqual:@1]];
    } else if ([user.userId isEqualToString:@"2"]) {
      self.userTwoLabel.text = user.name;
      [self.userTwoSwitch setOn:[user.isTraining isEqual:@1]];
    } else if ([user.userId isEqualToString:@"3"]) {
      self.userThreeLabel.text = user.name;
      [self.userThreeSwitch setOn:[user.isTraining isEqual:@1]];
    } else if ([user.userId isEqualToString:@"4"]) {
      self.userFourLabel.text = user.name;
      [self.userFourSwitch setOn:[user.isTraining isEqual:@1]];
    }
  }
}

- (IBAction)trainingSwitchChanged:(UISwitch *)sender {
  
  NSString *tag = [NSString stringWithFormat:@"%ld", (long)sender.tag];
  NSLog(@"TAG: %@", tag);
  NSString *userId;
  
  if ([tag isEqualToString:@"1"]) {
    userId = @"1";
  } else if ([tag isEqualToString:@"2"]) {
    userId = @"2";
  } else if ([tag isEqualToString:@"3"]) {
    userId = @"3";
  } else if ([tag isEqualToString:@"4"]) {
    userId = @"4";
  }

  [self selectedUser:userId];
  
  if (sender.isOn) {
    self.currentUser.isTraining = @1;
  } else {
    self.currentUser.isTraining = @0;
  }
  
  [self configureAppearance];
}

- (void)selectedUser:(NSString *)tag {
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userId==%@", tag];
  NSArray *array = [self.users filteredArrayUsingPredicate:predicate];
  
  self.currentUser = array.firstObject;
  
  NSLog(@"USER ID: %@", self.currentUser.userId);
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
  NSString *tag = [NSString stringWithFormat:@"%ld", (long)sender.tag];
  NSString *userId;
  
  if ([tag isEqualToString:@"1"]) {
    userId = @"1";
  } else if ([tag isEqualToString:@"2"]) {
    userId = @"2";
  } else if ([tag isEqualToString:@"3"]) {
    userId = @"3";
  } else if ([tag isEqualToString:@"4"]) {
    userId = @"4";
  }
  
  [self selectedUser:userId];
  
  [self performSegueWithIdentifier:@"Question" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  if ([segue.identifier isEqualToString:@"Question"]) {
    QuestionViewController *controller = [[QuestionViewController alloc]init];
    controller = segue.destinationViewController;
    controller.currentUser = self.currentUser;
    controller.navigationItem.hidesBackButton = YES;
  }
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
  return YES;
}

@end