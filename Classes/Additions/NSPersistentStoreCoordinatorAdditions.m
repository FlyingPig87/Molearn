//
//  NSPersistentStoreCoordinatorAdditions.m
//  CityGuide
//
//  Created by witness on 12-10-24.
//
//

#import "NSPersistentStoreCoordinatorAdditions.h"
#import "MLLog.h"

@implementation NSPersistentStoreCoordinator (Additions)

#pragma mark control
- (NSPersistentStore *)addPersistentStoreAtURL:(NSURL *)storeURL configuration:(NSString *)configuration {
    NSDictionary *options = @{
        NSMigratePersistentStoresAutomaticallyOption : @YES,
        NSInferMappingModelAutomaticallyOption : @YES,
//        NSIgnorePersistentStoreVersioningOption : @YES
    };
    return [self addPersistentStoreAtURL:storeURL
                           configuration:configuration
                                 options:options];
}

- (NSPersistentStore *)addPersistentStoreAtURL:(NSURL *)storeURL configuration:(NSString *)configuration options:(NSDictionary *)options {
    // url check
    if (!storeURL) {
        return nil;
    }
    
    // open store
    NSError *error = nil;
    NSPersistentStore *store = [self addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:configuration
                                                            URL:storeURL
                                                        options:options
                                                          error:&error];
    if (!store) {
        MLFatal(@"Failed to load store. error : %@", [error userInfo]);
        abort();
    }
    return store;
}

- (void)removePersistentStoreAtURL:(NSURL *)storeURL {
    return [self removePersistentStore:[self persistentStoreForURL:storeURL]];
}

- (void)removePersistentStore:(NSPersistentStore *)store {
    NSError *error = nil;
    if (![self removePersistentStore:store error:&error]) {
        MLFatal(@"Failed to unload store. error : %@ <%@>", error, [error userInfo]);
        abort();
    }
}

- (void)removeAllPersistentStores {
    for (NSPersistentStore *store in [self persistentStores]) {
        NSError *error = nil;
        if (![self removePersistentStore:store error:&error]) {
            MLFatal(@"Failed to unload stores. error : %@ <%@>", error, [error userInfo]);
            abort();
        }
    }
}

@end
