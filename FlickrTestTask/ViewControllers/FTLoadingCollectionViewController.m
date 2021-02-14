//
//  FTLoadingCollectionViewController.m
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import "FTLoadingCollectionViewController.h"
#import <os/log.h>

@implementation FTLoadingCollectionViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    layout.sectionInset = UIEdgeInsetsMake(8.0, 8.0, 8.0, 8.0);
    
    if ([UIDevice currentDevice].userInterfaceIdiom != UIUserInterfaceIdiomPad) {
        layout.itemSize =  CGSizeMake(112.0, 112.0);
        layout.minimumLineSpacing = 8.0;
        layout.minimumInteritemSpacing = 8.0;
    } else {
        layout.itemSize =  CGSizeMake(140.0, 140.0);
        layout.minimumLineSpacing = 16.0;
        layout.minimumInteritemSpacing = 8.0;
    }
}

#pragma mark - FTLoadingModelDelegate

- (void)loadingModelReceivedUpdate:(FTLoadingModel *)model
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
        
        UIViewAnimationOptions opts = UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState;
        [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:opts animations:^{
            [self.collectionView layoutIfNeeded];
        } completion:nil];
    });
}

- (void)loadingModel:(FTLoadingModel *)model finishedWithError:(FTLoadingModelError *)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error has occurred" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) { }]];
        [self presentViewController:alertController animated:YES completion:nil];
    });
}

@end
