//
//  ExampleThirdViewController.m
//  ZWTopSelectVcView
//
//  Created by 流年划过颜夕 on 16/5/13.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//

#import "ExampleThirdViewController.h"



#import "ZWTopSelectButton.h"
#import "ZWTopSelectVcView.h"
#import "FirstOneViewController.h"
#import "FourViewController.h"
#import "FirstTwoViewController.h"
#import "ThreeTableViewController.h"
#import "SecondOneTableViewController.h"
#import "SecondTwoTableViewController.h"
#import "SecondThreeViewController.h"




@interface ExampleThirdViewController ()<ZWTopSelectVcViewDelegate>
@property (nonatomic, weak) ZWTopSelectVcView *topSelectVcView1;
@property (nonatomic, weak) ZWTopSelectVcView *topSelectVcView2;
@end

@implementation ExampleThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
// 第一个ZWTopSelectVcView
    ZWTopSelectVcView *topSelectVcView1=[[ZWTopSelectVcView alloc]init];
    
    topSelectVcView1.frame=CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height);
    [self.view addSubview:topSelectVcView1];
    self.topSelectVcView1=topSelectVcView1;
    
    self.topSelectVcView1.delegate=self;
    
    [self.topSelectVcView1 setupZWTopSelectVcViewUI];
    
    self.topSelectVcView1.animationType=8;
    
    self.topSelectVcView1.topViewFirstbtn.labName.text=@"1.设置方法";
    self.topSelectVcView1.topViewSecondbtn.labName.text=@"2.框架优点";
    
    
// 第二个ZWTopSelectVcView
    ZWTopSelectVcView *topSelectVcView2=[[ZWTopSelectVcView alloc]init];
    
    topSelectVcView2.frame=CGRectMake(self.view.frame.size.width/2+10, 0, self.view.frame.size.width/2-10, self.view.frame.size.height);
    [self.view addSubview:topSelectVcView2];
    self.topSelectVcView2=topSelectVcView2;
    
    self.topSelectVcView2.delegate=self;
    
    [self.topSelectVcView2 setupZWTopSelectVcViewUI];
    
    self.topSelectVcView2.animationType=7;
    
    self.topSelectVcView2.topViewFirstbtn.labName.text=@"一";
    self.topSelectVcView2.topViewSecondbtn.labName.text=@"二";
    self.topSelectVcView2.topViewThirdbtn.labName.text=@"三";
    
}


#pragma mark - ZWTopSelectVcViewDelegate

//初始化设置
-(NSMutableArray *)totalControllerInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
{
    
    if (topSelectVcView==self.topSelectVcView1) {
        NSMutableArray *controllerMutableArr=[NSMutableArray array];
        
        [controllerMutableArr addObject:[[FirstOneViewController alloc]init]];
        [controllerMutableArr addObject:[[FirstTwoViewController alloc]init]];
        
        return controllerMutableArr;

    }
    
     if(topSelectVcView==self.topSelectVcView2)
    {      NSMutableArray *controllerMutableArr=[NSMutableArray array];
    
    [controllerMutableArr addObject:[[SecondOneTableViewController alloc]init]];
    [controllerMutableArr addObject:[[SecondTwoTableViewController alloc]init]];
    [controllerMutableArr addObject:[[SecondThreeViewController alloc]init] ];
        
        
    return controllerMutableArr;
    }
     else
    {
        return nil;
    }

}


@end


