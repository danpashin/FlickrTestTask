//
//  FTSearchModel.m
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import "FTSearchModel.h"
#import "FTLoadingModel+Internal.h"

@implementation FTSearchModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _maxItemsToRequest = 25;
        _photos = nil;
        _tags = nil;
    }
    return self;
}

- (void)queryAPI
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"per_page"] = [NSString stringWithFormat:@"%zd", self.maxItemsToRequest];
    if (self.tags.count > 0) {
        parameters[@"tags"] = [self.tags componentsJoinedByString:@","];
    }
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
