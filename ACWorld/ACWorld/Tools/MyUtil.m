//
//  MyUtil.m
//  ACWorld
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "MyUtil.h"

@implementation MyUtil


+ (void)showMessage:(NSString *)text
{
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:0.7];
}

+ (void)showSuccess:(NSString *)success
{
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = success;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/success"]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 1秒之后再消失
    [hud hide:YES afterDelay:0.7];
}


+ (void)showError:(NSString *)error
{
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = error;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/error"]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 1秒之后再消失
    [hud hide:YES afterDelay:0.7];
}

+(void)show{
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = @"加载中...";
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
}

+(void)hide{
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    [MBProgressHUD hideHUDForView:view animated:YES];
}

/***************************************************************************/

#pragma mark - 发送请求(Get/Post)
+(void)requestWithUrlString:(NSString *)urlString
                 parameters:(id)parameters
                       type:(HttpRequestType)type
                    success:(void (^)(id))success
                    failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    switch (type) {
        case HttpRequestTypeGet:
        {
            [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if(success){
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if(failure){
                    failure(error);
                }
            }];
        }
            break;
        case HttpRequestTypePost:
        {
            [manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if(success){
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if(failure){
                    failure(error);
                }
            }];
        }
            break;
    
        default:
            break;
    }
}

#pragma mark - Get请求
+(void)getWithUrlString:(NSString *)urlString
             parameters:(id)parameters
                success:(void (^)(id))success
                failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure){
            failure(error);
        }
    }];
}

#pragma mark - Post请求
+(void)postWithUrlString:(NSString *)urlString
              parameters:(id)parameters
                 success:(void (^)(id))success
                 failure:(void (^)(NSError *))failure
{
    __weak MyUtil *weakself = (MyUtil *)self;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript", nil];
    [manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure){
            failure(error);
            [weakself requestFailed:error];
        }
    }];
}

#pragma mark - 图片上传
+(void)uploadImageWithUrlString:(NSString *)urlString
                     parameters:(id)parameters
                      imageData:(NSData *)imageData
                        success:(void (^)(id))success
                        failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript", nil];
    
    [manager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:imageData name:@"" fileName:@"" mimeType:@"image/jpeg"];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure){
            failure(error);
        }
    }];

}

-(void)requestFailed:(NSError *)error
{
    switch (error.code) {
        case AFNetworkErrorType_TimeOut:
            NSLog(@"请求超时");
            break;
        case AFNetworkErrorType_NoNetwork:
            NSLog(@"断网");
            break;
        case AFNetworkErrorType_UnURL:
            NSLog(@"不支持的url");
            break;
        case AFNetworkErrorType_3840Failed:
            NSLog(@"请求或返回不是json格式");
            break;
        case AFNetworkErrorType_404Failed:
            NSLog(@"404错误");
            break;
        default:
            break;
    }
}



#pragma mark - 判断手机号码格式是否正确
+(BOOL)mobilePhone:(NSString *)mobile{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if(mobile.length != 11){
        [self showMessage:@"不足11位"];
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            [self showMessage:@"请输入正确的手机号码"];
            return NO;
        }
    }
}

#pragma mark - 生成纯色图片
+(UIImage *)createImageFromColor:(UIColor *)color imgSize:(CGSize)size
{
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, frame);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//压缩图片到指定尺寸大小
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size{
    UIImage *resultImage = image;
    UIGraphicsBeginImageContext(size);
    [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIGraphicsEndImageContext();
    return resultImage;
}
@end
