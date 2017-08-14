//
//  FourViewController.m
//  ZWSlideViewController
//
//  Created by 流年划过颜夕 on 16/5/5.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#import "FourViewController.h"


@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.preferredContentSize=CGSizeMake(kScreenWidth, kScreenHeight);
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIImageView *imgView=[[UIImageView alloc]init];
    [imgView setImage:[UIImage imageNamed:@"dabaibai"]];
    imgView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2);
    [self.view addSubview:imgView];
    
    
    UILabel *label=[[UILabel alloc]init];
    label.text=@"liunianhuaguoyanxi@163.com";
    label.textAlignment=NSTextAlignmentCenter;
    label.frame=CGRectMake(0, self.view.frame.size.height/2+40 ,self.view.frame.size.width, 20);
    [self.view addSubview:label];
    
    UILabel *weblabel=[[UILabel alloc]init];
    weblabel.text=@"https://github.com/liunianhuaguoyanxi";
    weblabel.textAlignment=NSTextAlignmentCenter;
    weblabel.frame=CGRectMake(0, self.view.frame.size.height/2+80, self.view.frame.size.width, 20);
    [self.view addSubview:weblabel];
    


    
    UILabel *seelabel=[[UILabel alloc]init];
    seelabel.text=@"我是大白，框架在持续更新中，需要大家来温暖...";
    seelabel.textAlignment=NSTextAlignmentCenter;
    seelabel.font=[UIFont systemFontOfSize:16];
    seelabel.frame=CGRectMake(0, self.view.frame.size.height/2+120, self.view.frame.size.width, 20);
    [self.view addSubview:seelabel];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"1");

    UIWebView *webView=[[UIWebView alloc]initWithFrame:CGRectMake(0,0,kScreenWidth , kScreenHeight)];
        self.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:webView];

        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com/liunianhuaguoyanxi"]]];


    

}

@end
