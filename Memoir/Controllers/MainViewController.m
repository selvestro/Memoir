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

@interface MainViewController ()

@property (strong, nonatomic) AppDelegate *app;

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
  
  self.app = [[UIApplication sharedApplication] delegate];
  
  [self setupUsers];
}

- (void)setupUsers {
  
  NSManagedObjectContext *context = self.app.managedObjectContext;
  
  NSError *error;
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
  self.users = [context executeFetchRequest:fetchRequest error:&error];
  
  NSLog(@"USERS: %@", self.users);
  
  if (self.users.count == 0) {
    NSManagedObject *user1 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    [user1 setValue:@"Пользователь1" forKey:@"name"];
    [user1 setValue:@"1" forKey:@"userId"];
    [user1 setValue:@"3" forKey:@"category"];
    [user1 setValue:[NSNumber numberWithBool:YES] forKey:@"isTraining"];
    [user1 setValue:@0 forKey:@"score"];
    [user1 setValue:@0 forKey:@"countMoves"];
    
    NSManagedObject *user2 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    [user2 setValue:@"Пользователь2" forKey:@"name"];
    [user2 setValue:@"2" forKey:@"userId"];
    [user2 setValue:@"3" forKey:@"category"];
    [user2 setValue:[NSNumber numberWithBool:NO] forKey:@"isTraining"];
    [user2 setValue:@0 forKey:@"score"];
    [user1 setValue:@0 forKey:@"countMoves"];
    
    NSManagedObject *user3 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    [user3 setValue:@"Пользователь3" forKey:@"name"];
    [user3 setValue:@"3" forKey:@"userId"];
    [user3 setValue:@"2" forKey:@"category"];
    [user3 setValue:[NSNumber numberWithBool:YES] forKey:@"isTraining"];
    [user3 setValue:@0 forKey:@"score"];
    [user1 setValue:@0 forKey:@"countMoves"];
    
    NSManagedObject *user4 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    [user4 setValue:@"Пользователь4" forKey:@"name"];
    [user4 setValue:@"4" forKey:@"userId"];
    [user4 setValue:@"1" forKey:@"category"];
    [user4 setValue:[NSNumber numberWithBool:NO] forKey:@"isTraining"];
    [user4 setValue:@0 forKey:@"score"];
    [user1 setValue:@0 forKey:@"countMoves"];
    
    [self.app saveContext];
  }

}


- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  NSLog(@"ROOT, NOW CONTROLLERS: %lu", (unsigned long)self.navigationController.viewControllers.count);
  
  [self configureAppearance];
}

- (void)configureAppearance {
  for (User *user in self.users) {
    if ([user.userId isEqualToString:@"1"]) {
      [self.userOneSwitch setOn:[user.isTraining isEqual:@1]];
    } else if ([user.userId isEqualToString:@"2"]) {
      [self.userTwoSwitch setOn:[user.isTraining isEqual:@1]];
    } else if ([user.userId isEqualToString:@"3"]) {
      [self.userThreeSwitch setOn:[user.isTraining isEqual:@1]];
    } else if ([user.userId isEqualToString:@"4"]) {
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

@end