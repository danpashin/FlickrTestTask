//
//  FTCollectionViewSquareLayout.m
//  FlickrTestTask
//
//  Created by Daniil on 15.02.2021.
//

#import "FTCollectionViewSquareLayout.h"

@implementation FTCollectionViewSquareLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sectionInset = UIEdgeInsetsMake(8.0, 8.0, 8.0, 8.0);
        
        if ([UIDevice currentDevice].userInterfaceIdiom != UIUserInterfaceIdiomPad) {
            self.itemSize = CGSizeMake(112.0, 112.0);
            self.minimumLineSpacing = 8.0;
            self.minimumInteritemSpacing = 8.0;
        } else {
            self.itemSize = CGSizeMake(140.0, 140.0);
            self.minimumLineSpacing = 16.0;
            self.minimumInteritemSpacing = 8.0;
        }
    }
    return self;
}

@end
