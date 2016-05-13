//
//  FirstOneViewController.m
//  ZWTopSelectVcView
//
//  Created by 流年划过颜夕 on 16/5/13.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//

#import "FirstOneViewController.h"

@interface FirstOneViewController ()

@end

@implementation FirstOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame=CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height);
    self.view.backgroundColor=[UIColor yellowColor];
    
    
    //使用方法
    UILabel *textView=[[UILabel alloc]init];
    textView.frame=CGRectMake(0, 20, self.view.frame.size.width, 20);
    textView.text=@"多个view设置方法";
    textView.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:textView];
    
    UITextView *textContentView=[[UITextView alloc]init];
    textContentView.frame=CGRectMake(0, 100, self.view.frame.size.width, 70);
    textContentView.text=@"1. 主控制器中初始化需要的多个ZWTopSelectVcView";
    textContentView.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:textContentView];
    
    UITextView *textContentView2=[[UITextView alloc]init];
    textContentView2.frame=CGRectMake(0, 210, self.view.frame.size.width, 110);
    textContentView2.text=@"2. 在你的子控制器中设置它的frame与第一步中初始化ZWTopSelectVcView对应的尺寸一样";
    textContentView2.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:textContentView2];
}



@end
