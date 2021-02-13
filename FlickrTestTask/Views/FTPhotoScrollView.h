//
//  FTPhotoScrollView.h
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FTPhotoScrollView : UIScrollView

@property (strong, nonatomic, readonly) UIImageView *photoView;

@property (strong, nonatomic, readonly) NSLayoutConstraint *photoTrailingConstraint;
@property (strong, nonatomic, readonly) NSLayoutConstraint *photoLeadingConstraint;
@property (strong, nonatomic, readonly) NSLayoutConstraint *photoBottomConstraint;
@property (strong, nonatomic, readonly) NSLayoutConstraint *photoTopConstraint;

@end

NS_ASSUME_NONNULL_END
