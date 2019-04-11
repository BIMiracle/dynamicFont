//
//  KBDynamicFontManager.m
//  JHDynamicFont
//
//  Created by BIMiracle on 4/10/19.
//  Copyright © 2019 JHModule. All rights reserved.
//

#import "KBDynamicFontManager.h"

@interface KBDynamicFontManager ()

@property (nonatomic, strong) NSDictionary *privateFontSizeDict;

@end

@implementation KBDynamicFontManager

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static KBDynamicFontManager *instance;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

- (instancetype)init{
    if (self = [super init]) {
        [self initFontSize];
    }
    return self;
}

/**
 初始化FontSize
 */
- (void)initFontSize{
    _fontSizeArray = @[
                      // 10
                      @{
                          UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: @13,
                          UIContentSizeCategoryAccessibilityExtraExtraLarge: @13,
                          UIContentSizeCategoryAccessibilityExtraLarge: @13,
                          UIContentSizeCategoryAccessibilityLarge: @13,
                          UIContentSizeCategoryAccessibilityMedium: @13,
                          UIContentSizeCategoryExtraExtraExtraLarge: @13,
                          UIContentSizeCategoryExtraExtraLarge: @12,
                          UIContentSizeCategoryExtraLarge: @11,
                          UIContentSizeCategoryLarge: @10,
                          UIContentSizeCategoryMedium: @9,
                          UIContentSizeCategorySmall: @8,
                          UIContentSizeCategoryExtraSmall: @7,},
                      // 11
                      @{
                          UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: @14,
                          UIContentSizeCategoryAccessibilityExtraExtraLarge: @14,
                          UIContentSizeCategoryAccessibilityExtraLarge: @14,
                          UIContentSizeCategoryAccessibilityLarge: @14,
                          UIContentSizeCategoryAccessibilityMedium: @14,
                          UIContentSizeCategoryExtraExtraExtraLarge: @14,
                          UIContentSizeCategoryExtraExtraLarge: @13,
                          UIContentSizeCategoryExtraLarge: @12,
                          UIContentSizeCategoryLarge: @11,
                          UIContentSizeCategoryMedium: @10,
                          UIContentSizeCategorySmall: @9,
                          UIContentSizeCategoryExtraSmall: @8,},
                      // 12
                      @{
                          UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: @15,
                          UIContentSizeCategoryAccessibilityExtraExtraLarge: @15,
                          UIContentSizeCategoryAccessibilityExtraLarge: @15,
                          UIContentSizeCategoryAccessibilityLarge: @15,
                          UIContentSizeCategoryAccessibilityMedium: @15,
                          UIContentSizeCategoryExtraExtraExtraLarge: @15,
                          UIContentSizeCategoryExtraExtraLarge: @14,
                          UIContentSizeCategoryExtraLarge: @13,
                          UIContentSizeCategoryLarge: @12,
                          UIContentSizeCategoryMedium: @11,
                          UIContentSizeCategorySmall: @10,
                          UIContentSizeCategoryExtraSmall: @9,},
                      // 13
                      @{
                          UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: @16,
                          UIContentSizeCategoryAccessibilityExtraExtraLarge: @16,
                          UIContentSizeCategoryAccessibilityExtraLarge: @16,
                          UIContentSizeCategoryAccessibilityLarge: @16,
                          UIContentSizeCategoryAccessibilityMedium: @16,
                          UIContentSizeCategoryExtraExtraExtraLarge: @16,
                          UIContentSizeCategoryExtraExtraLarge: @15,
                          UIContentSizeCategoryExtraLarge: @14,
                          UIContentSizeCategoryLarge: @13,
                          UIContentSizeCategoryMedium: @12,
                          UIContentSizeCategorySmall: @11,
                          UIContentSizeCategoryExtraSmall: @10,},
                      // 14
                      @{
                          UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: @17,
                          UIContentSizeCategoryAccessibilityExtraExtraLarge: @17,
                          UIContentSizeCategoryAccessibilityExtraLarge: @17,
                          UIContentSizeCategoryAccessibilityLarge: @17,
                          UIContentSizeCategoryAccessibilityMedium: @17,
                          UIContentSizeCategoryExtraExtraExtraLarge: @17,
                          UIContentSizeCategoryExtraExtraLarge: @16,
                          UIContentSizeCategoryExtraLarge: @15,
                          UIContentSizeCategoryLarge: @14,
                          UIContentSizeCategoryMedium: @13,
                          UIContentSizeCategorySmall: @12,
                          UIContentSizeCategoryExtraSmall: @11,},
                      // 15
                      @{
                          UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: @18,
                          UIContentSizeCategoryAccessibilityExtraExtraLarge: @18,
                          UIContentSizeCategoryAccessibilityExtraLarge: @18,
                          UIContentSizeCategoryAccessibilityLarge: @18,
                          UIContentSizeCategoryAccessibilityMedium: @18,
                          UIContentSizeCategoryExtraExtraExtraLarge: @18,
                          UIContentSizeCategoryExtraExtraLarge: @17,
                          UIContentSizeCategoryExtraLarge: @16,
                          UIContentSizeCategoryLarge: @15,
                          UIContentSizeCategoryMedium: @14,
                          UIContentSizeCategorySmall: @13,
                          UIContentSizeCategoryExtraSmall: @12,},
                      // 16
                      @{
                          UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: @19,
                          UIContentSizeCategoryAccessibilityExtraExtraLarge: @19,
                          UIContentSizeCategoryAccessibilityExtraLarge: @19,
                          UIContentSizeCategoryAccessibilityLarge: @19,
                          UIContentSizeCategoryAccessibilityMedium: @19,
                          UIContentSizeCategoryExtraExtraExtraLarge: @19,
                          UIContentSizeCategoryExtraExtraLarge: @18,
                          UIContentSizeCategoryExtraLarge: @17,
                          UIContentSizeCategoryLarge: @16,
                          UIContentSizeCategoryMedium: @15,
                          UIContentSizeCategorySmall: @14,
                          UIContentSizeCategoryExtraSmall: @13,},
                      // 17
                      @{
                          UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: @20,
                          UIContentSizeCategoryAccessibilityExtraExtraLarge: @20,
                          UIContentSizeCategoryAccessibilityExtraLarge: @20,
                          UIContentSizeCategoryAccessibilityLarge: @20,
                          UIContentSizeCategoryAccessibilityMedium: @20,
                          UIContentSizeCategoryExtraExtraExtraLarge: @20,
                          UIContentSizeCategoryExtraExtraLarge: @19,
                          UIContentSizeCategoryExtraLarge: @18,
                          UIContentSizeCategoryLarge: @17,
                          UIContentSizeCategoryMedium: @16,
                          UIContentSizeCategorySmall: @15,
                          UIContentSizeCategoryExtraSmall: @14,},
                      // 18
                      @{
                          UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: @21,
                          UIContentSizeCategoryAccessibilityExtraExtraLarge: @21,
                          UIContentSizeCategoryAccessibilityExtraLarge: @21,
                          UIContentSizeCategoryAccessibilityLarge: @21,
                          UIContentSizeCategoryAccessibilityMedium: @21,
                          UIContentSizeCategoryExtraExtraExtraLarge: @21,
                          UIContentSizeCategoryExtraExtraLarge: @20,
                          UIContentSizeCategoryExtraLarge: @19,
                          UIContentSizeCategoryLarge: @18,
                          UIContentSizeCategoryMedium: @17,
                          UIContentSizeCategorySmall: @16,
                          UIContentSizeCategoryExtraSmall: @15,},
                      // 19
                      @{
                          UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: @22,
                          UIContentSizeCategoryAccessibilityExtraExtraLarge: @22,
                          UIContentSizeCategoryAccessibilityExtraLarge: @22,
                          UIContentSizeCategoryAccessibilityLarge: @22,
                          UIContentSizeCategoryAccessibilityMedium: @22,
                          UIContentSizeCategoryExtraExtraExtraLarge: @22,
                          UIContentSizeCategoryExtraExtraLarge: @21,
                          UIContentSizeCategoryExtraLarge: @20,
                          UIContentSizeCategoryLarge: @19,
                          UIContentSizeCategoryMedium: @18,
                          UIContentSizeCategorySmall: @17,
                          UIContentSizeCategoryExtraSmall: @16,},
                      // 20
                      @{
                          UIContentSizeCategoryAccessibilityExtraExtraExtraLarge: @23,
                          UIContentSizeCategoryAccessibilityExtraExtraLarge: @23,
                          UIContentSizeCategoryAccessibilityExtraLarge: @23,
                          UIContentSizeCategoryAccessibilityLarge: @23,
                          UIContentSizeCategoryAccessibilityMedium: @23,
                          UIContentSizeCategoryExtraExtraExtraLarge: @23,
                          UIContentSizeCategoryExtraExtraLarge: @22,
                          UIContentSizeCategoryExtraLarge: @21,
                          UIContentSizeCategoryLarge: @20,
                          UIContentSizeCategoryMedium: @19,
                          UIContentSizeCategorySmall: @18,
                          UIContentSizeCategoryExtraSmall: @17,},
                      ];
}

/**
 发送系统的change消息,附带更改后的字体大小
 */
- (void)postDynamicFontNotificationWithContentSizeString:(UIContentSizeCategory)contentSizeString{
    [[NSNotificationCenter defaultCenter] postNotificationName:UIContentSizeCategoryDidChangeNotification object:nil userInfo:@{UIContentSizeCategoryNewValueKey:contentSizeString}];
}

- (NSUInteger)getSizeLevelOfContentSizeString:(UIContentSizeCategory)contentSizeString{
    NSInteger index = 0;
    if ([contentSizeString isEqualToString:UIContentSizeCategoryExtraSmall]) {
        index = 0;
    } else if ([contentSizeString isEqualToString:UIContentSizeCategorySmall]) {
        index = 1;
    } else if ([contentSizeString isEqualToString:UIContentSizeCategoryMedium]) {
        index = 2;
    } else if ([contentSizeString isEqualToString:UIContentSizeCategoryLarge]) {
        index = 3;
    } else if ([contentSizeString isEqualToString:UIContentSizeCategoryExtraLarge]) {
        index = 4;
    } else if ([contentSizeString isEqualToString:UIContentSizeCategoryExtraExtraLarge]) {
        index = 5;
    } else if ([contentSizeString isEqualToString:UIContentSizeCategoryExtraExtraExtraLarge]) {
        index = 6;
    } else if ([contentSizeString isEqualToString:UIContentSizeCategoryAccessibilityMedium]) {
        index = 6;
    } else if ([contentSizeString isEqualToString:UIContentSizeCategoryAccessibilityLarge]) {
        index = 6;
    } else if ([contentSizeString isEqualToString:UIContentSizeCategoryAccessibilityExtraLarge]) {
        index = 6;
    } else if ([contentSizeString isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraLarge]) {
        index = 6;
    } else if ([contentSizeString isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraExtraLarge]) {
        index = 6;
    } else{
        index = 6;
    }
    return index;
}

- (NSUInteger)getCurrentContentSizeStringOfLevel{
    if ([UIApplication instancesRespondToSelector:@selector(preferredContentSizeCategory)]) {
        NSString *contentSizeCategory = [[UIApplication sharedApplication] preferredContentSizeCategory];
        return [self getSizeLevelOfContentSizeString:contentSizeCategory];
    } else {
        return 3;
    }
}

- (UIContentSizeCategory)getContentSizeStringOfSizeLevel:(NSInteger)level{
    NSString *contentStr;
    switch (level) {
        case 0:
            contentStr = UIContentSizeCategoryExtraSmall;
            break;
        case 1:
            contentStr = UIContentSizeCategorySmall;
            break;
        case 2:
            contentStr = UIContentSizeCategoryMedium;
            break;
        case 3:
            contentStr = UIContentSizeCategoryLarge;
            break;
        case 4:
            contentStr = UIContentSizeCategoryExtraLarge;
            break;
        case 5:
            contentStr = UIContentSizeCategoryExtraExtraLarge;
            break;
        case 6:
            contentStr = UIContentSizeCategoryExtraExtraExtraLarge;
            break;
        case 7:
            contentStr = UIContentSizeCategoryAccessibilityMedium;
            break;
        case 8:
            contentStr = UIContentSizeCategoryAccessibilityLarge;
            break;
        case 9:
            contentStr = UIContentSizeCategoryAccessibilityExtraLarge;
            break;
        case 10:
            contentStr = UIContentSizeCategoryAccessibilityExtraExtraLarge;
            break;
        case 11:
            contentStr = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
            break;
        default:
            if (level > 0){
                contentStr = UIContentSizeCategoryExtraExtraExtraLarge;
            }else{
                contentStr = UIContentSizeCategoryExtraSmall;
            }
            break;
    }
    return contentStr;
}

- (UIContentSizeCategory)getCurrentContentSizeString{
    return [self getContentSizeStringOfSizeLevel:[self getCurrentContentSizeStringOfLevel]];
}

@end
