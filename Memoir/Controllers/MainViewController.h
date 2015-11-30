//
//  ViewController.h
//  Memoir
//
//  Created by dima on 25.11.15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

@class User;

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (strong, nonatomic) NSArray *users;
@property (strong, nonatomic) User *currentUser;
@property (assign, nonatomic) NSInteger timerDefault;

@end