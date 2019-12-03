//
//  MSLoadingHelper.h
//  empyView
//
//  Created by luzhaoyang on 2019/2/20.
//  Copyright © 2019 com.sirstock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LTLoadingHelperManager : NSObject
@property (nonatomic, strong) NSString *gifImageName;
@property (nonatomic, assign) CGSize imageSize;

+ (instancetype)defaultManager ;
- (NSArray <UIImage *>*)currentGifImages ;
@end

@interface LTLoadingHelper : NSObject

/**
 显示空白加载
 */
+ (void)showEmptyLoadingHUDWithStatus:(NSString *)status ;
+ (void)showEmptyLoadingHUDWithAllowUserInteraction:(BOOL)allowUserInteraction status:(NSString *)status duration:(NSTimeInterval)duration ;

/**
 显示提交后的加载
 */
+ (void)showCommitLoadingHUDWithStatus:(NSString *)status ;
+ (void)showCommitLoadingHUDWithAllowUserInteraction:(BOOL)allowUserInteraction status:(NSString *)status duration:(NSTimeInterval)duration ;

+ (void)dismiss ;

@end

NS_ASSUME_NONNULL_END
