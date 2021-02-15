//
//  FTPhotoViewController.h
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FTPhotoViewController : UIViewController

/// Remote URL of the photo which will be used to download photo and display it.
@property (copy, nonatomic) NSURL *photoURL;

@end

NS_ASSUME_NONNULL_END
