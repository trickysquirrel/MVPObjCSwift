//
//  AssetCollectionInterator.h
//  MVPObjC
//
//  Created by Richard Moult on 5/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

@import Foundation;
@class AssetDataModel2;

NS_ASSUME_NONNULL_BEGIN

@interface AssetCollectionInterator : NSObject

- (void)fetchDataOnQueue: (dispatch_queue_t) queue
               onLoading: (void (^)(BOOL))onLoading
               onSuccess: (void (^)(AssetDataModel2 *))onSuccess
                 onError: (void (^)(NSError *))onError;

@end

NS_ASSUME_NONNULL_END
