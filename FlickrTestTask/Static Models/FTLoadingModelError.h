//
//  FTLoadingModelError.h
//  FlickrTestTask
//
//  Created by Daniil on 14.02.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FTLoadingModelErrorType) {
    kFTLoadingModelErrorTypeServer,
};

@interface FTLoadingModelError : NSError

+ (instancetype)errorWithType:(FTLoadingModelErrorType)type code:(NSInteger)code;

+ (instancetype)errorWithType:(FTLoadingModelErrorType)type code:(NSInteger)code description:(NSString *)description;

@end

NS_ASSUME_NONNULL_END
