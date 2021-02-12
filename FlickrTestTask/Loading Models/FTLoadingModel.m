//
//  FTLoadingModel.m
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "FTLoadingModel.h"

@implementation FTLoadingModel

+ (NSString *)apiEndpoint
{
    return @"https://api.flickr.com/services/rest/";
}

- (void)queryAPI
{
    [NSException raise:@"queryAPI is not implemented." format:@"Subclasses must implement a valid method"];
}

- (BOOL)processResponse:(nullable NSDictionary *)response
{
    [self.delegate loadingModelReceivedUpdate:self];
    return NO;
}

@end
