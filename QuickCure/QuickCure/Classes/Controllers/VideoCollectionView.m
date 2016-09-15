//
//  ViewController.m
//  HB网易新闻
//
//  Created by hebing on 16/9/5.
//  Copyright © 2016年 hebing. All rights reserved.
//

/*
 1.3组section
 2.初始位置是中间section第一个item
 3.滚动结束之后,调回到中间section对应的item位置
 */

#import "VideoCollectionView.h"
#import "VideoCell.h"

@interface VideoCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)NSTimer* timer;
//@property (strong, nonatomic)  UILabel *la_lable;
@property (strong, nonatomic)  UIPageControl *pageControl;

@property(nonatomic,strong)UICollectionView* collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout* flowLayOut;
@end

@implementation VideoCollectionView

-(void)setVideoAry:(NSArray *)videoAry{
    
    _videoAry=videoAry;
    
    

    [self.collectionView reloadData];
    //这个只有在这才能加载出来
//    UIView *bottom = [[UIView alloc]initWithFrame:CGRectMake(0, self.height-40, screemW, 40)];
//    bottom.backgroundColor = [UIColor blackColor];
//    bottom.alpha = 1;
//    
//    [self addSubview:bottom];
//    [self bringSubviewToFront:bottom];
    //注意坐标改变
    //这个写在setUI里不显示
    UIPageControl *pagecontrol = [[UIPageControl alloc]initWithFrame:CGRectMake(screemW-80, self.height-20-10, 80, 20)];
    self.pageControl=pagecontrol;
    pagecontrol.numberOfPages = self.videoAry.count;
    
    [pagecontrol setPageIndicatorTintColor:[UIColor darkGrayColor]];
    
    [pagecontrol setCurrentPageIndicatorTintColor:[UIColor colorWithRed:1.0 green:0.2022 blue:0.1583 alpha:1.0]];
    [self bringSubviewToFront:pagecontrol];
//    [bottom addSubview:pagecontrol];
    [self addSubview:pagecontrol];

    
    pagecontrol.currentPage = 0;
    [self addTimer];
    
   }

//-(NSArray *)videoAry{
//    if (_videoAry) {
//        _videoAry= @[@"http://img.guahao.com/portal_upload/rollingnews/1453447883150.jpg",
//                                          @"http://img.guahao.com/portal_upload/mediafocus/1461826474435.jpg",
//                                          @"http://img.guahao.com/portal_upload/rollingnews/1461574027543.jpg"];
//    }
//    return _videoAry;
//}

-(void)layoutSubviews{
    [super layoutSubviews];
    //这个方法也要等加载完成后调用
    _flowLayOut.itemSize=self.collectionView.frame.size;
    _flowLayOut.minimumLineSpacing=0;
    _flowLayOut.minimumInteritemSpacing=0;
    _flowLayOut.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    //要数据获取成功后调用,不能在viewDIdload中调用
    //这个放在这没有初始位置的快速滚动现象
    NSIndexPath* indexpath=[NSIndexPath indexPathForRow:0 inSection:1];
    [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        //注意调用顺序,一定要这样写
          [self setUI];
    }
  
    return self;
}



-(void)setUI{
    self.bounds=CGRectMake(0, 0, screemW, 200);
        UICollectionViewFlowLayout* flowLayOut=[[UICollectionViewFlowLayout alloc]init];
    self.flowLayOut=flowLayOut;
   
    self.collectionView=[[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayOut];
    [self addSubview:self.collectionView];
    self.collectionView.bounces=NO;
    self.collectionView.showsHorizontalScrollIndicator=NO;
    self.collectionView.pagingEnabled=YES;
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.collectionView registerClass:[VideoCell class] forCellWithReuseIdentifier:@"video"];
    //立即滚动到第0组第1个item

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.videoAry.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    VideoCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"video" forIndexPath:indexPath];
    self.pageControl.currentPage=indexPath.item;
    cell.urlString=self.videoAry[indexPath.item ];
    return cell;
}
//解决bug,拖动bug
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    int page=(int)scrollView.contentOffset.x/self.frame.size.width;
    //此处item
    int item=page%self.videoAry.count;
    NSIndexPath* indexpath=[NSIndexPath indexPathForRow:item inSection:1];
        if(item==0){
            NSIndexPath* indexpathTem=[NSIndexPath indexPathForRow:self.videoAry.count-1 inSection:0];
            [self.collectionView scrollToItemAtIndexPath:indexpathTem atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    
        }
    
    [self.collectionView  scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];

 
}


//解决bug,代码bug
-(void)changePage{
    
    NSIndexPath* currentIndex=[self.collectionView  indexPathsForVisibleItems].lastObject;
    
    //    NSIndexPath* nextIndex=[NSIndexPath indexPathForRow:currentIndex.item inSection:sectionCount/2];
    
    //获取下一个的位置
    int index = (int)currentIndex.item+1;
    int item=index%self.videoAry.count;
    NSIndexPath* indexpath=[NSIndexPath indexPathForRow:item inSection:1];
    if(item==0){
        NSIndexPath* indexpathTem=[NSIndexPath indexPathForRow:self.videoAry.count-1 inSection:0];
        [self.collectionView  scrollToItemAtIndexPath:indexpathTem atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        
    }
    
    [self.collectionView  scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    //手拖动时,销毁定时器
    [self removeTimer];
    
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //手拖动结束时,加定时器
    [self addTimer];
}
-(void)addTimer{
    self.timer=[NSTimer timerWithTimeInterval:1.5 target:self selector:@selector(changePage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes ];
    
}

-(void)removeTimer{
    
    [self.timer invalidate];
    self.timer=nil;
}

@end
