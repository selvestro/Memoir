//
//  Test.h
//  Memoir
//
//  Created by dima on 25.11.15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Test : NSManagedObject

@property (nonatomic, retain) NSNumber * count;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * topic;
@property (nonatomic, retain) NSDate * dateStart;
@property (nonatomic, retain) NSDate * dateFinish;
@property (nonatomic, retain) NSManagedObject *questionAsked;
@property (nonatomic, retain) NSSet *answerOptions;
@property (nonatomic, retain) NSManagedObject *forUser;
@property (nonatomic, retain) NSManagedObject *hasResult;
@end

@interface Test (CoreDataGeneratedAccessors)

- (void)addAnswerOptionsObject:(NSManagedObject *)value;
- (void)removeAnswerOptionsObject:(NSManagedObject *)value;
- (void)addAnswerOptions:(NSSet *)values;
- (void)removeAnswerOptions:(NSSet *)values;

@end
