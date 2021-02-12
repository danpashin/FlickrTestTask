//
//  FTLoadingModel+Internal.h
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "FTLoadingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTLoadingModel (Internal)

- (void)queryMethod:(NSString *)method parameters:(NSDictionary <NSString*, NSString*> *)parameters;

@end

NS_ASSUME_NONNULL_END
