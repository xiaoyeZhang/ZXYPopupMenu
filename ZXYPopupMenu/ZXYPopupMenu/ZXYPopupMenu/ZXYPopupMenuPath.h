//
//  ZXYPopupMenuPath.h
//  ZXYPopupMenu
//
//  Created by zhangxiaoye on 2018/6/29.
//  Copyright © 2018年 zhangxiaoye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZXYPopupMenuArrowDirection) {
    ZXYPopupMenuArrowDirectionTop = 0,  //箭头朝上
    ZXYPopupMenuArrowDirectionBottom,   //箭头朝下
    ZXYPopupMenuArrowDirectionLeft,     //箭头朝左
    ZXYPopupMenuArrowDirectionRight,    //箭头朝右
    ZXYPopupMenuArrowDirectionNone      //没有箭头
};

@interface ZXYPopupMenuPath : NSObject

+ (CAShapeLayer *)zxy_maskLayerWithRect:(CGRect)rect
                            rectCorner:(UIRectCorner)rectCorner
                          cornerRadius:(CGFloat)cornerRadius
                            arrowWidth:(CGFloat)arrowWidth
                           arrowHeight:(CGFloat)arrowHeight
                         arrowPosition:(CGFloat)arrowPosition
                        arrowDirection:(ZXYPopupMenuArrowDirection)arrowDirection;

+ (UIBezierPath *)zxy_bezierPathWithRect:(CGRect)rect
                             rectCorner:(UIRectCorner)rectCorner
                           cornerRadius:(CGFloat)cornerRadius
                            borderWidth:(CGFloat)borderWidth
                            borderColor:(UIColor *)borderColor
                        backgroundColor:(UIColor *)backgroundColor
                             arrowWidth:(CGFloat)arrowWidth
                            arrowHeight:(CGFloat)arrowHeight
                          arrowPosition:(CGFloat)arrowPosition
                         arrowDirection:(ZXYPopupMenuArrowDirection)arrowDirection;


@end
