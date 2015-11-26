//
//  Result.h
//  Memoir
//
//  Created by Dmitry Seliverstov on 26/11/15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Test, User;

@interface Result : NSManagedObject

@property (nonatomic, retain) NSNumber * result;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSNumber * objectId;
@property (nonatomic, retain) NSString * uid;
@property (nonatomic, retain) Test *forTest;
@property (nonatomic, retain) User *forUser;

@end
