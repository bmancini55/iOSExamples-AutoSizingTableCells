//
//  AppDelegate.m
//  AutoSizingTableCells
//
//  Created by Brian Mancini on 7/26/14.
//  Copyright (c) 2014 RedTurn. All rights reserved.
//

#import "AppDelegate.h"
#import "AutoSizingController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    UINavigationController *rootController = [[UINavigationController alloc]initWithRootViewController:[[AutoSizingController alloc]init]];
    self.window.rootViewController = rootController;
    
    return YES;
}

@end
