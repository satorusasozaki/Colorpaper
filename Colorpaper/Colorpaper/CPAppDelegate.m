//
//  CPAppDelegate.m
//  Colorpaper
//
//  Created by Satoru Sasozaki on 12/22/15.
//  Copyright © 2015 Satoru Sasozaki. All rights reserved.
//

#import "CPAppDelegate.h"
#import "CPTableViewController.h"
@interface CPAppDelegate ()
@end

@implementation CPAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CPTableViewController *tableView = [[CPTableViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tableView;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
