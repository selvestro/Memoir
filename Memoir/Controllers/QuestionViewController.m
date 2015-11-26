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
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) BOOL isAnswered;
@property (assign, nonatomic) NSInteger timeLeft;
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

- (void)updateCounter:(NSTimer *)timer {
  if (self.timeLeft >= 0) {
      [self.timerLabel setText:[NSString stringWithFormat:@"%ld", (long)self.timeLeft]];
  }
  if (self.timeLeft == 0) {
    [self performSelector:@selector(noAnswer) withObject:nil afterDelay:1.0];
  }
  self.timeLeft = self.timeLeft - 1;
}

- (IBAction)answerButtonPressed:(UIButton *)sender {
  [self.timer invalidate];
  self.timer = nil;
  self.isAnswered = YES;
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
    [self rightAnswer];
  } else {
    [self wrongAnswer];
  }
}

- (void)rightAnswer {
  self.currentUser.score = [NSNumber numberWithInteger:self.currentUser.score.integerValue + 1];
  self.resultView.backgroundColor = [UIColor greenColor];
  [self.questionLevelLabel setText:[NSString stringWithFormat:@"%@", self.currentUser.score]];
  [self performSelector:@selector(nextQuestion) withObject:self afterDelay:1.0];
}

- (void)wrongAnswer {
  self.currentUser.score = [NSNumber numberWithInteger:self.currentUser.score.integerValue - 1];
  self.resultView.backgroundColor = [UIColor redColor];
  [self.questionLevelLabel setText:[NSString stringWithFormat:@"%@", self.currentUser.score]];
  [self performSelector:@selector(nextQuestion) withObject:self afterDelay:1.0];
}

- (void)noAnswer {
  [self.timer invalidate];
  self.timer = nil;
  if (self.isAnswered == NO) {
    self.currentUser.score = [NSNumber numberWithInteger:self.currentUser.score.integerValue - 1];
    self.resultView.backgroundColor = [UIColor orangeColor];
    [self.questionLevelLabel setText:[NSString stringWithFormat:@"%@", self.currentUser.score]];
    [self performSelector:@selector(nextQuestion) withObject:self afterDelay:1.0];
  }
}

- (IBAction)nextButtonPressed:(UIButton *)sender {
  [self nextQuestion];
}

- (void)nextQuestion {
  [self.timer invalidate];
  self.timer = nil;
  

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

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
  self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
  self.timeLeft = 10;
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [self.timer invalidate];
  self.timer = nil;
}

@end