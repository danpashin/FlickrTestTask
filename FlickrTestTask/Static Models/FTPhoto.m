//
//  FTPhoto.m
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "FTPhoto.h"

@implementation FTPhoto

- (nullable instancetype)initWithResponse:(NSDictionary *)response
{
    id identifier = response[@"id"];
    id server_id = response[@"server"];
    id secret = response[@"secret"];
    if (!identifier || !server_id || !secret) {
        return nil;
    }
    
    self = [self init];
    if (self) {
        _identifier = identifier;
        _server_id = server_id;
        _secret = secret;
        _caption = response[@"title"];
    }
    
    return self;
}

- (NSString *)stringSizeForSize:(FTPhotoSize)size
{
    switch (size) {
        case kFTPhotoSizeThumbnail75: return @"_s";
        case kFTPhotoSizeThumbnail150: return @"_q";
        case kFTPhotoSizeThumbnail100: return @"_t";
        
        case kFTPhotoSizeSmall240: return @"_m";
        case kFTPhotoSizeSmall320: return @"_n";
        case kFTPhotoSizeSmall400: return @"_w";
            
        case kFTPhotoSizeMedium500: return @"";
        case kFTPhotoSizeMedium640: return @"_z";
        case kFTPhotoSizeMedium800: return @"_c";
            
        case kFTPhotoSizeLarge1024: return @"_b";
    }
}

- (NSString *)urlForSize:(FTPhotoSize)size
{
    return [NSString stringWithFormat:
            @"https://live.staticflickr.com/%@/%@_%@%@.jpg", 
            self.server_id, self.identifier, self.secret, [self stringSizeForSize:size]
            ];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p; id: %@; caption: %@;>", 
            NSStringFromClass([self class]), self, self.identifier, self.caption];
}

@end
