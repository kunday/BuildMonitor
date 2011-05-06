//
//  BuildMonitAppDelegate.h
//  BuildMonit
//
//  Created by Arvind Kunday on 02/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BuildStatusViewController.h"

@interface BuildMonitAppDelegate : NSObject <UIApplicationDelegate>{
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
