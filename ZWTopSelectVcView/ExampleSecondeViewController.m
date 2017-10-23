//
//  ExampleSecondeViewController.m
//  ZWTopSelectVcView
//
//  Created by 流年划过颜夕 on 16/5/13.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//


#import "ZWTopSelectButton.h"
#import "ZWTopSelectVcView.h"


#import "ExampleSecondeViewController.h"
#import "OneTableViewController.h"
#import "ShowOneViewController.h"
#import "ShowTwoTableViewController.h"
#import "ShowThreeTableViewController.h"

@interface ExampleSecondeViewController ()<ZWTopSelectVcViewDelegate>
{
    BOOL isChangeChildVc;
}
@property (nonatomic, weak) ZWTopSelectVcView *topSelectVcView;
@property (nonatomic, weak) ZWTopSelectVcView *topSelectVcView1;
@end

@implementation ExampleSecondeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    ZWTopSelectVcView *topSelectVcView=[[ZWTopSelectVcView alloc]init];

    topSelectVcView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:topSelectVcView];
    self.topSelectVcView=topSelectVcView;
    
    self.topSelectVcView.delegate=self;
    
    
    [self.topSelectVcView setupZWTopSelectVcViewUI];


    self.topSelectVcView.animationType=5;

    
    UIButton *reloadBtn=[UIButton buttonWithType:0];
    reloadBtn.frame=CGRectMake((self.view.frame.size.width-140)/2, 350, 140, 40);
    [reloadBtn setTitle:@"刷新子控制器" forState:0];
    reloadBtn.backgroundColor=[UIColor redColor];
    [reloadBtn addTarget:self action:@selector(clickToReload) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reloadBtn];
}

-(void)clickToReload
{
    if (isChangeChildVc!=YES) {
        isChangeChildVc=YES;
        NSMutableArray *controllerMutableArr=[NSMutableArray array];
        
        ShowOneViewController *showoneVc= [[ShowOneViewController alloc]init];
        showoneVc.title=@"设置方法";
        [controllerMutableArr addObject:showoneVc];
        
        ShowTwoTableViewController *showtwoVc= [[ ShowTwoTableViewController alloc]init];
        showtwoVc.title=@"欢迎使用";
        [controllerMutableArr addObject:showtwoVc];
        
        ShowThreeTableViewController *showthreeVc= [[ ShowThreeTableViewController alloc]init];
        showthreeVc.title=@"添加刷新";
        [controllerMutableArr addObject:showthreeVc];
        
        [self.topSelectVcView  reloadWithChildControllerMutableArr:controllerMutableArr];
        
    }
    else
    {
        isChangeChildVc=NO;
        
        NSMutableArray *controllerMutableArr=[NSMutableArray array];
        
        ShowOneViewController *showoneVc= [[ShowOneViewController alloc]init];
        showoneVc.title=@"设置方法";
        [controllerMutableArr addObject:showoneVc];
        
        ShowTwoTableViewController *showtwoVc= [[ ShowTwoTableViewController alloc]init];
        showtwoVc.title=@"欢迎使用";
        [controllerMutableArr addObject:showtwoVc];
        
        [self.topSelectVcView  reloadWithChildControllerMutableArr:controllerMutableArr];


    }
    
}

#pragma mark - ZWTopSelectVcViewDelegate
//初始化设置
-(NSMutableArray *)totalControllerInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
{
    
    NSMutableArray *controllerMutableArr=[NSMutableArray array];
    
    ShowOneViewController *showoneVc= [[ShowOneViewController alloc]init];
    showoneVc.title=@"设置方法";
    [controllerMutableArr addObject:showoneVc];
    
    ShowTwoTableViewController *showtwoVc= [[ ShowTwoTableViewController alloc]init];
    showtwoVc.title=@"欢迎使用";
    [controllerMutableArr addObject:showtwoVc];
    
    
    return controllerMutableArr;
    
}

///顶部topview高度
-(CGFloat)topViewHeightInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
{
    return 60;
}
///顶部topview宽度
-(CGFloat)topViewWidthInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
{
    return 260;
}
///顶部topview X
-(CGFloat)topViewXInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
{
    return  (self.view.frame.size.width-260)/2;
}

///顶部topview Y
-(CGFloat)topViewYInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
{
    return  20;
}

///子控制器childVcViewY
-(CGFloat)childVcViewYInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
{
    return 100;
}
///子控制器childVcViewX
-(CGFloat)childVcViewXInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
{
    return  (self.view.frame.size.width-260)/2;
}
///子控制器childVcView高度
-(CGFloat)childVcViewHeightInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
{
    return 200;
}
/////子控制器childVcView宽度
-(CGFloat)childVcViewWidthInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
{
    return 260;
}

//（可选）显示第几个子控制器，默认为第一个
//-(NSInteger)showChildViewVcIndexInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
//{
//    return 3;
//}
@end


