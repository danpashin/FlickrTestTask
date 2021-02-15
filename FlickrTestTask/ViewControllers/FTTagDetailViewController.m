//
//  FTTagDetailViewController.m
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import "FTTagDetailViewController.h"
#import "FTHPhotoCollectionViewCell.h"
#import "FTPhotoViewController.h"

@interface FTTagDetailViewController ()
@end

@implementation FTTagDetailViewController

- (void)commonInit
{
    _model = [FTSearchModel new];
    _model.delegate = self;
    _model.maxItemsToRequest = 50;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.model.tags.firstObject;
    
    [self.collectionView registerClass:[FTHPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"previewCell"];
    
    [self.model queryAPI];
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
