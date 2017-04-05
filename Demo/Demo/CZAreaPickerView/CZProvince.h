//
//  CZProvince.h
//  SAGA_iOS
//
//  Created by new on 16/5/11.
//  Copyright © 2016年 it.sozi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZCity.h"

@interface CZProvince : NSObject

@property (nonatomic,copy) NSString *state;
@property (nonatomic,strong) NSArray *cities;

+ (NSArray *)provinces;


@end
