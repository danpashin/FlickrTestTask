//
//  FTTagDetailViewController.h
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import "FTLoadingCollectionViewController.h"
#import "FTSearchModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTTagDetailViewController : FTLoadingCollectionViewController

@property (strong, nonatomic, readonly) FTSearchModel *model;

@end

NS_ASSUME_NONNULL_END
