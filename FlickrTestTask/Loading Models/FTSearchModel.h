//
//  FTSearchModel.h
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import "FTLoadingModel.h"
#import "FTPhoto.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTSearchModel : FTLoadingModel

/// Tags which search results must contain. Default value is NULL
@property (strong, nonatomic, nullable) NSArray <NSString *> *tags;

@property (strong, nonatomic, nullable) NSString *text;

/// Number of items to search. Default value is 25
@property (assign, nonatomic) NSUInteger maxItemsToRequest;

/// Array of deserialized photos got from the API. Default is NULL
@property (strong, nonatomic, readonly, nullable) NSArray <FTPhoto *> *photos;

- (void)clearResults;

@end

NS_ASSUME_NONNULL_END
