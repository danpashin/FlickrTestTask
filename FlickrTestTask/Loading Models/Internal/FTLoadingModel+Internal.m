//
//  FTLoadingModel+Internal.m
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "FTLoadingModel+Internal.h"
#import "FTURLRequest.h"
#import "FTURLSession.h"

@implementation FTLoadingModel (Internal)

- (void)queryMethod:(NSString *)method parameters:(NSDictionary <NSString*, NSString*> *)parameters
{
    FTURLRequest *request = [[FTURLRequest alloc] initWithURL:[[self class] apiEndpoint]];
    request.parameters[@"format"] = @"json";
    request.parameters[@"nojsoncallback"] = @"1";
    [request.parameters addEntriesFromDictionary:parameters];
    request.parameters[@"method"] = method;
    
    // TODO: Move this key to main model or app delegate
    request.parameters[@"api_key"] = @"eedd1c39ee6367d74272360970bac2ce";
    
    [[FTURLSession sharedSession] sendRequest:request model:self];
}

@end
