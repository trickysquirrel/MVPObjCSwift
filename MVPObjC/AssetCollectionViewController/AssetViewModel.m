//
//  AssetViewModel.m
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#import "AssetViewModel.h"

@implementation AssetViewModel

-(instancetype)initWithTitle: (NSString *)title {
    self = [super init];
    if (self) {
        _title = title;
    }
    return self;
}

@end
