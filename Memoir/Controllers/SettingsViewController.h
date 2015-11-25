//
//  QuestionViewController.h
//  Memoir
//
//  Created by dima on 25.11.15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

@class User;

#import <UIKit/UIKit.h>

@interface SettingsViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *userControl;

@property (strong, nonatomic) User *user;

@end