//
//  FTHotTagsViewController.m
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "FTHotTagsViewController.h"
#import "FTHotTagsModel.h"
#import "FTHPhotoCollectionViewCell.h"
#import "FTTagDetailViewController.h"
#import "FTPhotoSearchResultsViewController.h"

@interface FTHotTagsViewController ()
@property (strong, nonatomic) FTHotTagsModel *model;
@property (assign, nonatomic) FTPhotoSize preferredPreviewSize;
@end

@implementation FTHotTagsViewController

- (void)commonInit
{
    _model = [FTHotTagsModel new];
    _model.delegate = self;
    _model.maxItemsToRequest = 25;
    _preferredPreviewSize = kFTPhotoSizeSmall240;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Popular tags";
    
    FTPhotoSearchResultsViewController *resultsVC = [FTPhotoSearchResultsViewController new];
    self.navigationItem.searchController = [[UISearchController alloc] initWithSearchResultsController:resultsVC];
    self.navigationItem.searchController.searchResultsUpdater = resultsVC;
    
    [self.collectionView registerClass:[FTHPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"previewCell"];
    [self.model queryAPI];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (NSInteger)self.model.photos.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FTHPhotoCollectionViewCell *cell = (FTHPhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"previewCell"
                                                                                                               forIndexPath:indexPath];
    cell.photo = self.model.photos[(NSUInteger)indexPath.row];
    cell.preferredPhotoSize = self.preferredPreviewSize;
    [cell updateContents];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    FTTagDetailViewController *detail = [FTTagDetailViewController new];
    detail.model.tags = @[
        self.model.photos[(NSUInteger)indexPath.row].caption
    ];
    [self.navigationController pushViewController:detail animated:YES];
}

@end
