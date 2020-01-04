//
//  ViewControllerFactory.h
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

@import UIKit;
@import Foundation;
@class AssetCollectionViewController;

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerFactory : NSObject

- (AssetCollectionViewController *)makeHomeViewController;

@end

NS_ASSUME_NONNULL_END
