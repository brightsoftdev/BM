//
//  HGAppDelegate.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/13/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "HGAppDelegate.h"
#import <Three20/Three20.h>

@implementation HGAppDelegate

//@synthesize photoViewController;
//@synthesize firstViewController;
//@synthesize secondViewController;
//@synthesize tabBarController;
@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //THREE20 SHITTY STUFFS
//    [[TTURLRequestQueue mainQueue] setMaxContentLength:0];
//    TTNavigator *navigator = [TTNavigator navigator];
//    navigator.persistenceMode = TTNavigatorPersistenceModeAll;
//    navigator.window = [[UIWindow alloc] initWithFrame:TTScreenBounds()];
//    
//    TTURLMap *map = navigator.URLMap;
////    [map from:@"tt://appPhotos" toSharedViewController:[PhotoViewController class]];
//    
//    [map from:@"tt://appPhotos" toViewController:[PhotoViewController class]];
    
    // set up tab bar controller manually
//    tabBarController = [[UITabBarController alloc] init];        
//    firstViewController = [[HGFirstViewController alloc] init];  
//    secondViewController = [[HGSecondViewController alloc] init];  
//    photoViewController = [[PhotoViewController alloc] init];  
//    
//    /* This is the essential part of the solution. You have to add the albumController to a 
//     new  navigation controller and init it as RootViewController*/
//    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:photoViewController];
//    
//    // now add all controllers to the tabBarController
//    tabBarController.viewControllers = [NSArray arrayWithObjects:firstViewController, secondViewController, navController, nil];   
//    
//
//    
//    [window addSubview:tabBarController.view];                                             
    [window makeKeyAndVisible];  
    
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)URL {
    [[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:URL.absoluteString]];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
