//
//  CollectionSection.h
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionSection : NSObject
@property (nonatomic, strong, readonly) NSMutableArray *rows;

-(instancetype)initWithRows: (NSArray *)rows;

@end

NS_ASSUME_NONNULL_END
