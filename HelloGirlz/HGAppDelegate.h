//
//  HGAppDelegate.h
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/13/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "HGFirstViewController.h"
//#import "HGSecondViewController.h"
//#import "PhotoViewController.h"
//
//@class HGFirstViewController;
//@class HGSecondViewController;
//@class PhotoViewController;

@interface HGAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
//    UITabBarController *tabBarController;
//    HGFirstViewController* firstViewController;
//    HGSecondViewController* secondViewController;
//    PhotoViewController* photoViewController;

}

@property (strong, nonatomic) IBOutlet UIWindow* window;
//@property (nonatomic, strong) UITabBarController* tabBarController;
//@property (nonatomic, strong) PhotoViewController* photoViewController;
//@property (nonatomic, strong) HGFirstViewController* firstViewController;
//@property (nonatomic, strong) HGSecondViewController* secondViewController;

@end
