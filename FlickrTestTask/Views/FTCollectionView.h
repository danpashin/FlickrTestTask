//
//  FTCollectionView.h
//  FlickrTestTask
//
//  Created by Daniil on 15.02.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FTCollectionView : UICollectionView

/// Performs reloadData: method but also animates cells appearance.
/// @param animated Flag which indicates if cells need to be animated.
- (void)reloadDataAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
