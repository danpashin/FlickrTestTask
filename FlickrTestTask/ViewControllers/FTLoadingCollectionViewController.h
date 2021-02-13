//
//  FTLoadingCollectionViewController.h
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import <UIKit/UIKit.h>
#import "FTLoadingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTLoadingCollectionViewController : UICollectionViewController <FTLoadingModelDelegate>

- (void)commonInit;

@end

NS_ASSUME_NONNULL_END
