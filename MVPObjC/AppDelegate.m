//
//  AppDelegate.m
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#import "AppDelegate.h"
#import "AppNavigator.h"
#import "NSArray+Safe.h"
@import UIKit;

@interface AppDelegate ()
@property (nonatomic, strong) AppNavigator *appNavigator;
@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.appNavigator = [[AppNavigator alloc] initWithWindow: self.window animateTransitions: YES];

    [self.appNavigator start];

    [self test];
    
    return YES;
}

- (void)test {
    NSArray<NSString *> *rows = [[NSArray alloc] initWithObjects:@"1",@"2",@"3", nil];
    NSLog(@">>> %@", [rows elementAtIndex:10] );
}


@end
