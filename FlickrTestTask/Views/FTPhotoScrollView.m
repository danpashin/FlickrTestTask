//
//  FTPhotoScrollView.m
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import "FTPhotoScrollView.h"

@interface FTPhotoScrollView ()


@end

@implementation FTPhotoScrollView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.maximumZoomScale = 1.5;
        
        _photoView = [UIImageView new];
        [self addSubview:_photoView];
        
        _photoView.translatesAutoresizingMaskIntoConstraints = NO;
        _photoTopConstraint = [_photoView.topAnchor constraintEqualToAnchor:self.topAnchor];
        _photoBottomConstraint = [_photoView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor];
        _photoLeadingConstraint = [_photoView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor];
        _photoTrailingConstraint = [_photoView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor];
        
        [NSLayoutConstraint activateConstraints:@[
            _photoTopConstraint, _photoBottomConstraint,
            _photoLeadingConstraint, _photoTrailingConstraint
        ]];
    }
    return self;
}
@end
