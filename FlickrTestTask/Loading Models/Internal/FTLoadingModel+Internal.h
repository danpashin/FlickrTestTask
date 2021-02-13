//
//  FTLoadingModel+Internal.h
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "FTLoadingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTLoadingModel (Internal)

/// Prepares API query and sends it to the server.
/// @param method API method which needs to be executed.
/// @param parameters Method parameters. If method doesn't require any params an empty array must be passed.
- (void)queryMethod:(NSString *)method parameters:(NSDictionary <NSString*, NSString*> *)parameters;

@end

NS_ASSUME_NONNULL_END
