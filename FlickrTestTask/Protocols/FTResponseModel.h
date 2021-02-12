//
//  FTResponseModel.h
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#ifndef FTResponseModel_h
#define FTResponseModel_h

NS_ASSUME_NONNULL_BEGIN

@protocol FTResponseModel <NSObject>

- (BOOL)processResponse:(nullable NSDictionary *)response;

@end

NS_ASSUME_NONNULL_END

#endif /* FTResponseModel_h */
