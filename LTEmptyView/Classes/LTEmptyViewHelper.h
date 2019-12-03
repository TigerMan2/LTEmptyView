//
//  MSEmpyViewHelper.h
//  empyView
//
//  Created by luzhaoyang on 2019/2/21.
//  Copyright © 2019 com.sirstock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LYEmptyView/LYEmptyViewHeader.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LTEmptyViewErrorType) {
    LTEmptyViewErrorType_Empty = 0,
    LTEmptyViewErrorType_NetworkError,
    LTEmptyViewErrorType_Web404,
};

@interface LTEmptyViewHelper : NSObject

+ (LYEmptyView *)emptyViewWithErrorType:(LTEmptyViewErrorType)errorType btnClickBlock:(void (^)(void))btnClickBlock ;

+ (LYEmptyView *)emptyViewWithImage:(UIImage *)image titleStr:(NSString *)titleStr detailStr:(NSString *)detailStr btnTitleStr:(NSString *)btnTitleStr btnClickBlock:(void (^)(void))btnClickBlock ;

@end

NS_ASSUME_NONNULL_END
