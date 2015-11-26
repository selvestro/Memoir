//
//  Test.h
//  Memoir
//
//  Created by Dmitry Seliverstov on 26/11/15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Answer, Question, Result, User;

@interface Test : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSNumber * count;
@property (nonatomic, retain) NSDate * dateFinish;
@property (nonatomic, retain) NSDate * dateStart;
@property (nonatomic, retain) NSString * topic;
@property (nonatomic, retain) NSNumber * objectId;
@property (nonatomic, retain) NSString * uid;
@property (nonatomic, retain) NSSet *answerOptions;
@property (nonatomic, retain) User *forUser;
@property (nonatomic, retain) Result *hasResult;
@property (nonatomic, retain) Question *questionAsked;
@end

@interface Test (CoreDataGeneratedAccessors)

- (void)addAnswerOptionsObject:(Answer *)value;
- (void)removeAnswerOptionsObject:(Answer *)value;
- (void)addAnswerOptions:(NSSet *)values;
- (void)removeAnswerOptions:(NSSet *)values;

@end
