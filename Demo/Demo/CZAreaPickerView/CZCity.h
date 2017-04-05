//
//  CZCity.h
//  SAGA_iOS
//
//  Created by new on 16/5/11.
//  Copyright © 2016年 it.sozi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZCity : NSObject

@property (nonatomic,copy) NSString *city;
@property (nonatomic,strong) NSArray *areas;

+ (instancetype)cityWithDict:(NSDictionary *)dict;

@end
