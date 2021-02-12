//
//  FTLoadingModel.h
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import <Foundation/Foundation.h>
#import "FTResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class FTLoadingModel;

@protocol FTLoadingModelDelegate <NSObject>

- (void)loadingModelReceivedUpdate:(FTLoadingModel *)model;

@end

@interface FTLoadingModel : NSObject <FTResponseModel>

+ (NSString *)apiEndpoint;

@property (weak, nonatomic) id <FTLoadingModelDelegate> delegate;

- (void)queryAPI;

@end

NS_ASSUME_NONNULL_END
