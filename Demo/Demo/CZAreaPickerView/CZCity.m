//
//  CZCity.m
//  SAGA_iOS
//
//  Created by new on 16/5/11.
//  Copyright © 2016年 it.sozi. All rights reserved.
//

#import "CZCity.h"

@implementation CZCity

+ (instancetype)cityWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
