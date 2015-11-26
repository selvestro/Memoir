//
//  DataManager.m
//  Memoir
//
//  Created by dima on 25.11.15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

#import "DataManager.h"
#import "AppDelegate.h"
#import "Question.h"

@implementation DataManager

+ (void)uploadInitialData {
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = app.managedObjectContext;
    
    NSError *error;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    NSArray *users = [context executeFetchRequest:fetchRequest error:&error];
    
    NSLog(@"USERS: %@", users);
    
    if (users.count == 0) {
        NSManagedObject *user1 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        [user1 setValue:@"Пользователь1" forKey:@"name"];
        [user1 setValue:@"1" forKey:@"userId"];
        [user1 setValue:@"1" forKey:@"category"];
        [user1 setValue:[NSNumber numberWithBool:YES] forKey:@"isTraining"];
        [user1 setValue:@0 forKey:@"score"];
        [user1 setValue:@0 forKey:@"countMoves"];
        
        NSManagedObject *user2 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        [user2 setValue:@"Пользователь2" forKey:@"name"];
        [user2 setValue:@"2" forKey:@"userId"];
        [user2 setValue:@"2" forKey:@"category"];
        [user2 setValue:[NSNumber numberWithBool:NO] forKey:@"isTraining"];
        [user2 setValue:@0 forKey:@"score"];
        [user1 setValue:@0 forKey:@"countMoves"];
        
        NSManagedObject *user3 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        [user3 setValue:@"Пользователь3" forKey:@"name"];
        [user3 setValue:@"3" forKey:@"userId"];
        [user3 setValue:@"3" forKey:@"category"];
        [user3 setValue:[NSNumber numberWithBool:YES] forKey:@"isTraining"];
        [user3 setValue:@0 forKey:@"score"];
        [user1 setValue:@0 forKey:@"countMoves"];
        
        NSManagedObject *user4 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        [user4 setValue:@"Пользователь4" forKey:@"name"];
        [user4 setValue:@"4" forKey:@"userId"];
        [user4 setValue:@"3" forKey:@"category"];
        [user4 setValue:[NSNumber numberWithBool:NO] forKey:@"isTraining"];
        [user4 setValue:@0 forKey:@"score"];
        [user1 setValue:@0 forKey:@"countMoves"];
        
        [app saveContext];
    }
}

+ (void)uploadQuestions {
  
  AppDelegate *app = [[UIApplication sharedApplication] delegate];
  
  NSManagedObjectContext *context = app.managedObjectContext;
  
  NSError *error;
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Question"];
  NSArray *questions = [context executeFetchRequest:fetchRequest error:&error];
  
  NSLog(@"QUESTIONS: %@", questions);
  
  if (questions.count == 0) {
    NSManagedObject *question1 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    [question1 setValue:@1 forKey:@"objectId"];
    [question1 setValue:@"2" forKey:@"category"];
    [question1 setValue:@"russian" forKey:@"topic"];
    [question1 setValue:[NSNumber numberWithBool:YES] forKey:@"isText"];
    [question1 setValue:[NSNumber numberWithBool:YES] forKey:@"withErrors"];
    [question1 setValue:@"Какой вариант верный?" forKey:@"question"];
    [question1 setValue:@"параллелепипед" forKey:@"answer"];
    [question1 setValue:@"пораллелепипед" forKey:@"option1"];
    [question1 setValue:@"параллелепипед" forKey:@"option2"];
    [question1 setValue:@"параллелепипед" forKey:@"option3"];
    [question1 setValue:@"параллелипипед" forKey:@"option4"];
    [question1 setValue:@"параллелепепед" forKey:@"option5"];
    
    NSManagedObject *question2 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    [question2 setValue:@2 forKey:@"objectId"];
    [question2 setValue:@"2" forKey:@"category"];
    [question2 setValue:@"russian" forKey:@"topic"];
    [question2 setValue:[NSNumber numberWithBool:YES] forKey:@"isText"];
    [question2 setValue:[NSNumber numberWithBool:YES] forKey:@"withErrors"];
    [question2 setValue:@"Какой вариант верный?" forKey:@"question"];
    [question2 setValue:@"велосипед" forKey:@"answer"];
    [question2 setValue:@"велосипед" forKey:@"option1"];
    [question2 setValue:@"вилосипед" forKey:@"option2"];
    [question2 setValue:@"вилисипед" forKey:@"option3"];
    [question2 setValue:@"велосипед" forKey:@"option4"];
    [question2 setValue:@"велесепед" forKey:@"option5"];

    NSManagedObject *question3 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    [question3 setValue:@3 forKey:@"objectId"];
    [question3 setValue:@"2" forKey:@"category"];
    [question3 setValue:@"russian" forKey:@"topic"];
    [question3 setValue:[NSNumber numberWithBool:YES] forKey:@"isText"];
    [question3 setValue:[NSNumber numberWithBool:YES] forKey:@"withErrors"];
    [question3 setValue:@"Какой вариант верный?" forKey:@"question"];
    [question3 setValue:@"интересный" forKey:@"answer"];
    [question3 setValue:@"интиресный" forKey:@"option1"];
    [question3 setValue:@"интерисный" forKey:@"option2"];
    [question3 setValue:@"интересный" forKey:@"option3"];
    [question3 setValue:@"интирисный" forKey:@"option4"];
    [question3 setValue:@"интюресный" forKey:@"option5"];

    NSManagedObject *question4 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    [question4 setValue:@4 forKey:@"objectId"];
    [question4 setValue:@"2" forKey:@"category"];
    [question4 setValue:@"russian" forKey:@"topic"];
    [question4 setValue:[NSNumber numberWithBool:YES] forKey:@"isText"];
    [question4 setValue:[NSNumber numberWithBool:YES] forKey:@"withErrors"];
    [question4 setValue:@"Какой вариант верный?" forKey:@"question"];
    [question4 setValue:@"самокат" forKey:@"answer"];
    [question4 setValue:@"самакот" forKey:@"option1"];
    [question4 setValue:@"самокат" forKey:@"option2"];
    [question4 setValue:@"сомокат" forKey:@"option3"];
    [question4 setValue:@"сумокат" forKey:@"option4"];
    [question4 setValue:@"сомокот" forKey:@"option5"];

    NSManagedObject *question5 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    [question5 setValue:@5 forKey:@"objectId"];
    [question5 setValue:@"2" forKey:@"category"];
    [question5 setValue:@"russian" forKey:@"topic"];
    [question5 setValue:[NSNumber numberWithBool:YES] forKey:@"isText"];
    [question5 setValue:[NSNumber numberWithBool:YES] forKey:@"withErrors"];
    [question5 setValue:@"Какой вариант верный?" forKey:@"question"];
    [question5 setValue:@"многоэтажный" forKey:@"answer"];
    [question5 setValue:@"многаэтажный" forKey:@"option1"];
    [question5 setValue:@"многоэтожный" forKey:@"option2"];
    [question5 setValue:@"многоэтажный" forKey:@"option3"];
    [question5 setValue:@"многаэтужный" forKey:@"option4"];
    [question5 setValue:@"многаэтожный" forKey:@"option5"];

    [app saveContext];
  }

}

+ (NSArray *)allUsers {
  AppDelegate *app = [[UIApplication sharedApplication] delegate];
  
  NSManagedObjectContext *context = app.managedObjectContext;
  
  NSError *error;
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
  NSArray *users = [context executeFetchRequest:fetchRequest error:&error];
  
  return users;
}

+ (NSArray *)questionsWithTopic:(NSString *)topic
                    andCategory:(NSString *)category {
  AppDelegate *app = [[UIApplication sharedApplication] delegate];

  NSError *error;
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"topic==%@ AND category==%@", topic, category];
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Question"];
  [fetchRequest setPredicate:predicate];
  NSArray *questions = [app.managedObjectContext executeFetchRequest:fetchRequest error:&error];
  
  return questions;
}

+ (Question *)randomQuestionForTopic:(NSString *)topic
                         andCategory:(NSString *)category {
  NSArray *questions = [self questionsWithTopic:topic andCategory:category];
  NSInteger r = arc4random_uniform(questions.count);
  
  NSLog(@"QUESTIONS: %lu", (unsigned long)questions.count);
  NSLog(@"RANDOM: %lu", (unsigned long)r);

  return questions[r];
}

+ (void)saveToLocalFile {
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *documentsDirectory = [paths objectAtIndex:0];
  NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, @"myData.json"];
  NSLog(@"filePath %@", filePath);
  
  if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
    // if file is not exist, create it.
    NSString *helloStr = @"hello world";
    NSError *error;
    [helloStr writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
  }
  
  if ([[NSFileManager defaultManager] isWritableFileAtPath:filePath]) {
    NSLog(@"Writable");
  }else {
    NSLog(@"Not Writable");
  }
}

@end