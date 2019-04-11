//
//  KBBaseViewController.m
//  KBDynamicFont
//
//  Created by BIMiracle on 4/10/19.
//  Copyright © 2019 BIMiracle. All rights reserved.
//

#import "KBBaseViewController.h"
#import "UILabel+KBDynamic.h"
#import "UIButton+KBDynamic.h"

@interface KBBaseViewController ()

@end

@implementation KBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dynamicFontArray = [NSMutableArray array];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contentSizeCategoryDidChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)contentSizeCategoryDidChanged:(NSNotification *)notification{
    if (self.dynamicFontArray.count == 0) return;
    NSDictionary *dict = notification.userInfo;
    NSString *contentSizeStr = dict[UIContentSizeCategoryNewValueKey];
    for (UIView *view in self.dynamicFontArray) {
        if ([view isKindOfClass:[UILabel class]]) {
            [(UILabel *)view updateFontWithContentString:contentSizeStr];
        }else if ([view isKindOfClass:[UIButton class]]) {
            [(UIButton *)view updateFontWithContentString:contentSizeStr];
        }
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
