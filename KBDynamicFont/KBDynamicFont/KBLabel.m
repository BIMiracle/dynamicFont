//
//  KBLabel.m
//  KBDynamicFont
//
//  Created by BIMiracle on 4/10/19.
//  Copyright © 2019 BIMiracle. All rights reserved.
//

#import "KBLabel.h"
#import <objc/runtime.h>
#import "UILabel+KBDynamic.h"

@implementation KBLabel

static char kAssociatedObjectKey_fontSize;
- (void)setKb_fontSize:(NSUInteger)kb_fontSize{
    objc_setAssociatedObject(self, &kAssociatedObjectKey_fontSize, @(kb_fontSize), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    KBFontSize fontSize;
    switch (kb_fontSize) {
        case 10:
            fontSize = KBFontSize10;
            break;
        case 11:
            fontSize = KBFontSize11;
            break;
        case 12:
            fontSize = KBFontSize12;
            break;
        case 13:
            fontSize = KBFontSize13;
            break;
        case 14:
            fontSize = KBFontSize14;
            break;
        case 15:
            fontSize = KBFontSize15;
            break;
        case 16:
            fontSize = KBFontSize16;
            break;
        case 17:
            fontSize = KBFontSize17;
            break;
        case 18:
            fontSize = KBFontSize18;
            break;
        case 19:
            fontSize = KBFontSize19;
            break;
        case 20:
            fontSize = KBFontSize20;
            break;
        default:
            fontSize = KBFontSize17;
            break;
    }
    [self setFontStyle:fontSize];
}

- (NSUInteger)kb_fontSize{
    return [objc_getAssociatedObject(self, &kAssociatedObjectKey_fontSize) integerValue];
}


@end
