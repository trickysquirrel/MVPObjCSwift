//
//  NSArray+Safe.m
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#import "NSArray+Safe.h"


@implementation NSArray (Safe)

-(nullable NSObject *)elementAtIndex: (NSInteger)index {
    if (index < self.count) {
        return self[index];
    }
    return nil;
}
@end

