//
//  Answer.h
//  Memoir
//
//  Created by dima on 25.11.15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question, Test;

@interface Answer : NSManagedObject

@property (nonatomic, retain) NSString * answer;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) NSString * topic;
@property (nonatomic, retain) Question *forQuestion;
@property (nonatomic, retain) NSSet *inTests;
@end

@interface Answer (CoreDataGeneratedAccessors)

- (void)addInTestsObject:(Test *)value;
- (void)removeInTestsObject:(Test *)value;
- (void)addInTests:(NSSet *)values;
- (void)removeInTests:(NSSet *)values;

@end
