//
//  CollectionSection.m
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

@import UIKit;
#import "CollectionSection.h"

@implementation CollectionSection

-(instancetype)initWithRows: (NSArray *)rows
{
    self = [super init];
    if (self) {
        _rows = [NSMutableArray new];
        [_rows addObjectsFromArray:rows];
    }
    return self;
}

@end
