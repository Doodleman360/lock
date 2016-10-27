//
//  AppDelegate.m
//  lock
//
//  Created by Julien Sloan on 10/26/16.
//  Copyright © 2016 Julien Sloan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    // determine whether we've launched from a shortcut item or not
    UIApplicationShortcutItem *item = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
    if (item) {
        NSLog(@"We've launched from shortcut item: %@", item.localizedTitle);
    } else {
        NSLog(@"We've launched properly.");
    }
    
    // have we launched Deep Link Level 1
    if ([item.type isEqualToString:@"com.test.key"]) {
        [self launchUnlocked];
    } else {
        [self launchlocked];
    }
    
    return YES;
}


- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    // react to shortcut item selections
    NSLog(@"A shortcut item was pressed. It was %@.", shortcutItem.localizedTitle);
    
    // have we launched Deep Link Level 1
    if ([shortcutItem.type isEqualToString:@"com.test.key"]) {
        [self launchUnlocked];
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
     [self launchlocked];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)launchUnlocked {
    
     NSLog(@"launching unlocked view controller");
    
    // grab our storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    // and instantiate our navigation controller
    UINavigationController *controller = [storyboard instantiateViewControllerWithIdentifier:@"Unlock"];
    
    // make it the key window
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    
}

- (void)launchlocked {
    
    NSLog(@"launching Locked view controller");
    
    // grab our storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    // and instantiate our navigation controller
    UINavigationController *controller = [storyboard instantiateViewControllerWithIdentifier:@"Locked"];
    
    // make it the key window
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    
}


@end
