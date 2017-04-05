//
//  CZProvince.m
//  SAGA_iOS
//
//  Created by new on 16/5/11.
//  Copyright © 2016年 it.sozi. All rights reserved.
//

#import "CZProvince.h"

@implementation CZProvince

+ (NSArray *)provinces {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"area.plist" ofType:nil];
    NSArray *dicts = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *provinces = [NSMutableArray array];
    
    for (NSDictionary *dict in dicts) {
        CZProvince *province = [self provinceWithDict:dict];
        [provinces addObject:province];
    }
    
    return provinces;
}

+ (instancetype)provinceWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *desArr = [NSMutableArray array];
        for (NSDictionary *dict in self.cities) {
            CZCity *city = [CZCity cityWithDict:dict];
            [desArr addObject:city];
        }
        self.cities = [desArr copy];
    }
    return self;
}


@end
