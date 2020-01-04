//
//  AssetCollectionViewCell.m
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#import "AssetCollectionViewCell.h"
#import "AssetViewModel.h"

@interface AssetCollectionViewCell()
@property (nonatomic, weak) IBOutlet UILabel *label;
@end


@implementation AssetCollectionViewCell

static NSString *_identifier = nil;

+ (NSString *)identifier {
  if (_identifier == nil) {
      _identifier = @"AssetCollectionViewCell";
  }
  return _identifier;
}

- (void)configureViewWithViewModel: (AssetViewModel *)viewModel {
    self.label.text = viewModel.title;
}
@end
