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

@property (strong, nonatomic) FTPhoto *photo;

@property (assign, nonatomic) FTPhotoSize preferredPhotoSize;

@property (strong, nonatomic, readonly) UIImageView *photoView;

@property (strong, nonatomic, readonly) UILabel *caption;

@property (assign, nonatomic) BOOL showsCaption;

- (void)updateContents;

@end

NS_ASSUME_NONNULL_END
