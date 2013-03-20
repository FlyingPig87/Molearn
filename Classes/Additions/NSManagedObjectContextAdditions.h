//
//  NSManagedObjectContextAdditions.h
//  CityGuide
//
//  Created by witness on 12-10-24.
//
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (Additions)
- (void)save;
- (NSArray *)executeFetchRequest:(NSFetchRequest *)request;
- (NSUInteger)countForFetchRequest:(NSFetchRequest *)request;
@end
