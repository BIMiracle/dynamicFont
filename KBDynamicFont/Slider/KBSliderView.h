//
//  KBSliderView.h
//  KBDynamicFont
//
//  Created by BIMiracle on 4/10/19.
//  Copyright © 2019 BIMiracle. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^KBSliderValuerDidChangedBlock)(NSInteger index);

@interface KBSliderView : UIView

/**
 当前索引下标,默认为 3
 */
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, copy) KBSliderValuerDidChangedBlock changeBlock;

+ (instancetype)sliderViewWithFrame:(CGRect)frame stringArray:(NSArray *)stringArray valueDidChangeBlokck:(KBSliderValuerDidChangedBlock)changeBlock;

+ (instancetype)sliderViewWithFrame:(CGRect)frame stringArray:(NSArray<NSString *> *)stringArray fontArray:(nullable NSArray<UIFont *> *)fontArray valueDidChangeBlokck:(KBSliderValuerDidChangedBlock)changeBlock;

- (void)sliderViewWithFrame:(CGRect)frame stringArray:(NSArray *)stringArray valueDidChangeBlokck:(KBSliderValuerDidChangedBlock)changeBlock;

- (void)sliderViewWithFrame:(CGRect)frame stringArray:(NSArray *)stringArray fontArray:(nullable NSArray<UIFont *> *)fontArray valueDidChangeBlokck:(KBSliderValuerDidChangedBlock)changeBlock;

@end
