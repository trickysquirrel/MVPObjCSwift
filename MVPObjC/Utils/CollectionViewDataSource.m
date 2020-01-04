//
//  CollectionViewDataSource.m
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

@import Foundation;
#import "CollectionViewDataSource.h"
#import "CollectionSection.h"
#import "UTLMacros.h"
#import "NSArray+Safe.h"


@interface CollectionViewDataSource ()
@property (nonatomic, strong) NSMutableArray<CollectionSection *> *sections;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, copy) NSString *(^identifiersClosure)(void);
@property (nonatomic, copy) void (^configureCellClosure)(UICollectionViewCell *cell, NSObject *viewModel);
@end



@implementation CollectionViewDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        _sections = [NSMutableArray new];
    }
    return self;
}

- (void)configureCollectionView: (UICollectionView *)collectionView {
    self.collectionView = collectionView;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)reloadWithSections: (NSMutableArray *)sections
               identifiers: (NSString *(^)(void))identifiers
              configurator: (void (^)(UICollectionViewCell *, NSObject *))configurator {
    guard(self.collectionView != nil) else {
        NSLog(@"ERROR please make sure to first call configureCollectionView");
        return;
    }
    self.identifiersClosure = identifiers;
    self.configureCellClosure = configurator;
    self.sections = sections;
    [self.collectionView reloadData];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *cellId = self.identifiersClosure();
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier: cellId forIndexPath:indexPath];
    CollectionSection *_Nullable section = [self.sections elementAtIndex:indexPath.section];
    NSObject *_Nullable viewModel = [section.rows elementAtIndex:indexPath.row];

    if (cell != nil && viewModel != nil) {
        self.configureCellClosure(cell, viewModel);
    }

    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sections[section].rows.count;
}

@end
