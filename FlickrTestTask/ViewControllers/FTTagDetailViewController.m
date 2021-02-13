//
//  FTTagDetailViewController.m
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import "FTTagDetailViewController.h"
#import "FTHPhotoCollectionViewCell.h"

@interface FTTagDetailViewController ()
@property (assign, nonatomic) FTPhotoSize preferredPreviewSize;
@end

@implementation FTTagDetailViewController

- (instancetype)init
{
    return [self initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
}

- (void)commonInit
{
    _model = [FTSearchModel new];
    _model.delegate = self;
    _model.maxItemsToRequest = 50;
    _preferredPreviewSize = kFTPhotoSizeSmall240;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.model.tags.firstObject;
    self.collectionView.backgroundColor = [UIColor systemBackgroundColor];
    self.collectionView.alwaysBounceVertical = YES;
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
    cell.preferredPhotoSize = self.preferredPreviewSize;
    cell.showsCaption = NO;
    [cell updateContents];
    
    return cell;
}

@end
