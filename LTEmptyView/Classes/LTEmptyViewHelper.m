//
//  MSEmpyViewHelper.m
//  empyView
//
//  Created by luzhaoyang on 2019/2/21.
//  Copyright © 2019 com.sirstock. All rights reserved.
//

#import "LTEmptyViewHelper.h"

@implementation LTEmptyViewHelper

+ (LYEmptyView *)emptyViewWithErrorType:(LTEmptyViewErrorType)errorType btnClickBlock:(LYActionTapBlock)btnClickBlock {
    NSString *imageName = nil;
    NSString *title = nil;
    NSString *buttonTitle = nil;
    if (errorType == LTEmptyViewErrorType_Empty ) {
        imageName = @"nodata";
        title = @"暂无数据";
    } else if (errorType == LTEmptyViewErrorType_NetworkError ) {
        imageName = @"network_error";
        title = @"网络开小差，请检查您的网络设置";
        buttonTitle = @"刷新";
    } else {
        imageName = @"webpage_404";
        title = @"页面找不到了...";
    }
    
    LYEmptyView *emptyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:imageName] titleStr:title detailStr:nil btnTitleStr:buttonTitle btnClickBlock:btnClickBlock];
    if (!buttonTitle || buttonTitle.length <= 0) {
        emptyView.tapEmptyViewBlock = btnClickBlock;
    }
    
    emptyView.titleLabTextColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0f];
    emptyView.actionBtnTitleColor = [UIColor redColor];
    emptyView.actionBtnBorderColor = [UIColor redColor];
    emptyView.actionBtnBorderWidth = 1;
    return emptyView;
}

+ (LYEmptyView *)emptyViewWithImage:(UIImage *)image titleStr:(NSString *)titleStr detailStr:(NSString *)detailStr btnTitleStr:(NSString *)btnTitleStr btnClickBlock:(void (^)(void))btnClickBlock {
    LYEmptyView *emptyView = [LYEmptyView emptyActionViewWithImage:image titleStr:titleStr detailStr:detailStr btnTitleStr:btnTitleStr btnClickBlock:btnClickBlock];
    if (!btnTitleStr || btnTitleStr.length <= 0) {
        emptyView.tapEmptyViewBlock = btnClickBlock;
    }
    return emptyView;
}

@end
