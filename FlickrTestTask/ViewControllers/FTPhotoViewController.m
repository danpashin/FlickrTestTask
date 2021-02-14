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
@property (strong, nonatomic) FTPhotoScrollView *scrollView;
@end

@implementation FTPhotoViewController


#pragma mark - Public methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    FTPhotoScrollView *photoScrollView = [FTPhotoScrollView new];
    self.scrollView = photoScrollView;
    photoScrollView.delegate = self;
    [self.view addSubview:photoScrollView];
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeClose];
    [closeButton addTarget:self action:@selector(dismissController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
    
    photoScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [photoScrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [photoScrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [photoScrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [photoScrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    
    closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [closeButton.widthAnchor constraintEqualToConstant:32.0].active = YES;
    [closeButton.heightAnchor constraintEqualToConstant:32.0].active = YES;
    [closeButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:10.0].active = YES;
    [closeButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10.0].active = YES;

    [self loadImage];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self updateMinZoomScaleForSize:self.view.bounds.size];
}

- (void)setPhotoURL:(NSString *)photoURL
{
    _photoURL = photoURL;
    
    [self loadImage];
}

- (void)dismissController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Private methods

- (void)updateMinZoomScaleForSize:(CGSize)size
{
    const CGSize imageSize = self.scrollView.photoView.bounds.size;
    const CGFloat minScale = MIN((size.width / imageSize.width), (size.height / imageSize.height));
    
    self.scrollView.minimumZoomScale = minScale;
    self.scrollView.zoomScale = minScale;
}

- (void)updateConstraintsForSize:(CGSize)size
{
    CGSize photoViewSize = self.scrollView.photoView.frame.size;
    const CGFloat yOffset = MAX(0, (size.height - photoViewSize.height) / 2.0);
    self.scrollView.photoTopConstraint.constant = yOffset;
    self.scrollView.photoBottomConstraint.constant = yOffset;
    
    const CGFloat xOffset = MAX(0, (size.width - photoViewSize.width) / 2.0);
    self.scrollView.photoLeadingConstraint.constant = xOffset;
    self.scrollView.photoTrailingConstraint.constant = xOffset;
}

- (void)loadImage
{
    [self.scrollView.photoView sd_setImageWithURL:[NSURL URLWithString:self.photoURL] 
                                        completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
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
