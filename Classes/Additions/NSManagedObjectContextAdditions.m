//
//  NSManagedObjectContextAdditions.m
//  CityGuide
//
//  Created by witness on 12-10-24.
//
//

#import "NSManagedObjectContextAdditions.h"
#import "MLLog.h"

@implementation NSManagedObjectContext (Additions)
- (void)save {
    NSError *error = nil;
    if ([self hasChanges] && ![self save:&error]) {
        MLFatal(@"Save SQLite error: %@ !", error);
        abort();
    }
}
- (NSArray *)executeFetchRequest:(NSFetchRequest *)request {
    NSError *error = nil;
    NSArray *result = [self executeFetchRequest:request error:&error];
    if (error) {
        MLInfo(@"Fetch <%@> error: %@ !", request.entityName, error);
    }
    return result;
}
- (NSUInteger)countForFetchRequest:(NSFetchRequest *)request {
    NSError *error = nil;
    NSUInteger count = [self countForFetchRequest:request error:&error];
    if (error) {
        MLInfo(@"Count <%@> error: %@ !", request.entityName, error);
    }
    return count;
}
@end
