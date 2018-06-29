//
//  ZXYPopupMenuPath.m
//  ZXYPopupMenu
//
//  Created by zhangxiaoye on 2018/6/29.
//  Copyright © 2018年 zhangxiaoye. All rights reserved.
//

#import "ZXYPopupMenuPath.h"
#import "ZXYRectConst.h"

@implementation ZXYPopupMenuPath


+ (CAShapeLayer *)zxy_maskLayerWithRect:(CGRect)rect
                            rectCorner:(UIRectCorner)rectCorner
                          cornerRadius:(CGFloat)cornerRadius
                            arrowWidth:(CGFloat)arrowWidth
                           arrowHeight:(CGFloat)arrowHeight
                         arrowPosition:(CGFloat)arrowPosition
                        arrowDirection:(ZXYPopupMenuArrowDirection)arrowDirection
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [self zxy_bezierPathWithRect:rect rectCorner:rectCorner cornerRadius:cornerRadius borderWidth:0 borderColor:nil backgroundColor:nil arrowWidth:arrowWidth arrowHeight:arrowHeight arrowPosition:arrowPosition arrowDirection:arrowDirection].CGPath;
    return shapeLayer;
}


+ (UIBezierPath *)zxy_bezierPathWithRect:(CGRect)rect
                             rectCorner:(UIRectCorner)rectCorner
                           cornerRadius:(CGFloat)cornerRadius
                            borderWidth:(CGFloat)borderWidth
                            borderColor:(UIColor *)borderColor
                        backgroundColor:(UIColor *)backgroundColor
                             arrowWidth:(CGFloat)arrowWidth
                            arrowHeight:(CGFloat)arrowHeight
                          arrowPosition:(CGFloat)arrowPosition
                         arrowDirection:(ZXYPopupMenuArrowDirection)arrowDirection
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    if (borderColor) {
        [borderColor setStroke];
    }
    if (backgroundColor) {
        [backgroundColor setFill];
    }
    bezierPath.lineWidth = borderWidth;
    rect = CGRectMake(borderWidth / 2, borderWidth / 2, ZXYRectWidth(rect) - borderWidth, ZXYRectHeight(rect) - borderWidth);
    CGFloat topRightRadius = 0,topLeftRadius = 0,bottomRightRadius = 0,bottomLeftRadius = 0;
    CGPoint topRightArcCenter,topLeftArcCenter,bottomRightArcCenter,bottomLeftArcCenter;
    
    if (rectCorner & UIRectCornerTopLeft) {
        topLeftRadius = cornerRadius;
    }
    if (rectCorner & UIRectCornerTopRight) {
        topRightRadius = cornerRadius;
    }
    if (rectCorner & UIRectCornerBottomLeft) {
        bottomLeftRadius = cornerRadius;
    }
    if (rectCorner & UIRectCornerBottomRight) {
        bottomRightRadius = cornerRadius;
    }
    
    if (arrowDirection == ZXYPopupMenuArrowDirectionTop) {
        topLeftArcCenter = CGPointMake(topLeftRadius + ZXYRectX(rect), arrowHeight + topLeftRadius + ZXYRectX(rect));
        topRightArcCenter = CGPointMake(ZXYRectWidth(rect) - topRightRadius + ZXYRectX(rect), arrowHeight + topRightRadius + ZXYRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + ZXYRectX(rect), ZXYRectHeight(rect) - bottomLeftRadius + ZXYRectX(rect));
        bottomRightArcCenter = CGPointMake(ZXYRectWidth(rect) - bottomRightRadius + ZXYRectX(rect), ZXYRectHeight(rect) - bottomRightRadius + ZXYRectX(rect));
        if (arrowPosition < topLeftRadius + arrowWidth / 2) {
            arrowPosition = topLeftRadius + arrowWidth / 2;
        }else if (arrowPosition > ZXYRectWidth(rect) - topRightRadius - arrowWidth / 2) {
            arrowPosition = ZXYRectWidth(rect) - topRightRadius - arrowWidth / 2;
        }
        [bezierPath moveToPoint:CGPointMake(arrowPosition - arrowWidth / 2, arrowHeight + ZXYRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition, ZXYRectTop(rect) + ZXYRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition + arrowWidth / 2, arrowHeight + ZXYRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectWidth(rect) - topRightRadius, arrowHeight + ZXYRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectWidth(rect) + ZXYRectX(rect), ZXYRectHeight(rect) - bottomRightRadius - ZXYRectX(rect))];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(bottomLeftRadius + ZXYRectX(rect), ZXYRectHeight(rect) + ZXYRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectX(rect), arrowHeight + topLeftRadius + ZXYRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
        
    }else if (arrowDirection == ZXYPopupMenuArrowDirectionBottom) {
        topLeftArcCenter = CGPointMake(topLeftRadius + ZXYRectX(rect),topLeftRadius + ZXYRectX(rect));
        topRightArcCenter = CGPointMake(ZXYRectWidth(rect) - topRightRadius + ZXYRectX(rect), topRightRadius + ZXYRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + ZXYRectX(rect), ZXYRectHeight(rect) - bottomLeftRadius + ZXYRectX(rect) - arrowHeight);
        bottomRightArcCenter = CGPointMake(ZXYRectWidth(rect) - bottomRightRadius + ZXYRectX(rect), ZXYRectHeight(rect) - bottomRightRadius + ZXYRectX(rect) - arrowHeight);
        if (arrowPosition < bottomLeftRadius + arrowWidth / 2) {
            arrowPosition = bottomLeftRadius + arrowWidth / 2;
        }else if (arrowPosition > ZXYRectWidth(rect) - bottomRightRadius - arrowWidth / 2) {
            arrowPosition = ZXYRectWidth(rect) - bottomRightRadius - arrowWidth / 2;
        }
        [bezierPath moveToPoint:CGPointMake(arrowPosition + arrowWidth / 2, ZXYRectHeight(rect) - arrowHeight + ZXYRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition, ZXYRectHeight(rect) + ZXYRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition - arrowWidth / 2, ZXYRectHeight(rect) - arrowHeight + ZXYRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(bottomLeftRadius + ZXYRectX(rect), ZXYRectHeight(rect) - arrowHeight + ZXYRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectX(rect), topLeftRadius + ZXYRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectWidth(rect) - topRightRadius + ZXYRectX(rect), ZXYRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectWidth(rect) + ZXYRectX(rect), ZXYRectHeight(rect) - bottomRightRadius - ZXYRectX(rect) - arrowHeight)];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        
    }else if (arrowDirection == ZXYPopupMenuArrowDirectionLeft) {
        topLeftArcCenter = CGPointMake(topLeftRadius + ZXYRectX(rect) + arrowHeight,topLeftRadius + ZXYRectX(rect));
        topRightArcCenter = CGPointMake(ZXYRectWidth(rect) - topRightRadius + ZXYRectX(rect), topRightRadius + ZXYRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + ZXYRectX(rect) + arrowHeight, ZXYRectHeight(rect) - bottomLeftRadius + ZXYRectX(rect));
        bottomRightArcCenter = CGPointMake(ZXYRectWidth(rect) - bottomRightRadius + ZXYRectX(rect), ZXYRectHeight(rect) - bottomRightRadius + ZXYRectX(rect));
        if (arrowPosition < topLeftRadius + arrowWidth / 2) {
            arrowPosition = topLeftRadius + arrowWidth / 2;
        }else if (arrowPosition > ZXYRectHeight(rect) - bottomLeftRadius - arrowWidth / 2) {
            arrowPosition = ZXYRectHeight(rect) - bottomLeftRadius - arrowWidth / 2;
        }
        [bezierPath moveToPoint:CGPointMake(arrowHeight + ZXYRectX(rect), arrowPosition + arrowWidth / 2)];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectX(rect), arrowPosition)];
        [bezierPath addLineToPoint:CGPointMake(arrowHeight + ZXYRectX(rect), arrowPosition - arrowWidth / 2)];
        [bezierPath addLineToPoint:CGPointMake(arrowHeight + ZXYRectX(rect), topLeftRadius + ZXYRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectWidth(rect) - topRightRadius, ZXYRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectWidth(rect) + ZXYRectX(rect), ZXYRectHeight(rect) - bottomRightRadius - ZXYRectX(rect))];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(arrowHeight + bottomLeftRadius + ZXYRectX(rect), ZXYRectHeight(rect) + ZXYRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        
    }else if (arrowDirection == ZXYPopupMenuArrowDirectionRight) {
        topLeftArcCenter = CGPointMake(topLeftRadius + ZXYRectX(rect),topLeftRadius + ZXYRectX(rect));
        topRightArcCenter = CGPointMake(ZXYRectWidth(rect) - topRightRadius + ZXYRectX(rect) - arrowHeight, topRightRadius + ZXYRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + ZXYRectX(rect), ZXYRectHeight(rect) - bottomLeftRadius + ZXYRectX(rect));
        bottomRightArcCenter = CGPointMake(ZXYRectWidth(rect) - bottomRightRadius + ZXYRectX(rect) - arrowHeight, ZXYRectHeight(rect) - bottomRightRadius + ZXYRectX(rect));
        if (arrowPosition < topRightRadius + arrowWidth / 2) {
            arrowPosition = topRightRadius + arrowWidth / 2;
        }else if (arrowPosition > ZXYRectHeight(rect) - bottomRightRadius - arrowWidth / 2) {
            arrowPosition = ZXYRectHeight(rect) - bottomRightRadius - arrowWidth / 2;
        }
        [bezierPath moveToPoint:CGPointMake(ZXYRectWidth(rect) - arrowHeight + ZXYRectX(rect), arrowPosition - arrowWidth / 2)];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectWidth(rect) + ZXYRectX(rect), arrowPosition)];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectWidth(rect) - arrowHeight + ZXYRectX(rect), arrowPosition + arrowWidth / 2)];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectWidth(rect) - arrowHeight + ZXYRectX(rect), ZXYRectHeight(rect) - bottomRightRadius - ZXYRectX(rect))];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(bottomLeftRadius + ZXYRectX(rect), ZXYRectHeight(rect) + ZXYRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectX(rect), arrowHeight + topLeftRadius + ZXYRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectWidth(rect) - topRightRadius + ZXYRectX(rect) - arrowHeight, ZXYRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        
    }else if (arrowDirection == ZXYPopupMenuArrowDirectionNone) {
        topLeftArcCenter = CGPointMake(topLeftRadius + ZXYRectX(rect),  topLeftRadius + ZXYRectX(rect));
        topRightArcCenter = CGPointMake(ZXYRectWidth(rect) - topRightRadius + ZXYRectX(rect),  topRightRadius + ZXYRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + ZXYRectX(rect), ZXYRectHeight(rect) - bottomLeftRadius + ZXYRectX(rect));
        bottomRightArcCenter = CGPointMake(ZXYRectWidth(rect) - bottomRightRadius + ZXYRectX(rect), ZXYRectHeight(rect) - bottomRightRadius + ZXYRectX(rect));
        [bezierPath moveToPoint:CGPointMake(topLeftRadius + ZXYRectX(rect), ZXYRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectWidth(rect) - topRightRadius, ZXYRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectWidth(rect) + ZXYRectX(rect), ZXYRectHeight(rect) - bottomRightRadius - ZXYRectX(rect))];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(bottomLeftRadius + ZXYRectX(rect), ZXYRectHeight(rect) + ZXYRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(ZXYRectX(rect), arrowHeight + topLeftRadius + ZXYRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
    }
    
    [bezierPath closePath];
    return bezierPath;
}


@end
