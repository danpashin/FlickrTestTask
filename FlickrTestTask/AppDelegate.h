//
//  AppDelegate.h
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic, nullable) UIWindow *window;

/// API private key to make requests
@property (copy, nonatomic, readonly) NSString *apiKey;

/// Endpoint of the api where requests are going
@property (copy, nonatomic, readonly) NSString *apiEndpoint;

@end

NS_ASSUME_NONNULL_END
