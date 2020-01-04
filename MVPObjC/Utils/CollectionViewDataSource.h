//
//  CollectionViewDataSource.h
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

@import UIKit;
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewDataSource : NSObject <UICollectionViewDelegate, UICollectionViewDataSource>

- (void)configureCollectionView: (UICollectionView *)collectionView;

- (void)reloadWithSections: (NSMutableArray *)sections
               identifiers: (NSString *(^)(void))identifiers
              configurator: (void (^)(UICollectionViewCell *, NSObject *))configurator
                  selector: (void (^)(NSObject *))selector;

@end

NS_ASSUME_NONNULL_END
