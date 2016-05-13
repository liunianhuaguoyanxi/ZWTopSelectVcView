//
//  FirstTwoViewController.m
//  ZWTopSelectVcView
//
//  Created by 流年划过颜夕 on 16/5/13.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//

#import "FirstTwoViewController.h"

@interface FirstTwoViewController ()

@end

@implementation FirstTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame=CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height);
    self.view.backgroundColor=[UIColor orangeColor];
    
    //框架优点
    UILabel *textView=[[UILabel alloc]init];
    textView.frame=CGRectMake(0, 20, self.view.frame.size.width, 20);
    textView.text=@"框架优点";
    textView.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:textView];
    
    UITextView *textContentView=[[UITextView alloc]init];
    textContentView.frame=CGRectMake(0, 70, self.view.frame.size.width, 50);
    textContentView.text=@"1. 能进行快速发开，效率高";
    textContentView.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:textContentView];
    
    UITextView *textContentView2=[[UITextView alloc]init];
    textContentView2.frame=CGRectMake(0, 130, self.view.frame.size.width, 70);
    textContentView2.text=@"2.只需遵守协议实现代理方法即可，无其他框架渗入，低耦合";
    textContentView2.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:textContentView2];
    
    UITextView *textContentView3=[[UITextView alloc]init];
    textContentView3.frame=CGRectMake(0, 210, self.view.frame.size.width, 70);
    textContentView3.text=@"3.层级关系简单，待显示的控制器不会在底层堆积，性能好";
    textContentView3.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:textContentView3];

    
    UITextView *textContentView4=[[UITextView alloc]init];
    textContentView4.frame=CGRectMake(0, 330, self.view.frame.size.width, 70);
    textContentView4.text=@"     框架会继续更新，如发现任何问题或有其他事情，请联系我哟~";
    textContentView4.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:textContentView4];
    
}



@end
