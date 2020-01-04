//
//  AssetCollectionPresenter.h
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AssetViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface AssetCollectionPresenter : NSObject

- (void)updateViewOnQueue: (dispatch_queue_t) queue
                onLoading: (void (^)(BOOL))onLoading
                onSuccess: (void (^)(NSArray<AssetViewModel *> *))onSuccess
                  onError: (void (^)(NSError *))onError;

- (void)updateViewOnLoading: (void (^)(BOOL))onLoading
                  onSuccess: (void (^)(NSArray<AssetViewModel *> *))onSuccess
                    onError: (void (^)(NSError *))onError;

@end

NS_ASSUME_NONNULL_END
