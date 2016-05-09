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
#import "OneTableViewController.h"
#import "TwoTableViewController.h"
#import "ThreeTableViewController.h"
#import "ZWTopSelectVcView.h"
static const CGFloat topViewHeight=50;
@interface ZWTopSelectVcView();
@property (nonatomic, assign) CGFloat      topViewHeight;
@property (nonatomic ,weak  ) UIViewController *showVC;
@property (nonatomic ,strong) UIViewController *contentVC;
@property (nonatomic, assign) int              index;
@property (nonatomic, assign) NSInteger        newindex;
@property (nonatomic, assign) NSInteger        oldindex;
@property (nonatomic, assign) int             titleIndex;
@property (nonatomic, assign) int             titleCompareIndex;
@property (nonatomic, strong) NSMutableArray   *titleIndexArr;
@property (nonatomic, strong) NSMutableArray   *titleArr;
@end
typedef enum{
    ZWTopSelectButtonTypeHeadFirst,
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
-(CGFloat)setupTopViewHeight
{
    if ([self.delegate respondsToSelector:@selector(topViewHeightInZWTopSelectVcView:)]) {
        return  [self.delegate topViewHeightInZWTopSelectVcView:self];
    }else{
        return topViewHeight;}
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
    NSMutableArray *arr=  [self.delegate totalControllerInZWTopSelectVcView:self];
    
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
 *  顶部选择按钮属性统一设置
 *
 *    优先级小于单个设置
 */
-(void)setupAllBtnState:(ZWTopSelectButton *)btn
{
    btn.labName.text=@"标题";
    btn.labName.font=[UIFont systemFontOfSize:14];
    if ([self.delegate respondsToSelector:@selector(totalTopZWTopSelectButton:IntopSelectVcView:)]) {
        [self.delegate totalTopZWTopSelectButton:btn IntopSelectVcView:self];
    }
    
}

/**
 *  其他设置
 */
-(void)setupContentVC
{
    UIViewController *contentVC=[[UIViewController alloc]init];
    [self addSubview:contentVC.view];
    self.contentVC=contentVC;
    self.contentVC.view.frame=CGRectMake(0, 0,self.frame.size.width, self.frame.size.height);
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
    //    UIView *viewTop=[[UIView alloc]initWithFrame:CGRectMake(0, NavigationBar_HEIGHT+20, self.frame.size.width, topViewHeight)];
    self.topViewHeight=[self setupTopViewHeight];
    UIView *viewTop=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.topViewHeight)];
    viewTop.backgroundColor=[UIColor whiteColor];
    [self addSubview:viewTop];
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
                    ZWTopSelectButton *topViewFirstbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake(0,0, self.frame.size.width/self.contentVC.childViewControllers.count, self.topViewHeight)];
                    topViewFirstbtn.tag=ZWTopSelectButtonTypeHeadFirst;
                    self.topViewFirstbtn=topViewFirstbtn;
                    [self setupBtnContentState:self.topViewFirstbtn index:i];
                    if (self.contentVC.childViewControllers.count-1==i) {
                        self.topViewFirstbtn.viewLine.hidden=YES;
                    }
                }
                    break;
                case 1:
                {
                    ZWTopSelectButton *topViewSecondbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake(self.frame.size.width/self.contentVC.childViewControllers.count*i,0, self.frame.size.width/self.contentVC.childViewControllers.count, self.topViewHeight)];
                    topViewSecondbtn.tag=ZWTopSelectButtonTypeHeadSecond;
                    self.topViewSecondbtn=topViewSecondbtn;
                    [self setupBtnContentState:self.topViewSecondbtn  index:i];
                }
                    break;
                case 2:
                {
                    ZWTopSelectButton *topViewThirdbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake(self.frame.size.width/self.contentVC.childViewControllers.count*i,0, self.frame.size.width/self.contentVC.childViewControllers.count, self.topViewHeight)];
                    topViewThirdbtn.tag=ZWTopSelectButtonTypeHeadThird;
                    self.topViewThirdbtn=topViewThirdbtn;
                    [self setupBtnContentState:self.topViewThirdbtn index:i];

                }
                    break;
                case 3:
                {
                    ZWTopSelectButton *topViewFourthbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake(self.frame.size.width/self.contentVC.childViewControllers.count*i,0, self.frame.size.width/self.contentVC.childViewControllers.count, self.topViewHeight)];
                    topViewFourthbtn.tag=ZWTopSelectButtonTypeHeadFourth;
                    self.topViewFourthbtn=topViewFourthbtn;
                    [self setupBtnContentState:self.topViewFourthbtn index:i];
                }
                    break;
                case 4:
                {
                    ZWTopSelectButton *topViewFifthbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake(self.frame.size.width/self.contentVC.childViewControllers.count*i,0, self.frame.size.width/self.contentVC.childViewControllers.count, self.topViewHeight)];
                    topViewFifthbtn.tag=ZWTopSelectButtonTypeHeadFifth;
                    self.topViewFifthbtn=topViewFifthbtn;
                    [self setupBtnContentState:self.topViewFifthbtn index:i];
                }
                    break;
                case 5:
                {
                    ZWTopSelectButton *topViewSixthbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake(self.frame.size.width/self.contentVC.childViewControllers.count*i,0, self.frame.size.width/self.contentVC.childViewControllers.count, self.topViewHeight)];
                    topViewSixthbtn.tag=ZWTopSelectButtonTypeHeadSixth;
                    self.topViewSixthbtn=topViewSixthbtn;
                    [self setupBtnContentState:self.topViewSixthbtn index:i];
                }
                    break;
                case 6:
                {
                    ZWTopSelectButton *topViewSeventhbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake(self.frame.size.width/self.contentVC.childViewControllers.count*i,0, self.frame.size.width/self.contentVC.childViewControllers.count, self.topViewHeight)];
                    topViewSeventhbtn.tag=ZWTopSelectButtonTypeHeadSeventh;
                    self.topViewSeventhbtn=topViewSeventhbtn;
                    [self setupBtnContentState:self.topViewSeventhbtn index:i];
                }
                    break;
                case 7:
                {
                    ZWTopSelectButton *topViewEighthbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake(self.frame.size.width/self.contentVC.childViewControllers.count*i,0, self.frame.size.width/self.contentVC.childViewControllers.count, self.topViewHeight)];
                    topViewEighthbtn.tag=ZWTopSelectButtonTypeHeadEighth;
                    self.topViewEighthbtn=topViewEighthbtn;
                    [self setupBtnContentState:self.topViewEighthbtn index:i];
                }
                    break;
                case 8:
                {
                    ZWTopSelectButton *topViewNinthbtn=[[ZWTopSelectButton alloc]initWithFrame:CGRectMake(self.frame.size.width/self.contentVC.childViewControllers.count*i,0, self.frame.size.width/self.contentVC.childViewControllers.count, self.topViewHeight)];

                    topViewNinthbtn.tag=ZWTopSelectButtonTypeHeadNinth;
                    self.topViewNinthbtn=topViewNinthbtn;
                    [self setupBtnContentState:self.topViewNinthbtn index:i];
                }
                    break;
                    
            }}
    }
    
}
-(void)setupViewUnderContent
{


    self.viewUnder=[[UIView alloc]initWithFrame:CGRectMake(0, (self.topViewHeight)-2, self.frame.size.width/self.contentVC.childViewControllers.count, 2)];
    self.viewUnder.backgroundColor=[UIColor redColor];
    [self.viewTop addSubview:_viewUnder];
      //  NSLog(@"%f -------",underViewInitHeight);
}

-(void)setupContentViewContent
{
    // UIView *contentView=[[UIView alloc]initWithFrame:CGRectMake(0, NavigationBar_HEIGHT+70, self.frame.size.width, self.frame.size.height-64)];
    UIView *contentView=[[UIView alloc]initWithFrame:CGRectMake(0,self.topViewHeight, self.frame.size.width, self.frame.size.height-64)];
    [self.contentVC.view addSubview:contentView];
    self.contentView=contentView;
    //self.contentView.backgroundColor=[UIColor yellowColor];
    
    if (self.contentVC.childViewControllers.count==0||self.contentVC.childViewControllers.count>9) {
        [self removeFromSuperview];
        
    }else
    {
        self.showVC=self.contentVC.childViewControllers[0];
        self.showVC.view.frame=self.contentView.bounds;
        //self.showVC.view.backgroundColor=[UIColor clearColor];
        if (self.showVC.title) {
            self.topViewFirstbtn.labName.text=self.showVC.title;
        }
        [self.topViewFirstbtn setState:YES];
        [self.contentView addSubview:self.showVC.view];
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
    
    [btn addTarget:self action:@selector(btnHeadClickType:) forControlEvents:UIControlEventTouchUpInside];
    if (self.contentVC.childViewControllers.count-1==index) {
        btn.viewLine.hidden=YES;
    }
    [self.viewTop addSubview:btn];
}
-(void)underViewMoveTo:(int)index{
    self.topViewHeight=[self setupTopViewHeight];
    [UIView animateWithDuration:0.7 animations:^{
        self.viewUnder.frame=CGRectMake(index *(self.frame.size.width/self.index), (self.topViewHeight)-2, self.frame.size.width/self.index, 2);
    }];
}

-(void)btnHeadClickType:(ZWTopSelectButton *)btn
{
    
    [self.showVC.view removeFromSuperview];
    self.newindex=[btn.superview.subviews indexOfObject:btn];
    self.oldindex=[self.contentVC.childViewControllers indexOfObject:self.showVC];
    
    
    self.showVC=self.contentVC.childViewControllers[self.newindex];
    self.showVC.view.frame=self.contentView.bounds;
    [self.contentView addSubview:self.showVC.view];
    [self setupActionState:self.closeAnimation];
    
    switch (btn.tag) {
        case ZWTopSelectButtonTypeHeadFirst:
        {
            [self setupBtnState];
            [self.topViewFirstbtn setState:YES];
            [self underViewMoveTo:0];
        }
            break;
        case ZWTopSelectButtonTypeHeadSecond:
        {
            [self setupBtnState];
            [self.topViewSecondbtn setState:YES];
            [self underViewMoveTo:1];
        }
            break;
        case ZWTopSelectButtonTypeHeadThird:
        {
            [self setupBtnState];
            [self.topViewThirdbtn setState:YES];
            [self underViewMoveTo:2];
        }
            break;
        case ZWTopSelectButtonTypeHeadFourth:
        {
            [self setupBtnState];
            [self.topViewFourthbtn setState:YES];
            [self underViewMoveTo:3];
        }
            break;
        case ZWTopSelectButtonTypeHeadFifth:
        {
            [self setupBtnState];
            [self.topViewFifthbtn setState:YES];
            [self underViewMoveTo:4];
        }
            break;
        case ZWTopSelectButtonTypeHeadSixth:
        {
            [self setupBtnState];
            [self.topViewSixthbtn setState:YES];
            [self underViewMoveTo:5];
        }
            break;
        case ZWTopSelectButtonTypeHeadSeventh:
        {
            [self setupBtnState];
            [self.topViewSeventhbtn setState:YES];
            [self underViewMoveTo:6];
        }
            break;
        case ZWTopSelectButtonTypeHeadEighth:
        {
            [self setupBtnState];
            [self.topViewEighthbtn setState:YES];
            [self underViewMoveTo:7];
        }
            break;
        case ZWTopSelectButtonTypeHeadNinth:
        {
            [self setupBtnState];
            [self.topViewNinthbtn setState:YES];
            [self underViewMoveTo:8];
        }
            break;
            
    }
    
}
-(void)setupBtnState
{
    [self.topViewFirstbtn setState:NO];
    [self.topViewSecondbtn setState:NO];
    [self.topViewThirdbtn setState:NO];
    [self.topViewFourthbtn setState:NO];
    [self.topViewFifthbtn setState:NO];
    [self.topViewSixthbtn setState:NO];
    [self.topViewSeventhbtn setState:NO];
    [self.topViewEighthbtn setState:NO];
    [self.topViewNinthbtn setState:NO];
}
-(void)setupActionState:(BOOL)state{
    if (state==YES) {
        
        //[self.contentView.layer removeAnimationForKey:@"push"];
        [self.contentView.layer removeAllAnimations];
    }else if(state==NO)
    {

        
        [self transitionWithType:kCATransitionPush  ForView:self.contentView];
        AnimationType animationType = self.animationType ? self.animationType : Push;
        
        switch (animationType) {
            case Fade:
                [self transitionWithType:kCATransitionFade  ForView:self.contentView];
                break;
                
            case Push:
                [self transitionWithType:kCATransitionPush  ForView:self.contentView];
                break;
                
            case Reveal:
                [self transitionWithType:kCATransitionReveal  ForView:self.contentView];
                break;
                
            case MoveIn:
                [self transitionWithType:kCATransitionMoveIn  ForView:self.contentView];
                break;
                
            case Cube:
                [self transitionWithType:@"cube"  ForView:self.contentView];
                break;
                
            case SuckEffect:
                [self transitionWithType:@"suckEffect"  ForView:self.contentView];
                break;
                
            case OglFlip:
                [self transitionWithType:@"oglFlip"  ForView:self.contentView];
                break;
                
            case RippleEffect:
                [self transitionWithType:@"rippleEffect"  ForView:self.contentView];
                break;
                
            case PageCurl:
                [self transitionWithType:@"pageCurl"  ForView:self.contentView];
                break;
                
            case PageUnCurl:
                [self transitionWithType:@"pageUnCurl"  ForView:self.contentView];
                break;
                
            case CameraIrisHollowOpen:
                [self transitionWithType:@"cameraIrisHollowOpen"  ForView:self.contentView];
                break;
                
            case CameraIrisHollowClose:
                [self transitionWithType:@"cameraIrisHollowClose"  ForView:self.contentView];
                break;
            case CurlDown:
                [self animationWithView:self.contentView WithAnimationTransition:UIViewAnimationTransitionCurlDown];
                break;
                
            case CurlUp:
                [self animationWithView:self.contentView WithAnimationTransition:UIViewAnimationTransitionCurlUp];
                break;
                
            case FlipFromLeft:
                [self animationWithView:self.contentView WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
                break;
                
            case FlipFromRight:
                [self animationWithView:self.contentView WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];

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



