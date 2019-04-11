//
//  UILabel+KBDynamic.m
//  JHDynamicFont
//
//  Created by BIMiracle on 4/10/19.
//  Copyright © 2019 JHModule. All rights reserved.
//

#import "UILabel+KBDynamic.h"
#import <objc/runtime.h>

@implementation UILabel (KBDynamic)

- (void)updateFontWithContentString:(UIContentSizeCategory)contentString{
    self.font = [self setFontWithStyle:self.fontStyle contentString:contentString weight:[self fontWeight]];
}

- (UIFont *)setFontWithStyle:(KBFontSize)style contentString:(UIContentSizeCategory)contentString weight:(UIFontWeight)weight{
    NSString *fontName;
    if (weight == UIFontWeightMedium){
        fontName = @".SFUIText-Medium";
    }else if (weight == UIFontWeightRegular){
        fontName = @".SFUIText";
    }else if (weight == UIFontWeightBold){
        fontName = @".SFUIText-Bold";
    }else if (weight == UIFontWeightHeavy){
        fontName = @".SFUIText-Heavy";
    }else if (weight == UIFontWeightLight){
        fontName = @".SFUIText-Light";
    }else if (weight == UIFontWeightUltraLight) {
        fontName = @".SFUIText-Light";
    }else if (weight == UIFontWeightThin){
        fontName = @".SFUIText-Light";
    }else if (weight == UIFontWeightSemibold){
        fontName = @".SFUIText-Semibold";
    }else if (weight == UIFontWeightBlack){
        fontName = @".SFUIText-Heavy";
    }
    UIFontDescriptor *descpripter = [UIFontDescriptor fontDescriptorWithName:fontName size:((NSNumber *)[KBDynamicFontManager sharedInstance].fontSizeArray[style][contentString]).floatValue];
    return [UIFont fontWithDescriptor:descpripter size:0.0];
}

static char kAssociatedObjectKey_fontStyle;
- (void)setFontStyle:(KBFontSize)fontStyle{
    [self setFontStyle:fontStyle weight:UIFontWeightMedium];
}

- (void)setFontStyle:(KBFontSize)fontStyle weight:(UIFontWeight)weight{
    if (fontStyle > KBFontSize20) {
        NSAssert(NO, @"请使用 KBFontSize 类型设置Font");
        fontStyle = UIFontWeightMedium;
    }
    objc_setAssociatedObject(self, &kAssociatedObjectKey_fontStyle, @(fontStyle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    // 设置contentString前需获取一次当前系统字体大小
    self.font = [self setFontWithStyle:fontStyle contentString:[[KBDynamicFontManager sharedInstance] getCurrentContentSizeString] weight:weight];
}

- (KBFontSize)fontStyle{
    NSNumber *number = objc_getAssociatedObject(self, &kAssociatedObjectKey_fontStyle);
    if (!number) {
        return KBFontSize17;
    }
    return [number integerValue];
}

- (UIFontWeight)fontWeight{
    UIFontWeight fontWeight;
    NSString *fontName = self.font.fontName;
    if ([fontName rangeOfString:@"Medium" options:NSCaseInsensitiveSearch].location == NSNotFound) {
        fontWeight = UIFontWeightMedium;
    }else if ([fontName rangeOfString:@"Bold" options:NSCaseInsensitiveSearch].location == NSNotFound) {
        fontWeight = UIFontWeightBold;
    }else if ([fontName rangeOfString:@"Heavy" options:NSCaseInsensitiveSearch].location == NSNotFound) {
        fontWeight = UIFontWeightHeavy;
    }else if ([fontName rangeOfString:@"Light" options:NSCaseInsensitiveSearch].location == NSNotFound) {
        fontWeight = UIFontWeightLight;
    }else if ([fontName rangeOfString:@"Semibold" options:NSCaseInsensitiveSearch].location == NSNotFound) {
        fontWeight = UIFontWeightSemibold;
    }else{
        fontWeight = UIFontWeightRegular;
    }
    return fontWeight;
}

@end
