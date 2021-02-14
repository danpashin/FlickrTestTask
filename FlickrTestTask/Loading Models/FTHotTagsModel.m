//
//  FTHotTagsModel.m
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "FTHotTagsModel.h"
#import "FTLoadingModel+Internal.h"
#import "FTPhoto.h"

@implementation FTHotTagsModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _maxItemsToRequest = 25;
        _photos = nil;
    }
    return self;
}

- (void)queryAPI
{
    NSAssert(self.maxItemsToRequest != 0, @"Set the items count to request");
    [self queryMethod:@"flickr.tags.getHotList" parameters:@{
        @"count": [NSString stringWithFormat:@"%zd", self.maxItemsToRequest],
        @"period": @"week"
    }];
}

- (BOOL)processResponse:(nullable NSDictionary *)response
{
    if (![super processResponse:response]) {
        return NO;
    }
    
    NSMutableArray <FTPhoto *> *photos = [NSMutableArray arrayWithCapacity:[response[@"count"] unsignedIntegerValue]];
    _photos = photos;
    
    for (NSDictionary *tag in response[@"hottags"][@"tag"]) {
        // TODO: Add check for failure
        NSDictionary *photoArray = tag[@"thm_data"][@"photos"][@"photo"][0];
        
        FTPhoto *photo = [[FTPhoto alloc] initWithResponse:photoArray];
        photo.caption = tag[@"_content"];
        [photos addObject:photo];
    }
    
    [self.delegate loadingModelReceivedUpdate:self];
    return photos.count;
}

@end
