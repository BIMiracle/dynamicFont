//
//  UILabel+KBDynamic.h
//  JHDynamicFont
//
//  Created by BIMiracle on 4/10/19.
//  Copyright © 2019 JHModule. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBDynamicFontManager.h"

@interface UILabel (KBDynamic)

@property (nonatomic, assign) KBFontSize fontStyle;

- (void)setFontStyle:(KBFontSize)fontStyle weight:(UIFontWeight)weight;

- (void)updateFontWithContentString:(UIContentSizeCategory)contentString;

@end
