//
//  Question.h
//  Memoir
//
//  Created by Dmitry Seliverstov on 26/11/15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Answer, Test;

@interface Question : NSManagedObject

@property (nonatomic, retain) NSString * answer;
@property (nonatomic, retain) NSString * option1;
@property (nonatomic, retain) NSString * option2;
@property (nonatomic, retain) NSString * option3;
@property (nonatomic, retain) NSString * option4;
@property (nonatomic, retain) NSString * option5;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) NSString * topic;
@property (nonatomic, retain) NSNumber * isImage;
@property (nonatomic, retain) NSNumber * isAudio;
@property (nonatomic, retain) NSNumber * isText;
@property (nonatomic, retain) NSNumber * withErrors;
@property (nonatomic, retain) NSString * fileImage;
@property (nonatomic, retain) NSString * fileAudio;
@property (nonatomic, retain) NSNumber * objectId;
@property (nonatomic, retain) NSString * uid;
@property (nonatomic, retain) NSSet *inTests;
@property (nonatomic, retain) Answer *rightAnswer;
@end

@interface Question (CoreDataGeneratedAccessors)

- (void)addInTestsObject:(Test *)value;
- (void)removeInTestsObject:(Test *)value;
- (void)addInTests:(NSSet *)values;
- (void)removeInTests:(NSSet *)values;

@end
