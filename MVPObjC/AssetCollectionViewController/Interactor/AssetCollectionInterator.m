//
//  AssetCollectionInterator.m
//  MVPObjC
//
//  Created by Richard Moult on 5/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#import "AssetCollectionInterator.h"
#import "MVPObjC-Swift.h"

@interface AssetCollectionInterator ()
@property (nonatomic, strong, readonly) MovieDataLoaderBridge *dataLoader;
@end

@implementation AssetCollectionInterator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataLoader = [MovieDataLoaderBridge new];
    }
    return self;
}


- (void)fetchDataOnQueue: (dispatch_queue_t) queue
               onLoading: (void (^)(BOOL))onLoading
               onSuccess: (void (^)(AssetDataModel2 *))onSuccess
                 onError: (void (^)(NSError *))onError
{
    dispatch_async(queue, ^{
        onLoading(YES);
    });

    [self.dataLoader
        loadOnSuccess:^(AssetDataModel2 * _Nonnull data) {
            // on success
            dispatch_async(queue, ^{
                onSuccess(data);
                onLoading(NO);
            });
        }
        onError:^(NSError * _Nonnull error) {
            // on error
            dispatch_async(queue, ^{
                onError(error);
                onLoading(NO);
            });
        }
     ];
}

@end
