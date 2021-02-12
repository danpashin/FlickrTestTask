//
//  FTHotTagsViewController.m
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "FTHotTagsViewController.h"
#import "FTHotTagsModel.h"
#import "FTHPhotoCollectionViewCell.h"
#import <os/log.h>

@interface FTHotTagsViewController () <FTLoadingModelDelegate>
@property (strong, nonatomic) FTHotTagsModel *model;
@property (assign, nonatomic) FTPhotoSize preferredPreviewSize;

@end

@implementation FTHotTagsViewController

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

- (void)commonInit
{
    _model = [FTHotTagsModel new];
    _model.delegate = self;
    _model.maxItemsToRequest = 25;
    _preferredPreviewSize = kFTPhotoSizeSmall240;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    layout.itemSize =  CGSizeMake(140.0, 120.0);
    layout.sectionInset = UIEdgeInsetsMake(10.0, 24.0, 10.0, 24.0);
    
    [self.collectionView registerClass:[FTHPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"previewCell"];
    [self.model queryAPI];
}

#pragma mark - FTLoadingModelDelegate

- (void)loadingModelReceivedUpdate:(FTHotTagsModel *)model
{
    dispatch_async(dispatch_get_main_queue(), ^{
        os_log_info(OS_LOG_DEFAULT, "Got new main screen photos: %{public}@", model.photos);
        
        [self.collectionView reloadData];
        
        UIViewAnimationOptions opts = UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState;
        [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:opts animations:^{
            [self.collectionView layoutIfNeeded];
        } completion:nil];
    });
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (NSInteger)self.model.photos.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FTHPhotoCollectionViewCell *cell = (FTHPhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"previewCell" forIndexPath:indexPath];
    cell.photo = self.model.photos[(NSUInteger)indexPath.row];
    cell.preferredPhotoSize = self.preferredPreviewSize;
    [cell updateContents];
    
    return cell;
}

@end
