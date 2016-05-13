//
//  ExampleViewController.m
//  ZWTopSelectVcView
//
//  Created by 流年划过颜夕 on 16/5/6.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//
#import "ZWTopSelectButton.h"
#import "ZWTopSelectVcView.h"


#import "ExampleViewController.h"
#import "OneTableViewController.h"
#import "TwoTableViewController.h"
#import "ThreeTableViewController.h"
#import "FourViewController.h"

@interface ExampleViewController ()<ZWTopSelectVcViewDelegate>
@property (nonatomic, weak) ZWTopSelectVcView *topSelectVcView;
@property (nonatomic, weak) ZWTopSelectVcView *topSelectVcView1;
@end

@implementation ExampleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"欢迎使用ZWTopSelectVcView";

    //第一步：初始化ZWTopSelectVcView，把其加入当前控制器view中
    ZWTopSelectVcView *topSelectVcView=[[ZWTopSelectVcView alloc]init];

   topSelectVcView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:topSelectVcView];
    self.topSelectVcView=topSelectVcView;
    
    //第二步：设置ZWTopSelectVcView的代理
    self.topSelectVcView.delegate=self;
    
    
    //第三步： 开始ZWTopSelectVcViewUI绘制,必须实现！
    [self.topSelectVcView setupZWTopSelectVcViewUI];
    
    
    

    
//    Fade = 1,                   //淡入淡出
//    Push,                       //推挤
//    Reveal,                     //揭开
//    MoveIn,                     //覆盖
//    Cube,                       //立方体
//    SuckEffect,                 //吮吸
//    OglFlip,                    //翻转
//    RippleEffect,               //波纹
//    PageCurl,                   //翻页
//    PageUnCurl,                 //反翻页
//    CameraIrisHollowOpen,       //开镜头
//    CameraIrisHollowClose,      //关镜头
//    CurlDown,                   //下翻页
//    CurlUp,                     //上翻页
//    FlipFromLeft,               //左翻转
//    FlipFromRight,              //右翻转
    
    //控制器切换动画时间
//    self.topSelectVcView.speedTime=1;
    //设置动画效果，默认为push
     self.topSelectVcView.animationType=8;
    //关闭动画效果
    // self.topSelectVcView.closeAnimation=YES;
    //隐藏底部滑块
//    self.topSelectVcView.viewUnder.hidden=YES;
    
    
    //单个设置(可选) ：通过topSelectVcView找到对应的单个顶部button，从左到右如,topViewFirstbtn，topViewSecondbtn,topViewThirdbtn,以此类推;
    //totalTopBtns.labName.font=[UIFont systemFontOfSize:20];
    [self setupSingleButton];
}
/**
 *   单个设置(可选) ：
 *   通过topSelectVcView找到对应的单个顶部button，从左到右如,topViewFirstbtn，topViewSecondbtn,topViewThirdbtn,以此类推;
 */
-(void)setupSingleButton
{
    //  优先级最高
    self.topSelectVcView.topViewFirstbtn.labName.text=@"标题一";
    self.topSelectVcView.topViewSecondbtn.labName.text=@"标题二";
}

#pragma mark - ZWTopSelectVcViewDelegate
#warning 只要一步且必须实现：传入您的各种控制器，用可变数组封装传入，就会动态的生成，默认最多能传入九个控制器
//初始化设置
-(NSMutableArray *)totalControllerInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
{

        NSMutableArray *controllerMutableArr=[NSMutableArray array];
        
        OneTableViewController *one= [[OneTableViewController alloc]init];
        one.title=@"欢迎";
        [controllerMutableArr addObject:one];
        
        TwoTableViewController *one1= [[TwoTableViewController alloc]init];
        one1.title=@"欢迎";
        [controllerMutableArr addObject:one1];
        
        //或者
        [controllerMutableArr addObject:[[ThreeTableViewController alloc]init]];
        [controllerMutableArr addObject:[[FourViewController alloc]init]];
        
        return controllerMutableArr;

}

#pragma mark - ZWTopSelectVcViewDelegate
#warning 单个设置顶部标题栏的优先级>初始化设置顶部标题栏>统一设置顶部标题栏的优先级
//统一设置 ：通过totalTopBtns修改顶部控件样式


//不修改,则为默认
-(void)totalTopZWTopSelectButton:(ZWTopSelectButton *)totalTopBtns IntopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
{
    

    // 优先级最低
    totalTopBtns.labName.text=@"欢迎";
    

}
//
//顶部topview高度
//-(CGFloat)topViewHeightInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
//{
//    return 60;
//}
///顶部topview宽度
//-(CGFloat)topViewWidthInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
//{
//    return 260;
//}
/////顶部topview X
//-(CGFloat)topViewXInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
//{
//    return  (self.view.frame.size.width-260)/2;
//}
//
/////顶部topview Y
//-(CGFloat)topViewYInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
//{
//    return  0;
//}
//
/////子控制器childVcViewY
//-(CGFloat)childVcViewYInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
//{
//    return 100;
//}
/////子控制器childVcViewX
//-(CGFloat)childVcViewXInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
//{
//    return  (self.view.frame.size.width-260)/2;
//}
/////子控制器childVcView高度
//-(CGFloat)childVcViewHeightInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
//{
//    return 200;
//}
///////子控制器childVcView宽度
//-(CGFloat)childVcViewWidthInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
//{
//    return 260;
//}
#pragma mark - ZWTopSelectButtonDelegate
//-(CGFloat)topSelectBtnHeightInZWTopSelectButtonDelegate:(ZWTopSelectButton *)topSelectButton
//{
//    return 60;
//}
@end
