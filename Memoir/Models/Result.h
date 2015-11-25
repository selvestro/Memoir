//
//  Result.h
//  Memoir
//
//  Created by dima on 25.11.15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Test, User;

@interface Result : NSManagedObject

@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSNumber * result;
@property (nonatomic, retain) User *forUser;
@property (nonatomic, retain) Test *forTest;

@end
