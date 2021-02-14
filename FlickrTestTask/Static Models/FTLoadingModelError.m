//
//  FTLoadingModelError.m
//  FlickrTestTask
//
//  Created by Daniil on 14.02.2021.
//

#import "FTLoadingModelError.h"

@implementation FTLoadingModelError

+ (instancetype)errorWithType:(FTLoadingModelErrorType)type code:(NSInteger)code
{
    return [self errorWithDomain:NSCocoaErrorDomain code:code userInfo:@{
        @"error_type": @(type)
    }];
}

+ (instancetype)errorWithType:(FTLoadingModelErrorType)type code:(NSInteger)code description:(NSString *)description
{
    return [self errorWithDomain:NSCocoaErrorDomain code:type userInfo:@{
        @"error_type": @(type),
        NSLocalizedDescriptionKey: description
    }];
}

@end
