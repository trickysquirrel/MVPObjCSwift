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

@interface AppNavigator ()
@property (nonatomic, strong, readonly) UIWindow *window;
@property (nonatomic, strong, readonly) UINavigationController *navigationController;
@property (nonatomic, readonly) BOOL animateTransitions;
@property (nonatomic, strong, readonly) ViewControllerFactory *viewControllerFactory;

//@property (nonatomic, strong, readonly) InformationAlertProtocol *informationAlert;

@end


@implementation AppNavigator

- (instancetype)initWithWindow: (UIWindow *)window animateTransitions:(BOOL) animateTransitions
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

- (void)start {
    UIViewController *viewController = [self.viewControllerFactory makeHomeViewController];
    [self navigationController: self.navigationController pushOnViewController: viewController];
}

- (void)navigationController: (UINavigationController *)navigationController pushOnViewController:(UIViewController*)pushOnViewController {
    [navigationController pushViewController: pushOnViewController animated: self.animateTransitions];
}

@end
