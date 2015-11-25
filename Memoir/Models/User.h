//
//  User.h
//  Memoir
//
//  Created by dima on 25.11.15.
//  Copyright (c) 2015 seliverstov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Test;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSNumber * countMoves;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSNumber * isTraining;
@property (nonatomic, retain) NSString * userId;
@property (nonatomic, retain) NSSet *hasResults;
@property (nonatomic, retain) NSSet *hasTests;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addHasResultsObject:(NSManagedObject *)value;
- (void)removeHasResultsObject:(NSManagedObject *)value;
- (void)addHasResults:(NSSet *)values;
- (void)removeHasResults:(NSSet *)values;

- (void)addHasTestsObject:(Test *)value;
- (void)removeHasTestsObject:(Test *)value;
- (void)addHasTests:(NSSet *)values;
- (void)removeHasTests:(NSSet *)values;

@end
