//
//  ViewController.m
//  Demo
//
//  Created by new on 17/4/5.
//  Copyright © 2017年 it.sozi. All rights reserved.
//

#import "ViewController.h"
#import "CZAreaPickerView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *areaTextField;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CZAreaPickerView *areaPickerView = [[CZAreaPickerView alloc] init];
    self.areaTextField.inputView = areaPickerView;
    
    //adjust appearance
//    areaPickerView.separator = @", ";
//    areaPickerView.font = [UIFont systemFontOfSize:18];
//    areaPickerView.textColor = [UIColor colorWithWhite:0.1 alpha:1];
//    areaPickerView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
}



@end
