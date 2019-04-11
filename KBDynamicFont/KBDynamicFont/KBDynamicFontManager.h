//
//  KBDynamicFontManager.h
//  JHDynamicFont
//
//  Created by BIMiracle on 4/10/19.
//  Copyright © 2019 JHModule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KBFontSize) {
    KBFontSize10 = 0,
    KBFontSize11,
    KBFontSize12,
    KBFontSize13,
    KBFontSize14,
    KBFontSize15,
    KBFontSize16,
    KBFontSize17,
    KBFontSize18,
    KBFontSize19,
    KBFontSize20,
};

@interface KBDynamicFontManager : NSObject

@property (nonatomic, strong, readonly) NSArray *fontSizeArray;

+ (instancetype)sharedInstance;

- (void)postDynamicFontNotificationWithContentSizeString:(UIContentSizeCategory)contentSizeString;

/**
 根据传入的contentSizeString 返回对应的 level，这个值可以在设置里面的“字体大小”查看，辅助功能里面有个“更大字体”可以设置更大的字体，这里将更大字体限制，都返回未开启"辅助功能中的更大字体"时的最大值。
 */
- (NSUInteger)getSizeLevelOfContentSizeString:(UIContentSizeCategory)contentSizeString;

/**
 获取当前系统对应的level
 */
- (NSUInteger)getCurrentContentSizeStringOfLevel;

/**
 根据传入的level 返回对应的 contentSizeString
 */
- (UIContentSizeCategory)getContentSizeStringOfSizeLevel:(NSInteger)level;

/**
 获取当前系统对应的contentSizeString
 */
- (UIContentSizeCategory)getCurrentContentSizeString;

@end
