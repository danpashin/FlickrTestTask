//
//  FTLoadingModel+Internal.m
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "FTLoadingModel+Internal.h"
#import "FTURLRequest.h"
#import "FTURLSession.h"
#import "AppDelegate.h"

@implementation FTLoadingModel (Internal)

- (void)queryMethod:(NSString *)method parameters:(NSDictionary <NSString*, NSString*> *)parameters
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    FTURLRequest *request = [[FTURLRequest alloc] initWithURL:appDelegate.apiEndpoint];
    request.parameters[@"format"] = @"json";
    request.parameters[@"nojsoncallback"] = @"1";
    [request.parameters addEntriesFromDictionary:parameters];
    request.parameters[@"method"] = method;
    request.parameters[@"api_key"] = appDelegate.apiKey;
    
    [[FTURLSession sharedSession] sendRequest:request model:self];
}

@end
