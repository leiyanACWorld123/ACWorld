//
//  NSObject+Model.h
//  runtime(字典转模型1)
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Model)
+(instancetype)modelWithDict:(NSDictionary *)dict;
@end
