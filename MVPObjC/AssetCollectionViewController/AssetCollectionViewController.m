//
//  AssetCollectionViewController.m
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#import "AssetCollectionViewController.h"
#import "AssetCollectionViewCell.h"
#import "AssetViewModel.h"
#import "CollectionViewDataSource.h"
#import "CollectionSection.h"
#import "UTLMacros.h"

@interface AssetCollectionViewController ()
@property (nonatomic, strong, readonly) NSString *navTitle;
@property (nonatomic, strong, readonly) CollectionViewDataSource *dataSource;
@end


@implementation AssetCollectionViewController

- (void)dealloc {
    NSLog(@">>> dealloc");
}

-(instancetype)initWithTitle: (NSString *)title {
    self = [super initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
    if (self)
    {
        _navTitle = title;
        _dataSource = [CollectionViewDataSource new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.navTitle;
    self.collectionView.backgroundColor = UIColor.whiteColor;
    [self.dataSource configureCollectionView: self.collectionView];
    [self configureCollectionView];
    [self refreshView];
}

- (void)configureCollectionView {
    UINib *nib = [UINib nibWithNibName: @"AssetCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier: AssetCollectionViewCell.identifier];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    [layout setSectionInset:UIEdgeInsetsMake(20, 20, 20, 20)];
    [layout invalidateLayout];
}

- (void)refreshView {
    // test data
    NSMutableArray<AssetViewModel *> *rows = [[NSMutableArray alloc] initWithObjects:
                                              [[AssetViewModel alloc] initWithTitle: @"1"],
                                              [[AssetViewModel alloc] initWithTitle: @"2"],
                                              [[AssetViewModel alloc] initWithTitle: @"3"],
                                              nil];
    CollectionSection *section = [[CollectionSection alloc] initWithRows: rows];
    NSMutableArray<CollectionSection *> *sections = [[NSMutableArray alloc] initWithObjects:section, nil];

    [self.dataSource reloadWithSections: sections
                            identifiers:^NSString * _Nonnull {
                                return AssetCollectionViewCell.identifier;
                            }
                            configurator:^(UICollectionViewCell *cell, NSObject *viewModel) {
                                AssetViewModel *assetViewModel = (AssetViewModel *)viewModel;
                                AssetCollectionViewCell *viewCell = (AssetCollectionViewCell *)cell;
                                guard ( assetViewModel != nil && viewCell != nil) else { return; }
                                [viewCell configureViewWithViewModel:assetViewModel];
                            }
    ];
}

@end
