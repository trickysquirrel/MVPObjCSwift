//
//  AssetCollectionViewController.h
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

@import UIKit;
#import "UTLMacros.h"
#import "AppNavigatorDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AssetCollectionViewController : UICollectionViewController

@property (nonatomic, weak) id <AppNavigatorDelegate> delegate;

UTL_REMOVE_DEFAULT_UIVIEWCONTROLLER_INITIALIZERS;

-(instancetype)initWithTitle: (NSString *)title;

@end

NS_ASSUME_NONNULL_END
