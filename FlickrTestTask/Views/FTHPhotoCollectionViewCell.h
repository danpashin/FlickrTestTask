//
//  FTHPhotoCollectionViewCell.h
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import <UIKit/UIKit.h>
#import "FTPhoto.h"
#import "FTTouchResponsiveCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTHPhotoCollectionViewCell : FTTouchResponsiveCollectionViewCell

/// Instance of the displayed photo
@property (strong, nonatomic) FTPhoto *photo;

/// Size of the photo preview. Default is kFTPhotoSizeSmall240
@property (assign, nonatomic) FTPhotoSize preferredPhotoSize;

/// Photo view. Shows nothing if photo can't be displayed.
@property (strong, nonatomic, readonly) UIImageView *photoView;

/// Caption under the photo. Can be hidden by showsCaption property.
@property (strong, nonatomic, readonly) UILabel *caption;

/// Shows or hides caption. Default is YES.
@property (assign, nonatomic) BOOL showsCaption;

/// Updates caption and photo with data containing in the photo property.
- (void)updateContents;

@end

NS_ASSUME_NONNULL_END
