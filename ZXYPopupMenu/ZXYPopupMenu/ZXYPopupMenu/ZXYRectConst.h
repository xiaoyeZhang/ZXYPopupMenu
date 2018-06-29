//
//  ZXYRectConst.h
//  ZXYPopupMenu
//
//  Created by zhangxiaoye on 2018/6/29.
//  Copyright © 2018年 zhangxiaoye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

UIKIT_STATIC_INLINE CGFloat ZXYRectWidth(CGRect rect)
{
    return rect.size.width;
}

UIKIT_STATIC_INLINE CGFloat ZXYRectHeight(CGRect rect)
{
    return rect.size.height;
}

UIKIT_STATIC_INLINE CGFloat ZXYRectX(CGRect rect)
{
    return rect.origin.x;
}

UIKIT_STATIC_INLINE CGFloat ZXYRectY(CGRect rect)
{
    return rect.origin.y;
}

UIKIT_STATIC_INLINE CGFloat ZXYRectTop(CGRect rect)
{
    return rect.origin.y;
}

UIKIT_STATIC_INLINE CGFloat ZXYRectBottom(CGRect rect)
{
    return rect.origin.y + rect.size.height;
}

UIKIT_STATIC_INLINE CGFloat ZXYRectLeft(CGRect rect)
{
    return rect.origin.x;
}

UIKIT_STATIC_INLINE CGFloat ZXYRectRight(CGRect rect)
{
    return rect.origin.x + rect.size.width;
}

@interface ZXYRectConst : NSObject

@end

