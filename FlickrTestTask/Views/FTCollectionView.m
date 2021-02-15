//
//  FTCollectionView.m
//  FlickrTestTask
//
//  Created by Daniil on 15.02.2021.
//

#import "FTCollectionView.h"

@implementation FTCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.alwaysBounceVertical = YES;
        self.backgroundColor = [UIColor systemBackgroundColor];
        self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return self;
}

- (void)reloadDataAnimated:(BOOL)animated
{
    [self reloadData];
    
    if (animated) {
        UIViewAnimationOptions opts = UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState;
        [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:opts animations:^{
            [self layoutIfNeeded];
        } completion:nil];
    }
}

@end
