//
//  FTSearchModel.m
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import "FTSearchModel.h"
#import "FTLoadingModel+Internal.h"

@implementation FTSearchModel

- (void)queryAPI
{
    [self queryMethod:@"flickr.photos.search" parameters:@{
        @"tags": [self.tags componentsJoinedByString:@","],
        @"per_page": [NSString stringWithFormat:@"%zd", self.maxItemsToRequest]
    }];
}

- (BOOL)processResponse:(nullable NSDictionary *)response
{
    NSDictionary *photosResponse = response[@"photos"];
    NSMutableArray <FTPhoto *> *photos = [NSMutableArray arrayWithCapacity:[photosResponse[@"perpage"] unsignedIntegerValue]];
    _photos = photos;
    
    for (NSDictionary *photoDict in photosResponse[@"photo"]) {
        FTPhoto *photo = [[FTPhoto alloc] initWithResponse:photoDict];
        [photos addObject:photo];
    }
    
    [super processResponse:response];
    
    return YES;
}

@end
