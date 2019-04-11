//
//  UIButton+KBDynamic.h
//  KBDynamicFont
//
//  Created by BIMiracle on 4/11/19.
//  Copyright © 2019 BIMiracle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBDynamicFontManager.h"

@interface UIButton (KBDynamic)

@property (nonatomic, assign) KBFontSize fontStyle;

- (void)setFontStyle:(KBFontSize)fontStyle weight:(UIFontWeight)weight;

- (void)updateFontWithContentString:(UIContentSizeCategory)contentString;

@end
