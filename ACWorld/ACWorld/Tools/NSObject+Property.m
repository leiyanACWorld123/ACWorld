//
//  NSObject+Property.m
//  自动生成模型属性(kvc)
//
//  Created by apple on 16/6/5.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "NSObject+Property.h"

@implementation NSObject (Property)

+(void)createPropertyCodeWithDict:(NSDictionary *)dict
{
    NSMutableString *propertyList = [NSMutableString string];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *code;
        
        if([NSStringFromClass([obj class]) isEqualToString:@"__NSCFArray"]){
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSArray *%@;",key];
        }else if([NSStringFromClass([obj class]) isEqualToString:@"__NSCFString"]){
            code = [NSString stringWithFormat:@"@property (nonatomic,copy) NSString *%@;",key];
        }else if([NSStringFromClass([obj class]) isEqualToString:@"NSTaggedPointerString"]){
            code = [NSString stringWithFormat:@"@property (nonatomic,copy) NSString *%@;",key];
        }else if ([NSStringFromClass([obj class]) isEqualToString:@"__NSCFNumber"]){
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSNumber *%@;",key];
        }else if ([NSStringFromClass([obj class]) isEqualToString:@"__NSCFDictionary"]){
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSDictionary *%@;",key];
        }else if ([NSStringFromClass([obj class]) isEqualToString:@"__NSCFBOOL"]){
            code = [NSString stringWithFormat:@"@property (nonatomic,assign) BOOL %@;",key];
        }
        
        [propertyList appendFormat:@"\n%@\n",code];
    }];
    
    NSLog(@"%@",propertyList);
}
@end
