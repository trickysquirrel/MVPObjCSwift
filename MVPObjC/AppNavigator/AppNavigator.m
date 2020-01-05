//
//  AppNavigator.m
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

@import UIKit;
#import "AppNavigator.h"
#import "ViewControllerFactory.h"
#import "AssetCollectionViewController.h"

@interface AppNavigator ()
@property (nonatomic, strong, readonly) UIWindow *window;
@property (nonatomic, strong, readonly) UINavigationController *navigationController;
@property (nonatomic, readonly) BOOL animateTransitions;
@property (nonatomic, strong, readonly) ViewControllerFactory *viewControllerFactory;
@end


@implementation AppNavigator

- (nonnull instancetype)initWithWindow: (UIWindow *)window animateTransitions:(BOOL) animateTransitions
{
    self = [super init];
    if (self) {
        _window = window;
        _animateTransitions = animateTransitions;
        _navigationController = [UINavigationController new];
        _viewControllerFactory = [ViewControllerFactory new];
        [_window setRootViewController:_navigationController];
        [_window makeKeyAndVisible];
    }
    return self;
}

- (void)start
{
    AssetCollectionViewController *viewController = [self.viewControllerFactory makeHomeViewController];
    viewController.delegate = self;
    [self navigationController: self.navigationController pushOnViewController: viewController];
}

- (void)navigationController: (UINavigationController *)navigationController
        pushOnViewController: (UIViewController*)pushOnViewController
{
    [navigationController pushViewController: pushOnViewController animated: self.animateTransitions];
}

- (void)showDetails:(NSString *)assetId
              title:(NSString *)title
{
    // push on same VC, just an example for now using to test retrain cycles
    AssetCollectionViewController *viewController = [self.viewControllerFactory makeHomeViewController];
    viewController.delegate = self;
    [self navigationController: self.navigationController pushOnViewController: viewController];
}

@end
