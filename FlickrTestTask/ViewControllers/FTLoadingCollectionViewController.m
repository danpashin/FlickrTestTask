//
//  FTLoadingCollectionViewController.m
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import "FTLoadingCollectionViewController.h"
#import "FTCollectionView.h"
#import "FTCollectionViewSquareLayout.h"

@interface FTLoadingCollectionViewController ()
@property (null_resettable, nonatomic, strong) FTCollectionView *collectionView;
@end

@implementation FTLoadingCollectionViewController
@dynamic collectionView;

- (instancetype)init
{
    return [self initWithCollectionViewLayout:[FTCollectionViewSquareLayout new]];
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

- (void)loadView
{
    self.collectionView = [[FTCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.collectionViewLayout];
}

#pragma mark - FTLoadingModelDelegate

- (void)loadingModelReceivedUpdate:(FTLoadingModel *)model
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadDataAnimated:YES];
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
