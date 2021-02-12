//
//  FTURLSession.h
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import <Foundation/Foundation.h>
#import "FTResponseModel.h"

@class FTURLRequest;

NS_ASSUME_NONNULL_BEGIN

@interface FTURLSession : NSObject

@property (strong, nonatomic, readonly) NSURLSessionConfiguration *config;

+ (instancetype)sharedSession;

- (NSUInteger)sendRequest:(FTURLRequest *)request model:(id<FTResponseModel>)model;

@end

NS_ASSUME_NONNULL_END
