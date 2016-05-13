//
//  ShowOneViewController.m
//  ZWTopSelectVcView
//
//  Created by 流年划过颜夕 on 16/5/13.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//

#import "ShowOneViewController.h"

@interface ShowOneViewController ()

@end

@implementation ShowOneViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //设置view的frame
    self.view.backgroundColor=[UIColor whiteColor];
    self.view.frame=CGRectMake((self.view.frame.size.width-260)/2, 200, 260, 200);

    
    
    
    
    //使用方法
    UILabel *textView=[[UILabel alloc]init];
    textView.frame=CGRectMake(0, 20, 260, 20);
    textView.text=@"自定义尺寸设置方法";
    textView.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:textView];
    
    UITextView *textContentView=[[UITextView alloc]init];
    textContentView.frame=CGRectMake(0, 40, 260, 60);
    textContentView.text=@"1. 在代理中设置topView和childView的尺寸";
    textContentView.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:textContentView];
    
    UITextView *textContentView2=[[UITextView alloc]init];
    textContentView2.frame=CGRectMake(0, 100, 260, 60);
    textContentView2.text=@"2. 在你的子控制器中设置它的frame，与第一步中childView的尺寸一样";
    textContentView2.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:textContentView2];
    

}



@end
