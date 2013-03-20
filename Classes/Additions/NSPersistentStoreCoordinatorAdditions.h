//
//  NSPersistentStoreCoordinatorAdditions.h
//  CityGuide
//
//  Created by witness on 12-10-24.
//
//

#import <CoreData/CoreData.h>

@interface NSPersistentStoreCoordinator (Additions)
- (NSPersistentStore *)addPersistentStoreAtURL:(NSURL *)storeURL configuration:(NSString *)configuration;
- (NSPersistentStore *)addPersistentStoreAtURL:(NSURL *)storeURL configuration:(NSString *)configuration options:(NSDictionary *)options;

- (void)removePersistentStoreAtURL:(NSURL *)storeURL;
- (void)removePersistentStore:(NSPersistentStore *)store;
- (void)removeAllPersistentStores;
@end
