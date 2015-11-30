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
  
  if (self.navigationController.viewControllers.count < 3) {
    self.currentUser.score = 0;
  }
//  self.question = [DataManager randomQuestionForTopic:@"russian"
//                                          andCategory:self.currentUser.category];
  
//  self.question = [DataManager randomMathQuestion];
  self.question = [DataManager randomMathToHundredQuestion];

  [self.questionLabel setText:self.question.question];
  
  NSMutableArray *options = [NSMutableArray arrayWithObjects:
                             self.question.option1,
                             self.question.option2,
                             self.question.option3,
                             nil];
  
  NSInteger index1 = arc4random_uniform(options.count);
  NSLog(@"INDEX-1: %ld", (long)index1);
  [self.answerOneLabel setText:options[index1]];
  [options removeObjectAtIndex:index1];
  
  NSInteger index2 = arc4random_uniform(options.count);
  NSLog(@"INDEX-2: %ld", (long)index2);
  [self.answerTwoLabel setText:options[index2]];
  [options removeObjectAtIndex:index2];
  
  NSInteger index3 = 0;
  NSLog(@"INDEX-3: %ld", (long)index3);
  [self.answerThreeLabel setText:options[index3]];
  [options removeObjectAtIndex:index3];
  self.total = self.total + 1;

  [self.totalLabel setText:[NSString stringWithFormat:@"%ld", (long)self.total]];
  
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

  if ([self.question.topic isEqualToString:@"russian"] ||
      [self.question.topic isEqualToString:@"math"]) {
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
    controller.total = self.total;
    controller.timerDefault = self.timerDefault;
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
  return YES;
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
  self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
  self.timeLeft = self.timerDefault;
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [self.timer invalidate];
  self.timer = nil;
}

@end