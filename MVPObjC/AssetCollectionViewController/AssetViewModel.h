//
//  AssetViewModel.h
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UTLMacros.h"

NS_ASSUME_NONNULL_BEGIN

@interface AssetViewModel : NSObject
@property (nonatomic, strong, readonly) NSString *title;

UTL_REMOVE_DEFAULT_NSOBJECT_INITIALIZERS
-(instancetype)initWithTitle: (NSString *)title;

@end

NS_ASSUME_NONNULL_END
