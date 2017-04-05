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
}



@end
