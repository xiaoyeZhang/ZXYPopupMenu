//
//  ViewController.m
//  ZXYPopupMenu
//
//  Created by zhangxiaoye on 2018/6/29.
//  Copyright © 2018年 zhangxiaoye. All rights reserved.
//

#import "ViewController.h"
#import "ZXYPopupMenuView.h"
#import "SCInputAccessoryCell.h"

#define TITLES @[@"扫一扫",@"付款"]
#define TITLESTWO @[@"支付宝",@"微信"]

#define ScreenHeight   [UIScreen mainScreen].bounds.size.height
#define ScreenWidth    [UIScreen mainScreen].bounds.size.width
#define KCellSpace 50
#define KCellWidth   ScreenWidth / 3
#define KCellHeight  ScreenWidth / 3

NSString *const KCellID = @"cellIDStr";

@interface ViewController ()<ZXYPopupMenuViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    CGFloat offer;
}
@property (strong, nonatomic)  UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *nameArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.collectionView];
}

- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(KCellWidth, KCellHeight);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 2;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth,KCellHeight) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
//        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:KCellID];
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KCellID forIndexPath:indexPath];
    cell.layer.borderColor = [UIColor redColor].CGColor;
    cell.layer.borderWidth = 1.0;
    
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(10, 10, KCellWidth - 20, KCellHeight - 20);
    imageView.image = [UIImage imageNamed:@"cellImg"];
    [cell.contentView addSubview:imageView];
    
    UILabel *lab = [[UILabel alloc]init];
    lab.font = [UIFont systemFontOfSize:13];
    lab.textColor = [UIColor redColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = [NSString stringWithFormat:@"这是第%ld个Cell",indexPath.row];
    lab.frame = CGRectMake(0, (KCellHeight - 30)/2, KCellWidth, 30);
    [cell.contentView addSubview:lab];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0,0,0,0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(KCellWidth, KCellHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    [ZXYPopupMenuView showRelyOnView:cell titles:TITLESTWO icons:nil menuWidth:80 otherSettings:^(ZXYPopupMenuView *popupMenu) {


    }];
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView*)scrollView{
    
    offer = scrollView.contentOffset.x;
    
    NSLog(@"%f",scrollView.contentOffset.x);
    
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView*)scrollView{
    
//    if(fabs(scrollView.contentOffset.x-offer) >10) {
//
//        if(scrollView.contentOffset.x>offer) {
//
//            int i = offer/KCellWidth + 1;
//
//            NSIndexPath* index =[NSIndexPath indexPathForRow:i inSection:0];
//
//            [_collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//
//        }else{
//
//            int i = scrollView.contentOffset.x/([UIScreen mainScreen].bounds.size.width-KCellSpace/2)+1;
//
//            NSIndexPath* index =[NSIndexPath indexPathForRow:i-1 inSection:0];
//
//            [_collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//
//        }
//
//    }
    
}

- (void)scrollViewWillEndDragging:(UIScrollView*)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint*)targetContentOffset{
//    if(fabs(scrollView.contentOffset.x-offer) >20) {
//        
//        if(scrollView.contentOffset.x>offer) {
//            
//            int i = scrollView.contentOffset.x/([UIScreen mainScreen].bounds.size.width-KCellSpace/2)+1;
//            
//            NSIndexPath* index =[NSIndexPath indexPathForRow:i inSection:0];
//            
//            [_collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//            
//        }else{
//            
//            int i = scrollView.contentOffset.x/([UIScreen mainScreen].bounds.size.width-KCellSpace/2)+1;
//            
//            i = (i -1)<0?0:(i -1);
//            
//            NSIndexPath* index =[NSIndexPath indexPathForRow:i inSection:0];
//            
//            [_collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//            
//        }
//        
//    }
    
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
- (IBAction)isBtnClick:(UIButton *)sender {
    
    [ZXYPopupMenuView showRelyOnView:sender titles:TITLESTWO icons:nil menuWidth:80 otherSettings:^(ZXYPopupMenuView *popupMenu) {
       
        
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
