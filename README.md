
# ZXYPopupMenu
## 弹出菜单，可自定义cell样式
# 使用ZXYPopupMenu

三步完成主流App框架搭建：

 - 第一步：使用CocoaPods导入ZXYPopupMenu
 - 第二步：在view的点击事件中初始化ZXYPopupMenu
 - 第三步（可选）：自定义弹出cell样式

# 第一步：使用CocoaPods导入ZXYPopupMenu

CocoaPods 导入

  在文件 Podfile 中加入以下内容：

    pod 'ZXYPopupMenu'
  然后在终端中运行以下命令：

    pod install
  或者这个命令：
```
  禁止升级 CocoaPods 的 spec 仓库，否则会卡在 Analyzing dependencies，非常慢
    pod install --verbose --no-repo-update
  或者
    pod update --verbose --no-repo-update
```
  完成后，CocoaPods 会在您的工程根目录下生成一个 .xcworkspace 文件。您需要通过此文件打开您的工程，而不是之前的 .xcodeproj。

# 第二步：在view的点击事件中初始化ZXYPopupMenu

```
  ZXYPopupMenu 可以在指定位置弹出，或者依赖指定view弹出，先实现 <ZXYPopupMenuViewDelegate> 协议 ，实现代码如下
   //  在指定位置弹出
    [ZXYPopupMenuView showAtPoint:point titles:TITLES icons:nil menuWidth:110 otherSettings:^(ZXYPopupMenuView *popupMenu) {
       
       // 这里可以修改属性 ，也可以不写
        popupMenu.dismissOnSelected = YES;
        popupMenu.isShowShadow = YES;
        popupMenu.delegate = self;//点击事件代理一定得写
        popupMenu.offset = 10;
        popupMenu.rectCorner = UIRectCornerBottomLeft | UIRectCornerBottomRight;
        
    }];

  或者这样
   // 依赖指定view弹出
   [ZXYPopupMenuView showRelyOnView:sender titles:TITLESTWO icons:nil menuWidth:80 otherSettings:^(ZXYPopupMenuView *popupMenu) {
        popupMenu.delegate = self;//点击事件代理一定得写
    }];
    
```

# 第三步（可选）：自定义弹出cell样式

  ```
  
     [ZXYPopupMenuView showRelyOnView:sender titles:TITLESTWO icons:nil menuWidth:80 otherSettings:^(ZXYPopupMenuView *popupMenu) {
        popupMenu.delegate = self;//点击事件代理一定得写
        popupMenu.dataSource = self; //自定义cell代理一定得写
    }];
    
    实现 <ZXYPopupMenuViewDataSource> 协议
    
    - (UITableViewCell *)zxyPopupMenu:(ZXYPopupMenuView *)zxyPopupMenu cellForRowAtIndex:(NSInteger)index{
    
    
       return nil;
     }
    
``` 
# 实现点击代理方法 实现 <ZXYPopupMenuViewDelegate> 协议

  ```
     - (void)zxyPopupMenu:(ZXYPopupMenuView *)zxyPopupMenu didSelectedAtIndex:(NSInteger)index{
    
     //回调
           NSLog(@"点击了 %@ 选项",zxyPopupMenu.titles[index]);
      }
  ```  
