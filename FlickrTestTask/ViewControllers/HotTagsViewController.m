//
//  HotTagsViewController.m
//  FlickrTestTask
//
//  Created by Daniil on 12.02.2021.
//

#import "HotTagsViewController.h"
#import "FTHotTagsModel.h"

@interface HotTagsViewController () <FTLoadingModelDelegate>
@property (strong, nonatomic) FTHotTagsModel *model;
@end

@implementation HotTagsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _model = [FTHotTagsModel new];
        _model.delegate = self;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _model = [FTHotTagsModel new];
        _model.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model queryAPI];
}

- (void)loadingModelReceivedUpdate:(FTHotTagsModel *)model
{
    NSLog(@"%@", model.photos);
}

@end
