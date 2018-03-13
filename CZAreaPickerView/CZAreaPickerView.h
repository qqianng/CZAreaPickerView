//
//  CZAreaPickerView.h
//  test
//
//  Created by new on 16/7/4.
//  Copyright © 2016年 it.sozi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CZAreaPickerView : UIPickerView


//字体
@property (nonatomic,strong) UIFont *font;
//字体颜色
@property (nonatomic,strong) UIColor *textColor;
//分隔符 比如@" ", @",", @";"
@property (nonatomic,copy) NSString *separator;

//所选择的地区
@property (nonatomic,copy,readonly) NSString *areaName;

- (instancetype)initWithFont:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor;

@end
