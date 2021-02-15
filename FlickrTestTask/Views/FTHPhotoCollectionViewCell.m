//
//  FTHPhotoCollectionViewCell.m
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "FTHPhotoCollectionViewCell.h"
#import <SDWebImage/SDWebImage.h>

@interface FTHPhotoCollectionViewCell ()
@property (strong, nonatomic) NSLayoutConstraint *captionHeightConstraint;
@end

@implementation FTHPhotoCollectionViewCell

static const CGFloat cornerRadius = 8.0;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _preferredPhotoSize = kFTPhotoSizeSmall240;
        
        _photoView = [UIImageView new];
        _photoView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_photoView];
        
        _caption = [UILabel new];
        _caption.textAlignment = NSTextAlignmentCenter;
        _caption.layoutMargins = UIEdgeInsetsMake(0.0, 6.0, 0.0, 6.0);
        _caption.backgroundColor = [UIColor tertiarySystemBackgroundColor];
        [self.contentView addSubview:_caption];
        
        self.contentView.layer.masksToBounds = YES;
        self.contentView.layer.cornerRadius = cornerRadius;
        self.contentView.backgroundColor = [UIColor tertiarySystemBackgroundColor];
        
        self.layer.shadowOpacity = 0.35f;
        self.layer.shadowOffset = CGSizeZero;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        
        _photoView.translatesAutoresizingMaskIntoConstraints = NO;
        [_photoView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [_photoView.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
        [_photoView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
        [_photoView.bottomAnchor constraintEqualToAnchor:_caption.topAnchor].active = YES;
        
        _caption.translatesAutoresizingMaskIntoConstraints = NO;
        _captionHeightConstraint = [_caption.heightAnchor constraintEqualToConstant:0.0];
        _captionHeightConstraint.active = YES;
        
        [_caption.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
        [_caption.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
        [_caption.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        
        self.showsCaption = YES;
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    CGPathRef shadowPath = CGPathCreateWithRoundedRect((CGRect){{0.0, 0.0}, frame.size}, cornerRadius, cornerRadius, NULL);
    self.layer.shadowPath = shadowPath;
    CFRelease(shadowPath);
}

- (void)updateContents
{
    self.caption.text = self.photo.caption;
    
    NSURL *photoURL = [self.photo urlForSize:self.preferredPhotoSize];
    [self.photoView sd_setImageWithURL:photoURL];
}

- (void)setShowsCaption:(BOOL)showsCaption
{
    _showsCaption = showsCaption;
    self.captionHeightConstraint.constant = showsCaption ? 20.0 : 0.0;
}

@end
