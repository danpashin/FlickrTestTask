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

@property (strong, nonatomic, readonly) NSArray <FTPhoto *> *photos;

@end

NS_ASSUME_NONNULL_END
