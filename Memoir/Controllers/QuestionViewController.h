//
//  QuestionViewController.h
//  Memoir
//
//  Created by dima on 25.11.15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

@class User;

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController

@property (strong, nonatomic) User *currentUser;

@property (assign, nonatomic) NSInteger total;

@property (assign, nonatomic) NSInteger timerDefault;
@property (assign, nonatomic) NSInteger timeLeft;

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;


@property (weak, nonatomic) IBOutlet UIView *questionView;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@property (weak, nonatomic) IBOutlet UILabel *questionLevelLabel;

@property (weak, nonatomic) IBOutlet UIView *resultView;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (weak, nonatomic) IBOutlet UIView *answerOneView;
@property (weak, nonatomic) IBOutlet UIImageView *answerOneImageView;
@property (weak, nonatomic) IBOutlet UILabel *answerOneLabel;
@property (weak, nonatomic) IBOutlet UIButton *answerOneButton;

@property (weak, nonatomic) IBOutlet UIView *answerTwoView;
@property (weak, nonatomic) IBOutlet UIImageView *answerTwoImageView;
@property (weak, nonatomic) IBOutlet UILabel *answerTwoLabel;
@property (weak, nonatomic) IBOutlet UIButton *answerTwoButton;

@property (weak, nonatomic) IBOutlet UIView *answerThreeView;
@property (weak, nonatomic) IBOutlet UIImageView *answerThreeImageView;
@property (weak, nonatomic) IBOutlet UILabel *answerThreeLabel;
@property (weak, nonatomic) IBOutlet UIButton *answerThreeButton;

@property (weak, nonatomic) IBOutlet UIButton *exitButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end