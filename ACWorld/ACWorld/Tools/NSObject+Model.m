//
//  NSObject+Model.m
//  runtime(字典转模型1)
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "NSObject+Model.h"

#import <objc/message.h>

@implementation NSObject (Model)

+(instancetype)modelWithDict:(NSDictionary *)dict
{
   id objc = [[self alloc]init];
    
    //
   unsigned int count = 0;
    //Ivar:成员属性
    //count:成员属性总数
    Ivar *ivar = class_copyIvarList(self, &count);
    
    for(int i = 0 ; i  < count ; i++){
        Ivar var = ivar[i];
        
        //获取属性名字
        NSString *propretyName = [NSString stringWithUTF8String:ivar_getName(var)];
        //获取属性类型
//        NSString *propretType = [NSString stringWithUTF8String:ivar_getTypeEncoding(var)];
        
        NSString *key = [propretyName substringFromIndex:1];
        //
        if(dict[key]){
            [objc setValue:dict[key] forKey:propretyName];
        }
    }
    return objc;
}
@end
