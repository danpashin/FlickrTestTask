//
//  FTPhoto.h
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, FTPhotoSize) {
    // cropped square
    kFTPhotoSizeThumbnail75,
    // cropped square
    kFTPhotoSizeThumbnail150,
    kFTPhotoSizeThumbnail100,
    
    kFTPhotoSizeSmall240,
    kFTPhotoSizeSmall320,
    kFTPhotoSizeSmall400,
    
    kFTPhotoSizeMedium500,
    kFTPhotoSizeMedium640,
    kFTPhotoSizeMedium800,
    
    kFTPhotoSizeLarge1024,
};

NS_ASSUME_NONNULL_BEGIN

@interface FTPhoto : NSObject

/// Unique photo identifier
@property (strong, nonatomic, readonly) NSNumber *identifier;

/// Unique server identifier which stores current photo
@property (strong, nonatomic, readonly) NSNumber *server_id;

@property (strong, nonatomic, readonly) NSString *secret;

/// Photo label made by photo uploader
@property (strong, nonatomic, nullable) NSString *caption;

/// Creates object instance with server response. Can return NULL if some parameters are not provided.
/// @param response Server response with which instance will be created.
- (nullable instancetype)initWithResponse:(NSDictionary *)response;

/// Creates photo URL with provided size
/// @param size Size of the photo. Must be provided.
- (NSURL *)urlForSize:(FTPhotoSize)size;

@end

NS_ASSUME_NONNULL_END
