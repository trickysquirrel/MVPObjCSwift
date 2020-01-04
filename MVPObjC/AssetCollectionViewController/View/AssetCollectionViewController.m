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
#import "AssetCollectionPresenter.h"
#import "UTLMacros.h"

@interface AssetCollectionViewController ()
@property (nonatomic, copy, readonly) NSString *navTitle;
@property (nonatomic, strong, readonly) CollectionViewDataSource *dataSource;
@property (nonatomic, strong, readonly) AssetCollectionPresenter *presenter;
@end


@implementation AssetCollectionViewController

- (void)dealloc
{
    NSLog(@">>> dealloc retain cycles clear");
}

-(instancetype)initWithTitle: (NSString *)title
{
    self = [super initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
    if (self)
    {
        _navTitle = title;
        _dataSource = [CollectionViewDataSource new];
        _presenter = [AssetCollectionPresenter new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.navTitle;
    self.collectionView.backgroundColor = UIColor.whiteColor;
    [self.dataSource configureCollectionView: self.collectionView];
    [self configureCollectionView];
    [self refreshView];
}

- (void)configureCollectionView
{
    UINib *nib = [UINib nibWithNibName: @"AssetCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier: AssetCollectionViewCell.identifier];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    [layout setSectionInset:UIEdgeInsetsMake(20, 20, 20, 20)];
    [layout invalidateLayout];
}

- (void)refreshView
{
    __weak typeof (self) weakSelf = self;

    [self.presenter updateViewOnQueue: dispatch_get_main_queue()

        onLoading:^(BOOL isLoading) {

            // on loading

        } onSuccess:^(NSArray<AssetViewModel *> * _Nonnull viewModels) {

            CollectionSection *section = [[CollectionSection alloc] initWithRows: viewModels];
            NSMutableArray<CollectionSection *> *sections = [[NSMutableArray alloc] initWithObjects:section, nil];
            [weakSelf reloadSections: sections];

        } onError:^(NSError * _Nonnull error) {

            // on error

        }
    ];
}

- (void)reloadSections: (NSMutableArray<CollectionSection *> *)sections
{
    __weak typeof (self) weakSelf = self;

    [self.dataSource reloadWithSections: sections
                            identifiers:^NSString * _Nonnull {
                                return AssetCollectionViewCell.identifier;
                            }
                            configurator:^(UICollectionViewCell *cell, NSObject *viewModel) {
                                [weakSelf configureCell: cell viewModel: viewModel];
                            }
                            selector: ^(NSObject *viewModel) {
                                [weakSelf.delegate showDetails: @"123" title: @"test title"];
                            }
    ];
}

- (void)configureCell: (UICollectionViewCell *)cell viewModel:(NSObject *)viewModel
{
    AssetViewModel *assetViewModel = (AssetViewModel *)viewModel;
    AssetCollectionViewCell *viewCell = (AssetCollectionViewCell *)cell;
    guard ( assetViewModel != nil && viewCell != nil) else { return; }
    [viewCell configureViewWithViewModel:assetViewModel];
}

@end
