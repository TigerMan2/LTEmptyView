//
//  LTViewController.m
//  LTEmptyView
//
//  Created by wubingjia on 12/03/2019.
//  Copyright (c) 2019 wubingjia. All rights reserved.
//

#import "LTViewController.h"
#import <LTEmptyView/LTLoadingHelper.h>
#import "LTEmptyViewHelper.h"

@interface LTViewController ()

@end

@implementation LTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.view.ly_emptyView = [LTEmptyViewHelper emptyViewWithErrorType:LTEmptyViewErrorType_NetworkError btnClickBlock:^{
        [LTLoadingHelper showEmptyLoadingHUDWithStatus:@"正在加载中..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [LTLoadingHelper dismiss];
        });
    }];
    [self.view ly_showEmptyView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
