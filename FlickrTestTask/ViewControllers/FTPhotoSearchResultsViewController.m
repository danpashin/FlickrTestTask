//
//  FTPhotoSearchResultsViewController.m
//  FlickrTestTask
//
//  Created by Daniil on 14.02.2021.
//

#import "FTPhotoSearchResultsViewController.h"
#import "FTSearchModel.h"
#import "FTHPhotoCollectionViewCell.h"
#import "FTPhotoViewController.h"

@interface FTPhotoSearchResultsViewController ()

@property (strong, nonatomic, nullable) dispatch_block_t throttledSearchBlock;

@property (strong, nonatomic, nullable) FTSearchModel *model;

@end

@implementation FTPhotoSearchResultsViewController

- (instancetype)init
{
    return [super initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
}

- (void)commonInit
{    
    _model = [FTSearchModel new];
    _model.delegate = self;
    _model.maxItemsToRequest = 50;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.collectionView registerClass:[FTHPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"previewCell"];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    if (self.throttledSearchBlock) {
        dispatch_block_cancel(self.throttledSearchBlock);
    }
    
    NSString *text = [searchController.searchBar.text copy];
    if (text.length == 0) {
        [self.model clearResults];
        return;
    }
    
    self.throttledSearchBlock = dispatch_block_create(0, ^{
        self.model.text = text;
        [self.model queryAPI];
    });
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), queue, self.throttledSearchBlock);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (NSInteger)self.model.photos.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FTHPhotoCollectionViewCell *cell = (FTHPhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"previewCell"
                                                                                                               forIndexPath:indexPath];
    cell.photo = self.model.photos[(NSUInteger)indexPath.row];
    cell.showsCaption = NO;
    [cell updateContents];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    FTPhotoViewController *photoController = [FTPhotoViewController new];
    FTPhoto *photo = self.model.photos[(NSUInteger)indexPath.row];
    photoController.photoURL = [photo urlForSize:kFTPhotoSizeLarge1024];
    
    [self presentViewController:photoController animated:YES completion:nil];
}

@end
