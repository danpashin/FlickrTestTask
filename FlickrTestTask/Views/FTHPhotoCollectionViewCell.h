//
//  FTHPhotoCollectionViewCell.h
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import <UIKit/UIKit.h>
#import "FTPhoto.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTHPhotoCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) FTPhoto *photo;

@property (assign, nonatomic) FTPhotoSize preferredPhotoSize;

@property (strong, nonatomic, readonly) UIImageView *photoView;

@property (strong, nonatomic, readonly) UILabel *caption;

- (void)updateContents;

@end

NS_ASSUME_NONNULL_END
