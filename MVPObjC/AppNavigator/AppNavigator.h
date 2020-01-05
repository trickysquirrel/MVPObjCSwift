//
//  AppNavigator.h
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

@import Foundation;
#import "UTLMacros.h"
#import "AppNavigatorDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppNavigator : NSObject <AppNavigatorDelegate>

// this ensures that only the initialiser defined here is allowed to be used
UTL_REMOVE_DEFAULT_NSOBJECT_INITIALIZERS;
- (nonnull instancetype)initWithWindow: (UIWindow *)window animateTransitions:(BOOL) animateTransitions;

- (void)start;

@end

NS_ASSUME_NONNULL_END

