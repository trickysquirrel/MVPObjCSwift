//
//  AppNavigatorDelegate.h
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#ifndef AppNavigatorDelegate_h
#define AppNavigatorDelegate_h

@protocol AppNavigatorDelegate <NSObject>
@optional
- (void)showDetails:(NSString *)assetId title:(NSString *)title;
@end

#endif /* AppNavigatorDelegate_h */
