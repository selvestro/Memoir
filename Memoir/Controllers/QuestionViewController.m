//
//  QuestionViewController.m
//  Memoir
//
//  Created by dima on 25.11.15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

#import "QuestionViewController.h"
#import "DataManager.h"
#import "User.h"
#import "Question.h"

@interface QuestionViewController ()

@property (strong, nonatomic) Question *question;

@end

@implementation QuestionViewController

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  NSLog(@"CONTROLLERS: %lu", (unsigned long)self.navigationController.viewControllers.count);
  
  self.questionLabel.text = self.currentUser.name;
  self.questionLevelLabel.text = [NSString stringWithFormat:@"%@", self.currentUser.score];
  
  if ([self.currentUser.isTraining isEqualToValue:@1]) {
    self.answerOneView.hidden = YES;
    self.answerThreeView.hidden = YES;
  }
  
  self.question = [DataManager randomQuestionForTopic:@"russian"
                                          andCategory:self.currentUser.category];
  
  [self.questionLabel setText:self.question.question];
  
  [self.answerOneLabel setText:self.question.option1];  
  [self.answerTwoLabel setText:self.question.option2];
  [self.answerThreeLabel setText:self.question.option3];
}

- (IBAction)answerButtonPressed:(UIButton *)sender {
  
  NSString *answer;
  
  switch (sender.tag) {
    case 1:
      answer = self.answerOneLabel.text;
      break;
    case 2:
      answer = self.answerTwoLabel.text;
      break;
    case 3:
      answer = self.answerThreeLabel.text;
      break;
    default:
      break;
  }
  
  if ([answer isEqualToString:self.question.answer]) {
    self.resultView.backgroundColor = [UIColor greenColor];
  } else {
    self.resultView.backgroundColor = [UIColor redColor];
  }
}

- (IBAction)nextButtonPressed:(UIButton *)sender {
  [self performSegueWithIdentifier:@"Next" sender:nil];
}

- (IBAction)exitButtonPressed:(UIButton *)sender {
  [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"Next"]) {
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