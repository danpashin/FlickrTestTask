//
//  AppDelegate.m
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "AppDelegate.h"
#import "FTHotTagsViewController.h"

@implementation AppDelegate

- (NSString *)apiKey
{
    return @"eedd1c39ee6367d74272360970bac2ce";
}

- (NSString *)apiEndpoint
{
    return @"https://api.flickr.com/services/rest/";
}


#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions
{    
    self.window = [UIWindow new];
    
    FTHotTagsViewController *hotTagsController = [FTHotTagsViewController new];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:hotTagsController];
    navController.navigationBar.prefersLargeTitles = YES;
    
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
