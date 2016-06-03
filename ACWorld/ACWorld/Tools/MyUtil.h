//
//  MyUtil.h
//  ACWorld
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <AFNetworking/AFNetworking.h>

/**
 *  网络请求类型
 */
typedef NS_ENUM(NSUInteger,HttpRequestType) {
    /**
     *  get请求
     */
    HttpRequestTypeGet = 0,
    /**
     *  post请求
     */
    HttpRequestTypePost
};

typedef NS_ENUM(NSUInteger,AFNetworkErrorType){
    AFNetworkErrorType_TimeOut    = NSURLErrorTimedOut,                 //-1001 请求超时
    AFNetworkErrorType_UnURL      = NSURLErrorUnsupportedURL,           //-1002 不支持的URL
    AFNetworkErrorType_NoNetwork  = NSURLErrorNotConnectedToInternet,   //-1009 断网
    AFNetworkErrorType_404Failed  = NSURLErrorBadServerResponse,        //-1011 404错误
    AFNetworkErrorType_3840Failed = 3840                                //请求或者返回不是Json格式
};

@interface MyUtil : NSObject

/**** MBProgressHUD ****/

//显示信息
+ (void)showMessage:(NSString *)text;

//显示成功信息
+ (void)showSuccess:(NSString *)success;

//显示失败信息
+ (void)showError:(NSString *)error;

//显示菊花
+(void)show;

//手动关闭
+(void)hide;



/**** AFNetworking ****/

/**
 *  发送网络请求
 *
 *  @param URLString  请求地址
 *  @param parameters 请求参数
 *  @param type       请求类型（Get,Post)
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)requestWithUrlString:(NSString *)urlString
                  parameters:(id)parameters
                        type:(HttpRequestType)type
                     success:(void (^)(id responseObject))success
                     failure:(void (^)(NSError *error))failure;

/**
 *  Get请求
 *
 *  @param urlString  请求地址
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+(void)getWithUrlString:(NSString *)urlString
             parameters:(id)parameters
                success:(void(^)(id responseObject))success
                failure:(void(^)(NSError *error))failure;

/**
 *  Post请求
 *
 *  @param urlString  请求地址
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+(void)postWithUrlString:(NSString *)urlString
             parameters:(id)parameters
                success:(void(^)(id responseObject))success
                failure:(void(^)(NSError *error))failure;


/**
 *  图片上传请求
 *
 *  @param urlString  请求地址
 *  @param parameters 请求参数
 *  @param imageData  请求图片二进制参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+(void)uploadImageWithUrlString:(NSString *)urlString
                     parameters:(id)parameters
                      imageData:(NSData *)imageData
                        success:(void(^)(id responseObject))success
                        failure:(void(^)(NSError *error))failure;


/**** 判断手机号码格式是否正确 ****/
+(BOOL)mobilePhone:(NSString *)mobile;

/**** 生成纯色图片 ****/
+(UIImage *)createImageFromColor:(UIColor *)color imgSize:(CGSize)size;
/**** 压缩图片到指定尺寸 ****/
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;
@end
