//
//  KBBaseViewController.h
//  KBDynamicFont
//
//  Created by BIMiracle on 4/10/19.
//  Copyright © 2019 BIMiracle. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KBBaseViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *dynamicFontArray;

- (void)contentSizeCategoryDidChanged:(NSNotification *)notification;

@end

NS_ASSUME_NONNULL_END
