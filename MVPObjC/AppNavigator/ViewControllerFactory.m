//
//  ViewControllerFactory.m
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#import "ViewControllerFactory.h"
#import "AssetCollectionViewController.h"

@implementation ViewControllerFactory

- (UIViewController *)makeHomeViewController; {
    UIViewController *viewController = [[AssetCollectionViewController alloc] initWithTitle: @"Movies"];
    return viewController;
}

@end
