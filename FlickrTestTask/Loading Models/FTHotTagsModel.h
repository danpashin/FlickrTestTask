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

@property (assign, nonatomic) NSUInteger maxItemsToRequest;

@property (strong, nonatomic, readonly, nullable) NSArray <FTPhoto *> *photos;

@end

NS_ASSUME_NONNULL_END
