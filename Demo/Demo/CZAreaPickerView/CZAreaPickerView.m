//
//  CZAreaPickerView.m
//  test
//
//  Created by new on 16/7/4.
//  Copyright © 2016年 it.sozi. All rights reserved.
//

#import "CZAreaPickerView.h"
#import "CZProvince.h"

@interface CZAreaPickerView () <UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong) NSArray *provinces;
@property (nonatomic,weak) UITextField * textField;
@property (nonatomic,copy) NSString *areaName;

@end

@implementation CZAreaPickerView

- (instancetype)init {
    if (self = [super init]) {
        
        self = [self initWithFont:[UIFont systemFontOfSize:12] textColor:[UIColor blackColor] backgroundColor:[UIColor groupTableViewBackgroundColor]];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidBeginEditingAction:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    }
    return self;
}

- (instancetype)initWithFont:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor {
    if (self = [super init]) {
        self.delegate = self;
        self.dataSource = self;
        
        self.font = font;
        self.textColor = textColor;
        self.backgroundColor = backgroundColor;
    }
    return self;
}

- (NSArray *)provinces {
    if (!_provinces) {
        _provinces = [CZProvince provinces];
    }
    return _provinces;
}


#pragma mark - Notification

- (void)textFieldTextDidBeginEditingAction:(NSNotification *)notification {
    self.textField = notification.object;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - pickerView delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.provinces.count;
    } else if (component == 1) {
        NSInteger pIndex = [pickerView selectedRowInComponent:0];
        CZProvince *province = self.provinces[pIndex];
        return province.cities.count;
    } else {
        NSInteger pIndex = [pickerView selectedRowInComponent:0];
        NSInteger cIndex = [pickerView selectedRowInComponent:1];
        CZProvince *province = self.provinces[pIndex];
        CZCity *city = province.cities[cIndex];
        return city.areas.count;
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    NSString *text = nil;
    if (component == 0) {
        CZProvince *province = self.provinces[row];
        text = province.state;
        
    } else if (component == 1) {
        NSInteger pIndex = [pickerView selectedRowInComponent:0];
        CZProvince *province = self.provinces[pIndex];
        if (row < province.cities.count) {
            CZCity *city = province.cities[row];
            text = city.city;
        }
        
    } else {//component == 2;
        NSInteger pIndex = [pickerView selectedRowInComponent:0];
        NSInteger cIndex = [pickerView selectedRowInComponent:1];
        CZProvince *province = self.provinces[pIndex];
        if (cIndex < province.cities.count) {
            CZCity *city = province.cities[cIndex];
            if (row < city.areas.count) {
                text = city.areas[row];
            }
        }
    }
    
    UILabel *lab = (UILabel *)view;
    if (!lab) {
        lab = [[UILabel alloc] init];
        lab.font = self.font;
        lab.textColor = self.textColor;
        lab.textAlignment = NSTextAlignmentCenter;
    }
    lab.text = text;
    return lab;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    CZProvince *province = nil;
    CZCity *city = nil;
    NSString *districtName = nil;
    
    if (component == 0) {
        [pickerView reloadAllComponents];
        // 主动选中第1列的第一行
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView selectRow:0 inComponent:2 animated:YES];
        // 记录当前选中的省份
        province = self.provinces[row];

        if (province.cities.count > 0) {
            city = province.cities[0];
            
            if (city.areas.count > 0) {
                districtName = city.areas[0];
            }
        }
        
    } else if (component == 1) {
        NSInteger pIndex = [pickerView selectedRowInComponent:0];
        province = self.provinces[pIndex];
        
        if (row < province.cities.count) {
            [pickerView reloadComponent:2];
            [pickerView selectRow:0 inComponent:2 animated:YES];
            city = province.cities[row];
            
            if (city.areas.count > 0) {
                districtName = city.areas[0];
            }
        }
        
    } else if (component == 2) {
        NSInteger pIndex = [pickerView selectedRowInComponent:0];
        NSInteger cIndex = [pickerView selectedRowInComponent:1];
        province = self.provinces[pIndex];
        
        if (cIndex < province.cities.count) {
            city = province.cities[cIndex];
            
            if (row < city.areas.count) {
                districtName = city.areas[row];
            }
        }
    }
    
    NSMutableString *areaName = [NSMutableString stringWithFormat:@"%@",province.state];
    if (city) {
        [areaName appendFormat:@"%@%@", self.separator, city.city];
    }
    if (districtName) {
        [areaName appendFormat:@"%@%@", self.separator, districtName];
    }
    self.areaName = [areaName copy];
    self.textField.text = self.areaName;
    //发送文本改变的通知，因为使用pickerView改变textField的文本时，系统不会发送文本改变的通知。
    [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:nil];
}

@end
