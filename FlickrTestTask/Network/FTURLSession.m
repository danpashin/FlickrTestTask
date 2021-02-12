//
//  FTURLSession.m
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "FTURLSession.h"
#import "FTURLRequest.h"
#import <os/log.h>

@interface FTURLSession ()

@property (strong, nonatomic, readonly) NSURLSession *session;

@end

@implementation FTURLSession

+ (instancetype)sharedSession
{
    static id session = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        session = [FTURLSession new];
    });
    
    return session;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:_config];
    }
    return self;
}

- (NSUInteger)sendRequest:(FTURLRequest *)request model:(id<FTResponseModel>)model
{
    NSURLRequest *urlRequest = [request build];
    
    __weak typeof(model) weakModel = model;
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __strong typeof(weakModel) _model = weakModel;
        if (!_model) {
            return;
        }
        
        // TODO: Add more error handling
        if (error) {
            os_log_error(OS_LOG_DEFAULT, "Got network error: %{public}@", error);
            [_model processResponse:nil];
            return;
        }
        
        if (![self validateResponse:response]) {
            os_log_error(OS_LOG_DEFAULT, "Failed to validate response: %{public}@", response);
            [_model processResponse:nil];
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingFragmentsAllowed error:&jsonError];
        if (!json || jsonError) {
            os_log_error(OS_LOG_DEFAULT, "Failed deserialize response as JSON: %{public}@", jsonError);
        }
        [_model processResponse:json];
    }];
    [dataTask resume];
    
    return dataTask.taskIdentifier;
}

// TODO: Add validation error or exception
- (BOOL)validateResponse:(NSURLResponse *)response
{
    if (![response isKindOfClass:[NSHTTPURLResponse class]]) {
        return NO;
    }
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSInteger status = httpResponse.statusCode;
    
    if (status < 200 || status >= 400) {
        return NO;
    }
    
    // TODO: needs MIME type validation
    
    return YES;
}

@end
