//
//  KBTableViewController.m
//  KBDynamicFont
//
//  Created by BIMiracle on 4/11/19.
//  Copyright © 2019 BIMiracle. All rights reserved.
//

#import "KBTableViewController.h"
#import "KBSliderView.h"
#import "KBDynamicFontManager.h"
#import "UIButton+KBDynamic.h"
#import "UILabel+KBDynamic.h"

#import "KBTableViewCell.h"

@interface KBTableViewController ()

@property (nonatomic, strong) KBSliderView *sliderView;
@property (nonatomic, strong) KBDynamicFontManager *dynamicFontManager;

@end

@implementation KBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dynamicFontManager = [KBDynamicFontManager sharedInstance];
    
    UIFont *defaultFont = [UIFont systemFontOfSize:17];
    NSArray *stringArray = @[@"小", @"", @"", @"标准", @"", @"", @"大"];
    NSArray *fontArray = @[
                           [UIFont systemFontOfSize:10],
                           defaultFont,
                           defaultFont,
                           [UIFont systemFontOfSize:14],
                           defaultFont,
                           defaultFont,
                           [UIFont systemFontOfSize:18],
                           ];
    
    UIView *sliderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    _sliderView = [KBSliderView sliderViewWithFrame:CGRectMake(50, 0, self.view.frame.size.width - 100, 100) stringArray:stringArray fontArray:fontArray valueDidChangeBlokck:^(NSInteger index) {
        [self.dynamicFontManager postDynamicFontNotificationWithContentSizeString:[self.dynamicFontManager getContentSizeStringOfSizeLevel:index]];
    }];
    _sliderView.currentIndex = self.currentIndex;
    [sliderView addSubview:_sliderView];
    self.tableView.tableHeaderView = sliderView;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contentSizeCategoryDidChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)contentSizeCategoryDidChanged:(NSNotification *)notification{
    NSDictionary *dict = notification.userInfo;
    NSString *contentSizeStr = dict[UIContentSizeCategoryNewValueKey];
    [self.tableView reloadData];
    _sliderView.currentIndex = [_dynamicFontManager getSizeLevelOfContentSizeString:contentSizeStr];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell1";
    KBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //FIXME: storyboard需要一个 kb_weight 在 KBButton和KBLabel中 ,等kb_weight和 kb_fontSize 都设置后才更新字体
    [cell.topButton updateFontWithContentString:[_dynamicFontManager getContentSizeStringOfSizeLevel:_sliderView.currentIndex]];
    [cell.label updateFontWithContentString:[_dynamicFontManager getContentSizeStringOfSizeLevel:_sliderView.currentIndex]];
    return cell;
}

@end
