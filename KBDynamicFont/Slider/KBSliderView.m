//
//  KBSliderView.m
//  KBDynamicFont
//
//  Created by BIMiracle on 4/10/19.
//  Copyright © 2019 BIMiracle. All rights reserved.
//

#import "KBSliderView.h"

@interface KBSliderView ()

@property (nonatomic, strong) UIImageView *sliderImageView;
@property (nonatomic, strong) UIImage *sliderImage;

@property (nonatomic, assign) NSInteger arrayCount;
@property (nonatomic, assign) CGFloat originX;
@property (nonatomic, assign) CGFloat originY;
@property (nonatomic, strong) NSArray<NSString *> *stringArray;
@property (nonatomic, strong) NSArray<UIFont *> *fontArray;

@end

@implementation KBSliderView

+ (instancetype)sliderViewWithFrame:(CGRect)frame stringArray:(NSArray *)stringArray valueDidChangeBlokck:(KBSliderValuerDidChangedBlock)changeBlock{
    KBSliderView *sliderView = [[KBSliderView alloc] initWithFrame:frame stringArray:stringArray fontArray:nil valueDidChangeBlokck:changeBlock];
    return sliderView;
}

+ (instancetype)sliderViewWithFrame:(CGRect)frame stringArray:(NSArray<NSString *> *)stringArray fontArray:(nullable NSArray<UIFont *> *)fontArray valueDidChangeBlokck:(KBSliderValuerDidChangedBlock)changeBlock{
    KBSliderView *sliderView = [[KBSliderView alloc] initWithFrame:frame stringArray:stringArray fontArray:(NSArray<UIFont *> *)fontArray valueDidChangeBlokck:changeBlock];
    return sliderView;
}

- (instancetype)initWithFrame:(CGRect)frame stringArray:(NSArray *)stringArray fontArray:(nullable NSArray<UIFont *> *)fontArray valueDidChangeBlokck:(KBSliderValuerDidChangedBlock)changeBlock{
    self = [super initWithFrame:frame];
    if (self) {
        [self sliderViewWithFrame:frame stringArray:stringArray fontArray:(NSArray<UIFont *> *)fontArray valueDidChangeBlokck:changeBlock];
    }
    return self;
}

- (void)sliderViewWithFrame:(CGRect)frame stringArray:(NSArray *)stringArray valueDidChangeBlokck:(KBSliderValuerDidChangedBlock)changeBlock{
    [self sliderViewWithFrame:frame stringArray:stringArray fontArray:nil valueDidChangeBlokck:changeBlock];
}

- (void)sliderViewWithFrame:(CGRect)frame stringArray:(NSArray *)stringArray fontArray:(nullable NSArray<UIFont *> *)fontArray valueDidChangeBlokck:(KBSliderValuerDidChangedBlock)changeBlock{
    _originX = 20;
    _originY = frame.size.height / 2 - 10;
    _arrayCount = stringArray.count;
    _currentIndex = 3;
    _stringArray = stringArray;
    _fontArray = fontArray;
    _changeBlock = changeBlock;
    
    self.backgroundColor = [UIColor clearColor];
    
    [self createOptionsWithFrame:frame];
    [self createSliderImageView];
    [self updateSliderViewPositonAtIndex:3];
}

#pragma mark 创建slider的滑动圆点
- (void)createSliderImageView{
    _sliderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    _sliderImageView.layer.cornerRadius = 15;
    _sliderImageView.backgroundColor = [UIColor grayColor];
    [self addSubview:_sliderImageView];
    [self bringSubviewToFront:_sliderImageView];
}

#pragma mark 设置初始位置 || 更新位置
- (void)updateSliderViewPositonAtIndex:(NSInteger)index{
    [_sliderImageView setCenter:[self getIndexPointWithIndex:index frame:self.frame]];
}

#pragma mark 获取中心坐标点
- (CGPoint)getIndexPointWithIndex:(NSInteger)index frame:(CGRect)frame{
    CGFloat divWidth = (frame.size.width - 2 * _originX) / (_arrayCount - 1);
    return CGPointMake(_originX + index * divWidth, _originY);
}

- (void)createOptionsWithFrame:(CGRect)frame{
    CGFloat optionCenterY = frame.size.height / 2 + 20;
    for (NSInteger i = 0; i < _arrayCount; i++) {
        NSString *option = _stringArray[i];
        UILabel *optionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [optionLabel setBackgroundColor:[UIColor clearColor]];
        optionLabel.text = option;
        if (_fontArray.count > 0) {
            optionLabel.font = _fontArray[i];
        }else{
            optionLabel.font = [UIFont systemFontOfSize:16];
        }
        optionLabel.textColor = [UIColor grayColor];
        [optionLabel sizeToFit];
        [self addSubview:optionLabel];
        CGPoint optionLabelCenter = [self getIndexPointWithIndex:i frame:frame];
        [optionLabel setCenter:CGPointMake(optionLabelCenter.x, optionCenterY)];
    }
}

#pragma mark 画线
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 1);
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, _originX, _originY);
    CGContextAddLineToPoint(context, rect.size.width - _originX, _originY);
    CGContextStrokePath(context);
    
    for (NSInteger i = 0; i < _arrayCount + 1; i++) {
        
        CGPoint indexPoint = [self getIndexPointWithIndex:i frame:rect];
        CGContextMoveToPoint(context, indexPoint.x, indexPoint.y - 5);
        CGContextAddLineToPoint(context, indexPoint.x, indexPoint.y + 5);
        CGContextStrokePath(context);
    }
}

#pragma mark 手势操作
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    //获取触摸点坐标
    CGPoint touchPoint = [touch locationInView:self];
    [self updateSliderWithIndex:[self checkTouchPointToIndex:touchPoint]];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    //获取触摸点坐标
    CGPoint touchPoint = [touch locationInView:self];
    [self updateSliderWithIndex:[self checkTouchPointToIndex:touchPoint]];
}

#pragma mark 检验当前触摸点
- (NSInteger)checkTouchPointToIndex:(CGPoint)touchPoint{
    //触摸点相对于option的x距离
    NSInteger pointX = touchPoint.x - _originX;
    //总滑动点宽度
    NSInteger sliderWidth = self.frame.size.width - 2 * _originX;
    //每个滑动点之间距离
    NSInteger divWidth = sliderWidth / (_arrayCount - 1);
    //当前滑动点所在option位置
    NSInteger index = pointX / divWidth;
    //偏离滑动点的距离
    NSInteger div = pointX % divWidth;
    
    if (div > divWidth / 2) {
        //偏移距离大于一般就移动到下个option点
        index += 1;
    }
    //超出边界的处理
    if (index < 0) {
        index = 0;
    }
    
    if (index > _arrayCount) {
        
        index = _arrayCount;
    }
    return index;
}

#pragma mark 更新option点
- (void)updateSliderWithIndex:(NSInteger)index{
    if (index != _currentIndex) {
        [self setCurrentIndex:index];
        _currentIndex = index;
        if (_changeBlock) {
            _changeBlock(index);
        }
    }
}

- (void)setCurrentIndex:(NSInteger)currentIndex{
    if (_currentIndex != currentIndex) {
        _currentIndex = currentIndex;
        [self updateSliderViewPositonAtIndex:_currentIndex];
    }
}

@end
