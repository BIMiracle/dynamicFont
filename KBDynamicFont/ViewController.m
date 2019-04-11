//
//  ViewController.m
//  KBDynamicFont
//
//  Created by BIMiracle on 4/10/19.
//  Copyright © 2019 BIMiracle. All rights reserved.
//

#import "ViewController.h"
#import "KBSliderView.h"
#import "UILabel+KBDynamic.h"
#import "KBButton.h"
#import "KBTableViewController.h"

@interface ViewController ()

@property (nonatomic, strong) KBSliderView *sliderView;
@property (nonatomic, strong) KBDynamicFontManager *dynamicFontManager;
@property (weak, nonatomic) IBOutlet UILabel *dynamicLabel1;
@property (weak, nonatomic) IBOutlet UILabel *dynamicLabel2;
@property (weak, nonatomic) IBOutlet KBButton *dynamicButton1;
@property (weak, nonatomic) IBOutlet KBButton *dynamicButton2;

@end

@implementation ViewController

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
    _sliderView = [KBSliderView sliderViewWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 100) stringArray:stringArray fontArray:fontArray valueDidChangeBlokck:^(NSInteger index) {
        [self.dynamicFontManager postDynamicFontNotificationWithContentSizeString:[self.dynamicFontManager getContentSizeStringOfSizeLevel:index]];
    }];
    _sliderView.currentIndex = [_dynamicFontManager getCurrentContentSizeStringOfLevel];
    [self.view addSubview:_sliderView];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, 100)];
    [textLabel setText:@"风萧萧兮易水寒"];
    [textLabel setTextAlignment:NSTextAlignmentCenter];
    [textLabel setBackgroundColor:[UIColor whiteColor]];
    
//    textLabel.fontStyle = KBFontSize17;
    [textLabel setFontStyle:KBFontSize17 weight:UIFontWeightBold];
    [self.view addSubview:textLabel];
    
    // 加入自动更新数组 当系统字体大小更改后调用父类的contentSizeCategoryDidChanged进行更新
    [self.dynamicFontArray addObject:textLabel];
    [self.dynamicFontArray addObject:self.dynamicLabel1];
    [self.dynamicFontArray addObject:self.dynamicLabel2];
    [self.dynamicFontArray addObject:self.dynamicButton1];
    [self.dynamicFontArray addObject:self.dynamicButton2];
    
    NSLog(@"\n%@\n%@\n%@",textLabel.font.fontName,_dynamicLabel1.font.fontName,_dynamicLabel2.font.fontName);
}

- (void)contentSizeCategoryDidChanged:(NSNotification *)notification{
//    [super contentSizeCategoryDidChanged:notification];
//    NSDictionary *dict = notification.userInfo;
//    NSString *contentSizeStr = dict[UIContentSizeCategoryNewValueKey];
//    _sliderView.currentIndex = [_dynamicFontManager getSizeLevelOfContentSizeString:contentSizeStr];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toTableViewController"]) {
        KBTableViewController *vc = segue.destinationViewController;
        vc.currentIndex = _sliderView.currentIndex;
    }
}


@end
