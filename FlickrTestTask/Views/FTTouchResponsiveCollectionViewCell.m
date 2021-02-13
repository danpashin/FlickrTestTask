//
//  FTTouchResponsiveCollectionViewCell.m
//  FlickrTestTask
//
//  Created by Daniil on 13.02.2021.
//

#import "FTTouchResponsiveCollectionViewCell.h"

typedef NS_ENUM(NSUInteger, FTTouchState) {
    kFTTouchStateNormal,
    kFTTouchStatePressed,
};

@interface FTTouchResponsiveCollectionViewCell () {
    FTTouchState _currentState;
}
@end

@implementation FTTouchResponsiveCollectionViewCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setState:kFTTouchStateNormal animated:NO];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setState:kFTTouchStateNormal animated:NO];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setState:kFTTouchStateNormal animated:NO];
    }
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    [self setState:kFTTouchStateNormal animated:NO];
}

- (void)setState:(FTTouchState)state animated:(BOOL)animated
{
    if (_currentState != state) {
        _currentState = state;

        if (animated) {
            const CGFloat scaleRatio = (state == kFTTouchStatePressed) ? 0.85 : 1.0;
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear animations:^{
                    self.transform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
                } completion:nil];
            });
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self setState:kFTTouchStatePressed animated:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setState:kFTTouchStateNormal animated:YES];
    });
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self setState:kFTTouchStateNormal animated:YES];
}

@end
