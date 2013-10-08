//
//  NSArray+Addons.m
//  Breeze
//
//  Created by Abdullah Bakhach on 5/7/13.
//
//

#import "NSArray+Addons.h"

@implementation NSArray (Addons)

// TODO: do the same as below for creating dictionaries
// ie see the operation of populating nearby users into a dictionary
// at the beginning of the login process
- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id blockResult = block(obj, idx);
        if (![self isEmpty:blockResult]) {
            [result addObject:blockResult];
        }
    }];
    
    return result;
}

- (NSArray *)flattenArray {
    NSMutableArray *flattenedArray = [@[] mutableCopy];
    for (NSArray* arr in self) {
        if ([arr isKindOfClass:[NSArray class]]) {
            [flattenedArray addObjectsFromArray:arr];
        }
    }
    return flattenedArray;
}

- (void)mapObjectsApplyingBlock:(void (^)(id obj))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (BOOL)isEmpty:(id)object {
    if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSDictionary class]]) {
        return (![object count] > 0);
    }
    
    return !object;
}


@end

