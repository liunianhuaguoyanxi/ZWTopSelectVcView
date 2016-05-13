//
//  SecondThreeViewController.m
//  ZWTopSelectVcView
//
//  Created by 流年划过颜夕 on 16/5/13.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//

#import "SecondThreeViewController.h"


@interface SecondThreeViewController ()

@end

@implementation SecondThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame=CGRectMake(self.view.frame.size.width/2+10, 0, self.view.frame.size.width/2-10, self.view.frame.size.height);
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIImageView *imgView=[[UIImageView alloc]init];
    [imgView setImage:[UIImage imageNamed:@"dabai"]];
     imgView.frame=CGRectMake(0, 0 ,self.view.frame.size.width, self.view.frame.size.height/4);
    [self.view addSubview:imgView];
    
    UILabel *seelabel=[[UILabel alloc]init];
    seelabel.text=@"我是大白";
    seelabel.textAlignment=NSTextAlignmentCenter;
    seelabel.font=[UIFont systemFontOfSize:16];
    seelabel.frame=CGRectMake(0, self.view.frame.size.height/4+40, self.view.frame.size.width, 20);
    [self.view addSubview:seelabel];
    
    UILabel *seenamelabel=[[UILabel alloc]init];
    seenamelabel.text=@"流年划过颜夕";
    seenamelabel.textAlignment=NSTextAlignmentCenter;
    seenamelabel.font=[UIFont systemFontOfSize:16];
    seenamelabel.frame=CGRectMake(0, self.view.frame.size.height/4+80, self.view.frame.size.width, 20);
    [self.view addSubview:seenamelabel];
    
    UILabel *see1label=[[UILabel alloc]init];
    see1label.text=@"框架在持续更新中";
    see1label.textAlignment=NSTextAlignmentCenter;
    see1label.font=[UIFont systemFontOfSize:16];
    see1label.frame=CGRectMake(0, self.view.frame.size.height/4+120, self.view.frame.size.width, 20);
    [self.view addSubview:see1label];
    
    UILabel *see2label=[[UILabel alloc]init];
    see2label.text=@"需要大家一起来温暖";
    see2label.textAlignment=NSTextAlignmentCenter;
    see2label.font=[UIFont systemFontOfSize:16];
    see2label.frame=CGRectMake(0, self.view.frame.size.height/4+160, self.view.frame.size.width, 20);
    [self.view addSubview:see2label];
    
    UILabel *label1=[[UILabel alloc]init];
    label1.text=@"工作联系方式";
    label1.textAlignment=NSTextAlignmentCenter;
    label1.frame=CGRectMake(0, self.view.frame.size.height/4+200 ,self.view.frame.size.width, 20);
    label1.font=[UIFont systemFontOfSize:13];
    [self.view addSubview:label1];
    
    UILabel *label2=[[UILabel alloc]init];
    label2.text=@"liunianhuaguoyanxi@163.com";
    label2.textAlignment=NSTextAlignmentCenter;
    label2.frame=CGRectMake(0, self.view.frame.size.height/4+240 ,self.view.frame.size.width, 20);
    label2.font=[UIFont systemFontOfSize:10];
    label2.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:label2];
    
}



@end
