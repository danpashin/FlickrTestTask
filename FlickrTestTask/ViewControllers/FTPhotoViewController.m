//
//  FTPhotoViewController.m
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import "FTPhotoViewController.h"
#import "FTPhotoScrollView.h"
#import <SDWebImage/SDWebImage.h>

@interface FTPhotoViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet FTPhotoScrollView *scrollView;
@end

@implementation FTPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor tertiarySystemBackgroundColor];
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    
    self.scrollView = [FTPhotoScrollView new];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;

    [self loadImage];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self updateMinZoomScaleForSize:self.view.bounds.size];
}

- (void)updateMinZoomScaleForSize:(CGSize)size
{
    const CGSize imageSize = self.scrollView.photoView.bounds.size;
    const CGFloat minScale = MIN((size.width / imageSize.width), (size.height / imageSize.height));
    
    self.scrollView.minimumZoomScale = minScale;
    self.scrollView.zoomScale = minScale;
}

- (void)updateConstraintsForSize:(CGSize)size
{
    const UIEdgeInsets safeArea = self.view.safeAreaInsets;
    CGSize photoViewSize = self.scrollView.photoView.frame.size;
    const CGFloat yOffset = MAX(0, (size.height - photoViewSize.height - safeArea.top - safeArea.bottom) / 2.0);
    self.scrollView.photoTopConstraint.constant = yOffset;
    self.scrollView.photoBottomConstraint.constant = yOffset;
    
    const CGFloat xOffset = MAX(0, (size.width - photoViewSize.width) / 2.0);
    self.scrollView.photoLeadingConstraint.constant = xOffset;
    self.scrollView.photoTrailingConstraint.constant = xOffset;
    
    [self.view layoutIfNeeded];
}

- (void)setPhotoURL:(NSString *)photoURL
{
    _photoURL = photoURL;
    
    [self loadImage];
}

- (void)loadImage
{
    [self.scrollView.photoView sd_setImageWithURL:[NSURL URLWithString:self.photoURL] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.scrollView.photoView.image = image;
        [self.scrollView.photoView layoutIfNeeded];
    }];
}

#pragma mark - UIScrollViewDelegate

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.scrollView.photoView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    [self updateConstraintsForSize:self.view.bounds.size];
}

@end
