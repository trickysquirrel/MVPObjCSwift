//
//  NSArray+Map.h
//  MVPObjC
//
//  Created by Richard Moult on 5/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Map)

- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block;

@end


NS_ASSUME_NONNULL_END
