//
//  DataManager.h
//  Memoir
//
//  Created by dima on 25.11.15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

@class Question;

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataManager : NSObject

+ (void)uploadInitialData;
+ (void)uploadQuestions;

+ (NSArray *)allUsers;

+ (Question *)randomQuestionForTopic:(NSString *)topic
                         andCategory:(NSString *)category;

+ (Question *)randomMathQuestion;

+ (Question *)randomMathToHundredQuestion;

@end