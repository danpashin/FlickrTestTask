//
//  FTURLRequest.m
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "FTURLRequest.h"

@implementation FTURLRequest


#pragma mark - Public methods

- (instancetype)initWithURL:(NSString *)stringURL
{
    return [self initWithURL:stringURL parameters:nil];
}

- (instancetype)initWithURL:(NSString *)stringURL parameters:(nullable FTURLRequestParameters)parameters
{
    self = [super init];
    if (self) {
        _stringURL = stringURL;
        _parameters = parameters ? [parameters mutableCopy] : [NSMutableDictionary dictionary];
        _httpMethod = kFTHTTPMethodGET;
    }
    
    return self;
}

- (NSURLRequest *)build
{
    NSURL *url = [self buildURL];
    NSAssert(url != nil, @"Cannot build URL from %@", self.stringURL);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = [self httpStringMethod];
    
    return request;
}


#pragma mark - Private methods

- (NSURL *)buildURL
{
    FTURLRequestParameters parameters = self.parameters;
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:self.stringURL];
    
    if (parameters.count > 0) {
        NSMutableArray *queryItems = [NSMutableArray arrayWithCapacity:parameters.count];
        for (NSString *key in parameters) {
            [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:parameters[key]]];
        }
        
        urlComponents.queryItems = queryItems;
    }
    
    return urlComponents.URL;
}

- (NSString *)httpStringMethod
{
    switch (self.httpMethod) {
        case kFTHTTPMethodGET:
            return @"GET";
    }
}

@end
