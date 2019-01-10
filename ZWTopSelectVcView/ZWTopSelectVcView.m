//
//  ZWTopSelectVcView.m
//  ZWTopSelectVcView
//
//  Created by 流年划过颜夕 on 16/5/6.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//

#define NavigationBar_HEIGHT 44
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kWidth(R) (R)*(kScreenWidth)/320


#import "ZWTopSelectButton.h"
#import "ZWTopSelectVcView.h"
static const CGFloat originalTopViewHeight=50;
static const CGFloat originalChildVcViewHeight=50;

@interface ZWTopSelectVcView();
@property (nonatomic, assign) CGFloat                  topViewHeight;
@property (nonatomic, assign) CGFloat                  topViewWidth;
@property (nonatomic, assign) CGFloat                  topViewX;
@property (nonatomic, assign) CGFloat                  topViewY;

@property (nonatomic, assign) CGFloat                  childVcViewHeight;
@property (nonatomic, assign) CGFloat                  childVcViewWidth;
@property (nonatomic, assign) CGFloat                  childVcViewX;
@property (nonatomic, assign) CGFloat                  childVcViewY;


///装子控制器容器
@property (nonatomic ,weak  ) UIView                   *animationChangeView;
@property (nonatomic ,weak  ) UIViewController         *showVC;
@property (nonatomic ,strong) UIViewController         *contentVC;
@property (nonatomic, assign) int                      index;
@property (nonatomic, assign) NSInteger                newindex;
@property (nonatomic, assign) NSInteger                oldindex;
@property (nonatomic, assign) int                      titleIndex;
@property (nonatomic, assign) int                      titleCompareIndex;
@property (nonatomic, strong) NSMutableArray           *titleIndexArr;
@property (nonatomic, strong) NSMutableArray           *titleArr;
@property (nonatomic, assign) int                      btnIndex;
///顶部容器
@property (nonatomic, weak  ) UIView                   *viewTop;
@property (nonatomic, strong) UISwipeGestureRecognizer *recognizerLeft;
@property (nonatomic, strong) UISwipeGestureRecognizer *recognizerRight;

@property (nonatomic, assign) NSInteger                showChildViewVcIndex;
@end
typedef enum{
    ZWTopSelectButtonTypeHeadFirst=0,
    ZWTopSelectButtonTypeHeadSecond,
    ZWTopSelectButtonTypeHeadThird,
    ZWTopSelectButtonTypeHeadFourth,
    ZWTopSelectButtonTypeHeadFifth,
    ZWTopSelectButtonTypeHeadSixth,
    ZWTopSelectButtonTypeHeadSeventh,
    ZWTopSelectButtonTypeHeadEighth,
    ZWTopSelectButtonTypeHeadNinth
} ZWTopSelectButtonType;

@implementation ZWTopSelectVcView
/**
 *  开始ZWTopSelectVcViewUI绘制,必须实现！
 */
-(void)setupZWTopSelectVcViewUI
{
    
    [self setupContentVC];
    
    
    
    [self setupChildViewController];
    
    
    
    
}
//顶部按钮文字选中背景色设置
-(UIColor *)setupSliderViewSelectedTitleColor
{
    if ([self.dataSource respondsToSelector:@selector(topSliderViewSelectedTitleColorInZWTopSelectVcView:)]) {
        return  [self.dataSource topSliderViewSelectedTitleColorInZWTopSelectVcView:self];
    }else{
        return [UIColor redColor];}
}
//顶部按钮文字未选中背景色设置
-(UIColor *)setupSliderViewNotSelectedTitleColor
{
    if ([self.dataSource respondsToSelector:@selector(topSliderViewNotSelectedTitleColorInZWTopSelectVcView:)]) {
        return  [self.dataSource topSliderViewNotSelectedTitleColorInZWTopSelectVcView:self];
    }else{
        return [UIColor grayColor];}
}
//顶部按钮间隔线背景色设置
-(UIColor *)setupSliderLineSpacingColor
{
    if ([self.dataSource respondsToSelector:@selector(topSliderLineSpacingColorInZWTopSelectVcView:)]) {
        return  [self.dataSource topSliderLineSpacingColorInZWTopSelectVcView:self];
    }else{
        return [UIColor redColor];}
}
- (UIColor *)setupSliderViewBackGourndColor
{
    if ([self.dataSource respondsToSelector:@selector(topSliderViewBackGroundColorInZWTopSelectVcView:)]) {
        return  [self.dataSource topSliderViewBackGroundColorInZWTopSelectVcView:self];
    }else{
        return [UIColor redColor];}
}
- (UIColor *)setupTopViewBackGourndColor
{
    if ([self.dataSource respondsToSelector:@selector(topViewBackGroundColorInZWTopSelectVcView:)]) {
        return  [self.dataSource topViewBackGroundColorInZWTopSelectVcView:self];
    }else{
        return [UIColor whiteColor];}
}
-(CGFloat)setupTopViewHeight
{
    if ([self.dataSource respondsToSelector:@selector(topViewHeightInZWTopSelectVcView:)]) {
        return  [self.dataSource topViewHeightInZWTopSelectVcView:self];
    }else{
        return originalTopViewHeight;}
}
-(CGFloat)setupTopViewWidth
{
    if ([self.dataSource respondsToSelector:@selector(topViewWidthInZWTopSelectVcView:)]) {
        return  [self.dataSource topViewWidthInZWTopSelectVcView:self];
    }else{
        return self.frame.size.width;}
}

-(CGFloat)setupTopViewX
{
    if ([self.dataSource respondsToSelector:@selector(topViewXInZWTopSelectVcView:)]) {
        return  [self.dataSource topViewXInZWTopSelectVcView:self];
    }else{
        return 0;}
}

-(CGFloat)setupTopViewY
{
    if ([self.dataSource respondsToSelector:@selector(topViewYInZWTopSelectVcView:)]) {
        return  [self.dataSource topViewYInZWTopSelectVcView:self];
    }else{
        return 0;}
}

-(CGFloat)setupChildVcViewHeight
{
    if ([self.dataSource respondsToSelector:@selector(childVcViewHeightInZWTopSelectVcView:)]) {
        return  [self.dataSource childVcViewHeightInZWTopSelectVcView:self];
    }else{
        return self.frame.size.height;}
}
-(CGFloat)setupChildVcViewWidth
{
    if ([self.dataSource respondsToSelector:@selector(childVcViewWidthInZWTopSelectVcView:)]) {
        return  [self.dataSource childVcViewWidthInZWTopSelectVcView:self];
    }else{
        return self.frame.size.width;}
}

-(CGFloat)setupChildVcViewX
{
    if ([self.dataSource respondsToSelector:@selector(childVcViewXInZWTopSelectVcView:)]) {
        return  [self.dataSource childVcViewXInZWTopSelectVcView:self];
    }else{
        return 0;}
}

-(CGFloat)setupChildVcViewY
{
    if ([self.dataSource respondsToSelector:@selector(childVcViewYInZWTopSelectVcView:)]) {
        return  [self.dataSource childVcViewYInZWTopSelectVcView:self];
    }else{
        return  originalChildVcViewHeight;}
}
-(NSInteger)setupChildViewVcIndex
{
    if ([self.dataSource respondsToSelector:@selector(showChildViewVcIndexInZWTopSelectVcView:)]) {
        return [self.dataSource showChildViewVcIndexInZWTopSelectVcView:self];
    }else
    {
        return  0;
    }
}

-(NSInteger)setupChildViewVcIndexWithName
{
    if ([self.dataSource respondsToSelector:@selector(showChildViewVcNameInZWTopSelectVcView:)]) {
        
        UIViewController *tmpVc = [self.dataSource showChildViewVcNameInZWTopSelectVcView:self];
        if (tmpVc !=nil) {
            NSInteger index = -1;
            for (int i = 0; i<self.contentVC.childViewControllers.count; i++) {
                UIViewController *vc = self.contentVC.childViewControllers[i];
                
                if ([vc isKindOfClass:[tmpVc class]]) {
                    index = i;
                    if (vc == tmpVc) {
                        index = i;
                        break;
                    }
                }
            }
            return index;
        }else
        {
            return -1;
        }
        
    }else
    {
        return  -1;
    }
}

-(NSMutableArray *)titleIndexArr
{
    if (!_titleIndexArr) {
        _titleIndexArr=[NSMutableArray array];
    }
    return _titleIndexArr;
}
-(NSMutableArray *)titleArr
{
    if (!_titleArr) {
        _titleArr=[NSMutableArray array];
    }
    return _titleArr;
}
/**
 *  只要一步：设置添加控制器，只用加添就进入主控制器，就会动态的生成选择按钮，默认最大为九个
 */
-(void)setupChildViewController
{
    NSMutableArray *arr=  [self.dataSource totalControllerInZWTopSelectVcView:self];
    
    for (UIViewController *vc in arr) {
        [self.contentVC addChildViewController:vc];
        if (vc.title) {
            NSString *eachTitle=vc.title;
            [self.titleArr addObject:eachTitle];
            [self.titleIndexArr addObject:[NSNumber numberWithInt:(self.titleIndex)]];
        }
        self.titleIndex++;
    }
    
    self.index=(int)self.contentVC.childViewControllers.count;
    [self setupContentView];
    
    
    
}
/**
 *  重新加载数组刷新ZWTopSelectVcView
 *
 *
 *  @param 重新加载数组刷新ZWTopSelectVcView
 *
 *  @return 返回封装您的控制器的可变数组
 */
-(void)reloadWithChildControllerMutableArr:(NSMutableArray *)arr
{
    
    if (arr.count>0) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self setupContentVC];
        self.titleCompareIndex=0;
        self.titleIndex=0;
        self.oldindex=0;
        self.newindex=0;
        self.btnIndex=0;
        if (self.titleIndexArr.count>0) {
            [self.titleIndexArr removeAllObjects];
        }
        if (self.titleArr.count>0) {
            [self.titleArr removeAllObjects];
        }
        if (self.contentVC.childViewControllers.count>0) {
            for (UIViewController *vc in self.contentVC.childViewControllers) {
                [vc removeFromParentViewController];
            }
        }
        
        for (UIViewController *vc in arr) {
            [self.contentVC addChildViewController:vc];
            if (vc.title) {
                NSString *eachTitle=vc.title;
                [self.titleArr addObject:eachTitle];
                [self.titleIndexArr addObject:[NSNumber numberWithInt:(self.titleIndex)]];
            }
            self.titleIndex++;
        }
        
        self.index=(int)self.contentVC.childViewControllers.count;
        [self setupContentView];
    }
    
}
/**
 *  顶部选择按钮属性统一设置
 *
 *    优先级小于单个设置
 */
-(void)setupAllBtnState:(ZWTopSelectButton *)btn
{
    btn.labName.text=@"标题";
    btn.labName.font=[UIFont systemFontOfSize:14];
    if ([self.dataSource respondsToSelector:@selector(totalTopZWTopSelectButton:IntopSelectVcView:)]) {
        [self.dataSource totalTopZWTopSelectButton:btn IntopSelectVcView:self];
    }
    
}

/**
 *  其他设置
 */

-(void)setupContentVC
{
    UIViewController *contentVC=[[UIViewController alloc]init];
    //  contentVC.view.backgroundColor=[UIColor blueColor];
    [self addSubview:contentVC.view];
    self.contentVC=contentVC;
    self.contentVC.view.frame=CGRectMake(0, 0,self.frame.size.width, self.frame.size.height);
    
    //self.contentVC.view.backgroundColor=[UIColor redColor];
}
-(void)setupContentView
{
    [self setupViewTopContent];
    [self setupEachBtnContent];
    [self setupViewUnderContent];
    [self setupContentViewContent];
}
-(void)setupViewTopContent
{
    self.topViewHeight=[self setupTopViewHeight];
    self.topViewWidth = [self setupTopViewWidth];
    self.topViewX=[self setupTopViewX];
    self.topViewY=[self setupTopViewY];
    
    
    
    
    UIView *viewTop=[[UIView alloc]initWithFrame:CGRectMake(_topViewX, _topViewY, _topViewWidth, _topViewHeight)];
    viewTop.backgroundColor=[self setupTopViewBackGourndColor];
    [self addSubview:viewTop];
    viewTop.layer.cornerRadius=self.topViewCornerRadius?self.topViewCornerRadius:0;
    self.viewTop=viewTop;
    
    
}
-(void)setupEachBtnContent
{
    if (self.contentVC.childViewControllers.count>9) {
        
        return;
        
    }else{
        for (int i=0; i<self.contentVC.childViewControllers.count; i++) {
            switch (i) {
                case 0:
                {
                    ZWTopSelectButton *topViewFirstbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake(0,0, (_topViewWidth)/self.contentVC.childViewControllers.count, _topViewHeight)];
                    topViewFirstbtn.index=ZWTopSelectButtonTypeHeadFirst;
                    self.topViewFirstbtn=topViewFirstbtn;
                    [self setupBtnContentState:self.topViewFirstbtn index:i];
                    if (self.contentVC.childViewControllers.count-1==i) {
                        self.topViewFirstbtn.viewLine.hidden=YES;
                    }
                }
                    break;
                case 1:
                {
                    ZWTopSelectButton *topViewSecondbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake((_topViewWidth)/self.contentVC.childViewControllers.count*i,0, (_topViewWidth)/self.contentVC.childViewControllers.count, _topViewHeight)];
                    topViewSecondbtn.index=ZWTopSelectButtonTypeHeadSecond;
                    self.topViewSecondbtn=topViewSecondbtn;
                    [self setupBtnContentState:self.topViewSecondbtn  index:i];
                }
                    break;
                case 2:
                {
                    ZWTopSelectButton *topViewThirdbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake((_topViewWidth)/self.contentVC.childViewControllers.count*i,0, (_topViewWidth)/self.contentVC.childViewControllers.count, _topViewHeight)];
                    topViewThirdbtn.index=ZWTopSelectButtonTypeHeadThird;
                    self.topViewThirdbtn=topViewThirdbtn;
                    [self setupBtnContentState:self.topViewThirdbtn index:i];
                    
                }
                    break;
                case 3:
                {
                    ZWTopSelectButton *topViewFourthbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake((_topViewWidth)/self.contentVC.childViewControllers.count*i,0, (_topViewWidth)/self.contentVC.childViewControllers.count, _topViewHeight)];
                    topViewFourthbtn.index=ZWTopSelectButtonTypeHeadFourth;
                    self.topViewFourthbtn=topViewFourthbtn;
                    [self setupBtnContentState:self.topViewFourthbtn index:i];
                }
                    break;
                case 4:
                {
                    ZWTopSelectButton *topViewFifthbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake((_topViewWidth)/self.contentVC.childViewControllers.count*i,0, (_topViewWidth)/self.contentVC.childViewControllers.count, _topViewHeight)];
                    topViewFifthbtn.index=ZWTopSelectButtonTypeHeadFifth;
                    self.topViewFifthbtn=topViewFifthbtn;
                    [self setupBtnContentState:self.topViewFifthbtn index:i];
                }
                    break;
                case 5:
                {
                    ZWTopSelectButton *topViewSixthbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake((_topViewWidth)/self.contentVC.childViewControllers.count*i,0, (_topViewWidth)/self.contentVC.childViewControllers.count, _topViewHeight)];
                    topViewSixthbtn.index=ZWTopSelectButtonTypeHeadSixth;
                    self.topViewSixthbtn=topViewSixthbtn;
                    [self setupBtnContentState:self.topViewSixthbtn index:i];
                }
                    break;
                case 6:
                {
                    ZWTopSelectButton *topViewSeventhbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake((_topViewWidth)/self.contentVC.childViewControllers.count*i,0, (_topViewWidth)/self.contentVC.childViewControllers.count, _topViewHeight)];
                    topViewSeventhbtn.index=ZWTopSelectButtonTypeHeadSeventh;
                    self.topViewSeventhbtn=topViewSeventhbtn;
                    [self setupBtnContentState:self.topViewSeventhbtn index:i];
                }
                    break;
                case 7:
                {
                    ZWTopSelectButton *topViewEighthbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake((_topViewWidth)/self.contentVC.childViewControllers.count*i,0, (_topViewWidth)/self.contentVC.childViewControllers.count, _topViewHeight)];
                    topViewEighthbtn.index=ZWTopSelectButtonTypeHeadEighth;
                    self.topViewEighthbtn=topViewEighthbtn;
                    [self setupBtnContentState:self.topViewEighthbtn index:i];
                }
                    break;
                case 8:
                {
                    ZWTopSelectButton *topViewNinthbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake((_topViewWidth)/self.contentVC.childViewControllers.count*i,0, (_topViewWidth)/self.contentVC.childViewControllers.count, _topViewHeight)];
                    
                    topViewNinthbtn.index=ZWTopSelectButtonTypeHeadNinth;
                    self.topViewNinthbtn=topViewNinthbtn;
                    [self setupBtnContentState:self.topViewNinthbtn index:i];
                }
                    break;
                    
            }}
    }
    
}
-(void)setupViewUnderContent
{
    
    
    self.viewUnder=[[UIView alloc]initWithFrame:CGRectMake(0, (_topViewHeight)-2, (_topViewWidth)/self.contentVC.childViewControllers.count, 2)];
    self.viewUnder.backgroundColor=[self setupSliderViewBackGourndColor];
    [self.viewTop addSubview:_viewUnder];
    //  NSLog(@"%f -------",underViewInitHeight);
}

-(void)setupContentViewContent
{
    
    self.childVcViewHeight=[self setupChildVcViewHeight];
    self.childVcViewWidth= [self setupChildVcViewWidth];
    self.childVcViewX=[self setupChildVcViewX];
    self.childVcViewY=[self setupChildVcViewY];
    self.showChildViewVcIndex=[self setupChildViewVcIndexWithName];
    if (self.showChildViewVcIndex==-1) {
        self.showChildViewVcIndex = [self setupChildViewVcIndex];
    }
    if (self.showChildViewVcIndex) {
        [self setupSelcetedShowViewControllerWithIndex:self.showChildViewVcIndex];
        
    }
    
    
    UIView *animationChangeView=[[UIView alloc]initWithFrame:CGRectMake(self.childVcViewX,self.childVcViewY, self.childVcViewWidth,_childVcViewHeight)];
    [self.contentVC.view addSubview:animationChangeView];
    self.animationChangeView =animationChangeView;
    //  animationChangeView.backgroundColor=[UIColor redColor];
    
    
    
    if (self.contentVC.childViewControllers.count==0||self.contentVC.childViewControllers.count>9) {
        [self removeFromSuperview];
        
    }else
    {
        if (self.btnIndex>self.contentVC.childViewControllers.count) {
            return;
        }
        self.showVC=self.contentVC.childViewControllers[self.btnIndex];
        self.contentVC.childViewControllers[self.btnIndex].view.frame=self.animationChangeView.bounds;
        self.showVC.view.frame=self.animationChangeView.bounds;
        //self.showVC.view.backgroundColor=[UIColor clearColor];
        [self.animationChangeView addSubview:self.showVC.view];
        
        if (self.btnIndex == 0) {
            if (self.showVC.title) {
                self.topViewFirstbtn.labName.text=self.showVC.title;
            }
            [self.topViewFirstbtn setState:YES withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
        }
        
        
        [self setupShowVcRecognizer];
        
        if ([self.delegate respondsToSelector:@selector(topSelectVcView:didSelectVc:atIndex:)]) {
            [self.delegate topSelectVcView:self didSelectVc:self.showVC atIndex:self.btnIndex];
        }
        // NSLog(@"%d --init",self.btnIndex);
    }
}
-(void)setupBtnContentState:(ZWTopSelectButton *)btn index:(int)index
{
    
    [self setupAllBtnState:btn];
    for (NSNumber *titleIndex in self.titleIndexArr) {
        
        if (index ==[titleIndex intValue]) {
            //            NSLog(@"%d--[titleIndex intValue]-",[titleIndex intValue]);
            //            NSLog(@"%d--index-",index);
            //            NSLog(@"---------%D",self.titleCompareIndex);
            btn.labName.text=self.titleArr[self.titleCompareIndex];
            //                        NSLog(@"---------%@",self.titleArr[self.titleCompareIndex]);
            self.titleCompareIndex++;
        }
        
    }
    [self setupBtnState];
    [btn addTarget:self action:@selector(btnHeadClickType:) forControlEvents:UIControlEventTouchUpInside];
    if (self.contentVC.childViewControllers.count-1==index) {
        btn.viewLine.hidden=YES;
    }
    [self.viewTop addSubview:btn];
}
-(void)underViewMoveTo:(int)index withAnimation:(BOOL)isAnimation{
    if (isAnimation) {
        [UIView animateWithDuration:0.7 animations:^{
            self.viewUnder.frame=CGRectMake(index *((_topViewWidth)/self.index), (_topViewHeight)-2, (_topViewWidth)/self.index, 2);
        }];
    }else
    {
        self.viewUnder.frame=CGRectMake(index *((_topViewWidth)/self.index), (_topViewHeight)-2, (_topViewWidth)/self.index, 2);
    }
    
}

-(void)setupbtnSelectIndex:(int)btnSelectIndex withAnimation:(BOOL)isAnimation
{
    switch (btnSelectIndex) {
        case ZWTopSelectButtonTypeHeadFirst:
        {
            [self setupBtnState];
            [self.topViewFirstbtn setState:YES withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
            
            [self underViewMoveTo:0 withAnimation:isAnimation];
        }
            break;
        case ZWTopSelectButtonTypeHeadSecond:
        {
            [self setupBtnState];
            [self.topViewSecondbtn setState:YES withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
            [self underViewMoveTo:1 withAnimation:isAnimation];
        }
            break;
        case ZWTopSelectButtonTypeHeadThird:
        {
            [self setupBtnState];
            [self.topViewThirdbtn setState:YES withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
            [self underViewMoveTo:2 withAnimation:isAnimation];
        }
            break;
        case ZWTopSelectButtonTypeHeadFourth:
        {
            [self setupBtnState];
            [self.topViewFourthbtn setState:YES withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
            [self underViewMoveTo:3 withAnimation:isAnimation];
        }
            break;
        case ZWTopSelectButtonTypeHeadFifth:
        {
            [self setupBtnState];
            [self.topViewFifthbtn setState:YES withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
            [self underViewMoveTo:4 withAnimation:isAnimation];
        }
            break;
        case ZWTopSelectButtonTypeHeadSixth:
        {
            [self setupBtnState];
            [self.topViewSixthbtn setState:YES withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
            [self underViewMoveTo:5 withAnimation:isAnimation];
        }
            break;
        case ZWTopSelectButtonTypeHeadSeventh:
        {
            [self setupBtnState];
            [self.topViewSeventhbtn setState:YES withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
            [self underViewMoveTo:6 withAnimation:isAnimation];
        }
            break;
        case ZWTopSelectButtonTypeHeadEighth:
        {
            [self setupBtnState];
            [self.topViewEighthbtn setState:YES withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
            [self underViewMoveTo:7 withAnimation:isAnimation];
        }
            break;
        case ZWTopSelectButtonTypeHeadNinth:
        {
            [self setupBtnState];
            [self.topViewNinthbtn setState:YES withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
            [self underViewMoveTo:8 withAnimation:isAnimation];
        }
            break;
            
    }
    
}
-(void)btnHeadClickType:(ZWTopSelectButton *)btn
{
    self.btnIndex=(int)btn.index;
    [self.showVC.view removeFromSuperview];
    self.newindex=[btn.superview.subviews indexOfObject:btn];
    self.oldindex=[self.contentVC.childViewControllers indexOfObject:self.showVC];
    
    self.showVC=self.contentVC.childViewControllers[self.newindex];
    self.showVC.view.frame=self.animationChangeView.bounds;
    [self.animationChangeView addSubview:self.showVC.view];
    [self setupShowVcRecognizer];
    
    
    
    
    //  NSLog(@"%d --init222",self.btnIndex);
    
    
    [self setupActionState:self.isCloseAnimation];
    
    [self setupbtnSelectIndex:(int)btn.index withAnimation:YES];
    
    if ([self.delegate respondsToSelector:@selector(topSelectVcView:didSelectVc:atIndex:)]) {
        [self.delegate topSelectVcView:self didSelectVc:self.showVC atIndex:self.btnIndex];
    }
}
-(void)setupSelcetedShowViewControllerWithIndex:(NSInteger)index
{
    
    if (index>=0) {
        if (index>=self.contentVC.childViewControllers.count) {
            index = self.contentVC.childViewControllers.count -1;
            if (index < 0) {
                index = 0;
            }
        }
        
        for (ZWTopSelectButton *selectBtn in self.viewTop.subviews) {
            if ([selectBtn isKindOfClass:[ZWTopSelectButton class]]) {
                if (selectBtn.index==index) {
                    [self setupSelcetedShowClickTypes:selectBtn];
                    
                }
            }
            
        }
    }else
    {
        
    }
}
-(void)setupSelcetedShowClickTypes:(ZWTopSelectButton *)btn
{
    
    self.btnIndex=(int)btn.index;
    [self.showVC.view removeFromSuperview];
    self.newindex=[btn.superview.subviews indexOfObject:btn];
    self.oldindex=[self.contentVC.childViewControllers indexOfObject:self.showVC];
    
    self.showVC=self.contentVC.childViewControllers[self.newindex];
    
    self.showVC.view.frame=self.animationChangeView.bounds;
    [self.animationChangeView addSubview:self.showVC.view];
    [self setupShowVcRecognizer];
    
    
    
    [self setupbtnSelectIndex:(int)btn.index withAnimation:NO];
    
    if ([self.delegate respondsToSelector:@selector(topSelectVcView:didSelectVc:atIndex:)]) {
        [self.delegate topSelectVcView:self didSelectVc:self.showVC atIndex:self.btnIndex];
    }
}
//手势初始化
-(void)setupShowVcRecognizer
{
    if (self.isCloseSwipeGesture) {
        
    }else{
        self.recognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
        
        [self.recognizerLeft  setDirection:(UISwipeGestureRecognizerDirectionLeft)];
        
        [self.showVC.view addGestureRecognizer:self.recognizerLeft ];
        
        
        
        
        
        self.recognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
        
        [self.recognizerRight  setDirection:(UISwipeGestureRecognizerDirectionRight)];
        
        [self.showVC.view addGestureRecognizer:self.recognizerRight ];
    }
    
}
//手势实现内容
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    
    //如果往右滑
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
        self.btnIndex--;
        self.newindex--;
        if (self.newindex<0) {
            self.newindex=0;
        }
        if (self.btnIndex<0)
        {
            self.btnIndex=0;
            
        }else
        {
            [self.showVC.view removeFromSuperview];
            self.oldindex=[self.contentVC.childViewControllers indexOfObject:self.showVC];
            self.showVC=self.contentVC.childViewControllers[((self.btnIndex)?(self.btnIndex):0)];
            self.showVC.view.frame=self.animationChangeView.bounds;
            [self.animationChangeView addSubview:self.showVC.view];
            [self setupShowVcRecognizer];
            
            [self setupbtnSelectIndex:self.btnIndex withAnimation:YES];
            [self setupActionState:self.isCloseAnimation];
            // NSLog(@"%d --left",self.btnIndex);
            if ([self.delegate respondsToSelector:@selector(topSelectVcView:didSelectVc:atIndex:)]) {
                [self.delegate topSelectVcView:self didSelectVc:self.showVC atIndex:self.btnIndex];
            }
        }
    }
    
    
    
    
    //如果往左滑
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
        
        self.btnIndex++;
        self.newindex++;
        if (self.newindex>self.contentVC.childViewControllers.count-1) {
            self.newindex=(int)self.contentVC.childViewControllers.count-1;
        }
        if (self.btnIndex>self.contentVC.childViewControllers.count-1) {
            self.btnIndex=(int)self.contentVC.childViewControllers.count-1;
        }else{
            
            [self.showVC.view removeFromSuperview];
            self.oldindex=[self.contentVC.childViewControllers indexOfObject:self.showVC];
            self.showVC=self.contentVC.childViewControllers[((self.btnIndex)?(self.btnIndex):0)];
            self.showVC.view.frame=self.animationChangeView.bounds;
            [self.animationChangeView addSubview:self.showVC.view];
            [self setupShowVcRecognizer];
            
            [self setupbtnSelectIndex:self.btnIndex withAnimation:YES];
            [self setupActionState:self.isCloseAnimation];
            //  NSLog(@"%d --rigth",self.btnIndex);
            if ([self.delegate respondsToSelector:@selector(topSelectVcView:didSelectVc:atIndex:)]) {
                [self.delegate topSelectVcView:self didSelectVc:self.showVC atIndex:self.btnIndex];
            }
        }
    }
    
}

-(void)setupBtnState
{
    [self.topViewFirstbtn setState:NO withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
    [self.topViewSecondbtn setState:NO withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
    [self.topViewThirdbtn setState:NO withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
    [self.topViewFourthbtn setState:NO withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
    [self.topViewFifthbtn setState:NO withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
    [self.topViewSixthbtn setState:NO withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
    [self.topViewSeventhbtn setState:NO withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
    [self.topViewEighthbtn setState:NO withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
    [self.topViewNinthbtn setState:NO withSelectedColor:[self setupSliderViewSelectedTitleColor] withNotSelectedColor:[self setupSliderViewNotSelectedTitleColor] withViewLineColor:[self setupSliderLineSpacingColor]];
}
-(void)setupActionState:(BOOL)state{
    if (state==YES) {
        
        //[self.contentView.layer removeAnimationForKey:@"push"];
        [self.animationChangeView.layer removeAllAnimations];
    }else if(state==NO)
    {
        
        if (!self.animationType) {
            self.animationType=Push;
        }
        
        switch (self.animationType) {
            case Fade:
                [self transitionWithType:kCATransitionFade  ForView:self.animationChangeView];
                break;
                
            case Push:
                [self transitionWithType:kCATransitionPush  ForView:self.animationChangeView];
                break;
                
            case Reveal:
                [self transitionWithType:kCATransitionReveal  ForView:self.animationChangeView];
                break;
                
            case MoveIn:
                [self transitionWithType:kCATransitionMoveIn  ForView:self.animationChangeView];
                break;
                
            case Cube:
                [self transitionWithType:@"cube"  ForView:self.animationChangeView];
                break;
                
            case SuckEffect:
                [self transitionWithType:@"suckEffect"  ForView:self.animationChangeView];
                break;
                
            case OglFlip:
                [self transitionWithType:@"oglFlip"  ForView:self.animationChangeView];
                break;
                
            case RippleEffect:
                [self transitionWithType:@"rippleEffect"  ForView:self.animationChangeView];
                break;
                
            case PageCurl:
                [self transitionWithType:@"pageCurl"  ForView:self.animationChangeView];
                break;
                
            case PageUnCurl:
                [self transitionWithType:@"pageUnCurl"  ForView:self.animationChangeView];
                break;
                
            case CameraIrisHollowOpen:
                [self transitionWithType:@"cameraIrisHollowOpen"  ForView:self.animationChangeView];
                break;
                
            case CameraIrisHollowClose:
                [self transitionWithType:@"cameraIrisHollowClose"  ForView:self.animationChangeView];
                break;
            case CurlDown:
                [self animationWithView:self.animationChangeView WithAnimationTransition:UIViewAnimationTransitionCurlDown];
                break;
                
            case CurlUp:
                [self animationWithView:self.animationChangeView WithAnimationTransition:UIViewAnimationTransitionCurlUp];
                break;
                
            case FlipFromLeft:
                [self animationWithView:self.animationChangeView WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
                break;
                
            case FlipFromRight:
                [self animationWithView:self.animationChangeView WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
                
            default:
                break;
        }
        
    }
}
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:self.speedTime?self.speedTime:0.6 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}
- (void) transitionWithType:(NSString *) type  ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = self.speedTime?self.speedTime:0.6;
    
    //设置运动type
    animation.type = type;
    
    
    //设置子类
    animation.subtype = self.newindex>self.oldindex?kCATransitionFromLeft:kCATransitionFromRight;
    
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    
    [view.layer addAnimation:animation forKey:@"animation"];
}
@end



