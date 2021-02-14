//
//  FTLoadingModel.h
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import <Foundation/Foundation.h>
#import "FTResponseModel.h"
#import "FTLoadingModelError.h"

NS_ASSUME_NONNULL_BEGIN

@class FTLoadingModel;

@protocol FTLoadingModelDelegate <NSObject>

/// This method is called each time model ends updating its response data
/// @param model Model instance which ended updating data
- (void)loadingModelReceivedUpdate:(FTLoadingModel *)model;

- (void)loadingModel:(FTLoadingModel *)model finishedWithError:(FTLoadingModelError *)error;

@end

@interface FTLoadingModel : NSObject <FTResponseModel>

/// Endpoint of the current API
+ (NSString *)apiEndpoint;

@property (weak, nonatomic) id <FTLoadingModelDelegate> delegate;

/// Sends query in background to the API server
- (void)queryAPI;

@end

NS_ASSUME_NONNULL_END
