//
//  AssetCollectionPresenter.m
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#import "AssetCollectionPresenter.h"
#import "AssetViewModel.h"

@interface AssetCollectionPresenter ()
@property (nonatomic, copy) void (^onLoadingClosure)(BOOL loading);
@property (nonatomic, copy) void (^onSuccessClosure)(NSArray<AssetViewModel *> *viewModels);
@property (nonatomic, copy) void (^onErrorClosure)(NSError *error);
@end

@implementation AssetCollectionPresenter

// dispatch_queue_t queue = dispatch_queue_create("com.example.myqueue",  DISPATCH_QUEUE_SERIAL);

- (void)updateViewOnQueue: (dispatch_queue_t) queue
                onLoading: (void (^)(BOOL))onLoading
                onSuccess: (void (^)(NSArray<AssetViewModel *> *))onSuccess
                  onError: (void (^)(NSError *))onError
{
    self.onLoadingClosure = onLoading;
    self.onSuccessClosure = onSuccess;
    self.onErrorClosure = onError;

    dispatch_async(queue, ^{
        self.onLoadingClosure(YES);
    });

    // test data
    NSMutableArray<AssetViewModel *> *rows = (NSMutableArray<AssetViewModel *> *)@[
                                                [[AssetViewModel alloc] initWithTitle: @"1"],
                                                [[AssetViewModel alloc] initWithTitle: @"2"],
                                                [[AssetViewModel alloc] initWithTitle: @"3"]
    ];

    dispatch_async(queue, ^{
        self.onSuccessClosure(rows);
    });

    dispatch_async(queue, ^{
        self.onLoadingClosure(NO);
    });
}

@end
