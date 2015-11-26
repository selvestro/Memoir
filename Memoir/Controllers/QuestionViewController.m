//
//  QuestionViewController.m
//  Memoir
//
//  Created by dima on 25.11.15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

#import "QuestionViewController.h"
#import "User.h"

@interface QuestionViewController ()


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
}

- (IBAction)answerButtonPressed:(UIButton *)sender {
  
  NSUInteger tag = sender.tag;
  

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