//
//  AssetCollectionPresenter.m
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#import "AssetCollectionPresenter.h"
#import "AssetViewModel.h"
#import "AssetCollectionInterator.h"
#import "MVPObjC-Swift.h"
#import "NSArray+Map.h"

@interface AssetCollectionPresenter ()
@property (nonatomic, copy) AssetCollectionInterator *interactor;
@end

@implementation AssetCollectionPresenter

-(instancetype)init
{
    self = [super init];
    if (self) {
        _interactor = [AssetCollectionInterator new];
    }
    return self;
}

- (void)updateViewOnQueue: (dispatch_queue_t) queue
                onLoading: (void (^)(BOOL))onLoading
                onSuccess: (void (^)(NSArray<AssetViewModel *> *))onSuccess
                  onError: (void (^)(NSError *))onError
{
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    
    [self.interactor fetchDataOnQueue: backgroundQueue

        onLoading:^(BOOL loading) {

            dispatch_async(queue, ^{
                onLoading(loading);
            });

        } onSuccess:^(AssetDataModel2 * _Nonnull data) {

            NSArray<AssetViewModel *> *rows = [data.data.items mapObjectsUsingBlock:^id _Nonnull(id  _Nonnull obj, NSUInteger idx) {
                return [[AssetViewModel alloc] initWithTitle: [obj title] ];
            }];

            dispatch_async(queue, ^{
                onSuccess(rows);
            });


        } onError:^(NSError * _Nonnull error) {
            // error
        }
    ];
}

@end
