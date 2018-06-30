//
//  ViewController.m
//  ZXYPopupMenu
//
//  Created by zhangxiaoye on 2018/6/29.
//  Copyright © 2018年 zhangxiaoye. All rights reserved.
//

#import "ViewController.h"
#import "ZXYPopupMenuView.h"

#define TITLES @[@"扫一扫",@"付款"]

@interface ViewController ()<ZXYPopupMenuViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView: self.view];
    
    [self showDarkPopupMenuWithPoint:p];
}

- (void)showDarkPopupMenuWithPoint:(CGPoint)point
{
    
    [ZXYPopupMenuView showAtPoint:point titles:TITLES icons:nil menuWidth:110 otherSettings:^(ZXYPopupMenuView *popupMenu) {
       
        popupMenu.dismissOnSelected = YES;
        popupMenu.isShowShadow = YES;
        popupMenu.delegate = self;
        popupMenu.offset = 10;
        popupMenu.rectCorner = UIRectCornerBottomLeft | UIRectCornerBottomRight;
        
    }];
    
}

- (void)zxyPopupMenu:(ZXYPopupMenuView *)zxyPopupMenu didSelectedAtIndex:(NSInteger)index{
    
    //推荐回调
    NSLog(@"点击了 %@ 选项",zxyPopupMenu.titles[index]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
