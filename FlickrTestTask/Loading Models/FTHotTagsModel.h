//
//  FTHotTagsModel.h
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "FTLoadingModel.h"
#import "FTPhoto.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTHotTagsModel : FTLoadingModel

/// Number of items to request. Default value is 25
@property (assign, nonatomic) NSUInteger maxItemsToRequest;

/// Array of deserialized photos got from the API. Default is NULL
@property (strong, nonatomic, readonly, nullable) NSArray <FTPhoto *> *photos;

@end

NS_ASSUME_NONNULL_END
