//
//  FTPhoto.h
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger) {
    kFTPhotoSizeThumbnail75,
    kFTPhotoSizeThumbnail150,
    kFTPhotoSizeThumbnail100,
    
    kFTPhotoSizeSmall240,
    kFTPhotoSizeSmall320,
    kFTPhotoSizeSmall400,
    
    kFTPhotoSizeMedium500,
    kFTPhotoSizeMedium640,
    kFTPhotoSizeMedium800,
    
    kFTPhotoSizeLarge1024,
} FTPhotoSize;

NS_ASSUME_NONNULL_BEGIN

@interface FTPhoto : NSObject

@property (strong, nonatomic, readonly, nullable) NSNumber *identifier;

@property (strong, nonatomic, readonly, nullable) NSNumber *server_id;

@property (strong, nonatomic, readonly, nullable) NSString *secret;

@property (strong, nonatomic, nullable) NSString *caption;

- (instancetype)initWithResponse:(NSDictionary *)response;

- (NSString *)urlForSize:(FTPhotoSize)size;

@end

NS_ASSUME_NONNULL_END
