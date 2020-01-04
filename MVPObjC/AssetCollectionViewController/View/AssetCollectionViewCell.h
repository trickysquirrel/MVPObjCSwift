//
//  AssetCollectionViewCell.h
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

@import UIKit;
#import "UTLMacros.h"
@class AssetViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface AssetCollectionViewCell : UICollectionViewCell

UTL_REMOVE_DEFAULT_UIVIEW_INITIALIZERS;

@property (class, nonatomic, assign, readonly) NSString *identifier;

- (void)configureViewWithViewModel: (AssetViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
