//
//  MSLoadingHelper.m
//  empyView
//
//  Created by luzhaoyang on 2019/2/20.
//  Copyright © 2019 com.sirstock. All rights reserved.
//

#import "LTLoadingHelper.h"
#import "SVProgressHUD/SVProgressHUD.h"
#import "YYImage.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface LTLoadingHelperManager()
@property (nonatomic, strong) NSMutableDictionary *gifImageInfo; //!< 存放gif图片信息
@end
@implementation LTLoadingHelperManager : NSObject
+ (instancetype)defaultManager {
    static LTLoadingHelperManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_manager) {
            _manager = [[LTLoadingHelperManager alloc] init];
            _manager.gifImageName = @"loading.gif";
            _manager.imageSize = CGSizeMake(50, 50);
        }
    });
    return _manager;
}

- (void)setGifImageName:(NSString *)gifImageName {
    if (_gifImageName != gifImageName && gifImageName.length > 0) {
        if ([_gifImageInfo objectForKey:gifImageName]) { // 已经包含了设置的图片
            _gifImageName = gifImageName;
            return ;
        }
        YYImage *image = [YYImage imageNamed:gifImageName];
        if (image) {
            _gifImageName = gifImageName;
            NSInteger frameCount = [image animatedImageFrameCount];
            NSMutableArray *images = [NSMutableArray array];
            for (NSInteger i = 0; i < frameCount; i++) {
                UIImage *img = [image animatedImageFrameAtIndex:i];
                if (img) {
                    [images addObject:img];
                }
            }
            [self.gifImageInfo setObject:images forKey:gifImageName];
        }
    }
}

- (void)setImageSize:(CGSize)imageSize {
    _imageSize = imageSize;
}

- (NSArray <UIImage *>*)currentGifImages {
    return [self.gifImageInfo objectForKey:self.gifImageName];
}

- (NSMutableDictionary *)gifImageInfo {
    if (!_gifImageInfo) {
        _gifImageInfo = [NSMutableDictionary dictionary];
    }
    return _gifImageInfo;
}
@end

@implementation LTLoadingHelper

+ (void)showEmptyLoadingHUDWithAllowUserInteraction:(BOOL)allowUserInteraction status:(NSString *)status duration:(NSTimeInterval)duration {
    [SVProgressHUD setDefaultMaskType:allowUserInteraction ? SVProgressHUDMaskTypeNone : SVProgressHUDMaskTypeClear];
    [SVProgressHUD setBorderColor:[UIColor clearColor]];
    [SVProgressHUD setBorderWidth:0.0];
    [SVProgressHUD setShouldTintImages:NO];
    [SVProgressHUD setImageViewSize:[[LTLoadingHelperManager defaultManager] imageSize]];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setForegroundColor:[UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [SVProgressHUD setNoShadow];
    
    // 加载图片
    NSArray *images = [[LTLoadingHelperManager defaultManager] currentGifImages];
    if (duration > 0) {
        [SVProgressHUD showAnimatedImages:images status:status duration:duration];
    } else {
        [SVProgressHUD showAnimatedImages:images status:status];
    }
}

+ (void)showEmptyLoadingHUDWithStatus:(NSString *)status {
    [self showEmptyLoadingHUDWithAllowUserInteraction:NO status:status duration:-1];
}

+ (void)showCommitLoadingHUDWithStatus:(NSString *)status {
    [self showCommitLoadingHUDWithAllowUserInteraction:NO status:status duration:-1];
}

+ (void)showCommitLoadingHUDWithAllowUserInteraction:(BOOL)allowUserInteraction status:(NSString *)status duration:(NSTimeInterval)duration {
    [SVProgressHUD setDefaultMaskType:allowUserInteraction ? SVProgressHUDMaskTypeNone : SVProgressHUDMaskTypeClear];
    [SVProgressHUD setBorderColor:[UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0]];
    [SVProgressHUD setBorderWidth:0.5];
    [SVProgressHUD setShouldTintImages:NO];
    [SVProgressHUD setImageViewSize:[[LTLoadingHelperManager defaultManager] imageSize]];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setForegroundColor:[UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [SVProgressHUD setShadowColor:[[UIColor blackColor] colorWithAlphaComponent:0.15]];
    
    
    // 加载图片
    NSArray *images = [[LTLoadingHelperManager defaultManager] currentGifImages];
    if (duration > 0) {
        [SVProgressHUD showAnimatedImages:images status:status duration:duration];
    } else {
        [SVProgressHUD showAnimatedImages:images status:status];
    }
}

+ (void)dismiss {
    [SVProgressHUD setBorderColor:[UIColor clearColor]];
    [SVProgressHUD dismiss];
}

@end
