//
//  FTURLRequest.h
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSMutableDictionary <NSString*, NSString*> *FTURLRequestParameters;

typedef NS_ENUM(NSUInteger) {
    kFTHTTPMethodGET,
} FTHTTPMethod;

@interface FTURLRequest : NSObject

@property (strong, nonatomic, readonly) NSString *stringURL;

@property (strong, nonatomic, readonly, nullable) NSMutableDictionary <NSString*, NSString*> *parameters;

@property (assign, nonatomic) FTHTTPMethod httpMethod;

- (instancetype)initWithURL:(NSString *)stringURL;
- (instancetype)initWithURL:(NSString *)stringURL parameters:(nullable FTURLRequestParameters)parameters;

- (NSURLRequest *)build;

@end

NS_ASSUME_NONNULL_END
