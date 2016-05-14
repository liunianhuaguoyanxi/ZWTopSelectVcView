//
//  BaseTabBarController.m
//  MYFrameWork
//
//  Created by 流年划过颜夕 on 16/4/8.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "BaseTabBarController.h"
#import "FristNavigationController.h"
#import "ExampleViewController.h"
#import "ExampleSecondeViewController.h"
#import "ExampleThirdViewController.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    ExampleViewController *first=[[ExampleViewController alloc]init];
    [self addChildVc:first title:@"基本介绍" image:@"one" selectImage:nil];
    
    ExampleSecondeViewController *second=[[ExampleSecondeViewController alloc]init];
    [self addChildVc:second title:@"自定义展示" image:@"two" selectImage:nil];
    
    ExampleThirdViewController *third=[[ExampleThirdViewController alloc]init];
    [self addChildVc:third title:@"多视图展示" image:@"three" selectImage:nil];
}

/**
 *  ZWTabBarController封装
 *
 *  @param childVc       子控制器
 *  @param title         子控制器标题栏
 *  @param image         tabbar默认图片
 *  @param selectedImage tabbar点击状图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectedImage
{
    childVc.tabBarItem.title=title;
    childVc.tabBarItem.image=[UIImage imageNamed:image];
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=[UIColor blackColor];
    NSMutableDictionary *selectTextAttrs=[NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName]=[UIColor  orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    childVc.view.backgroundColor=UIColorFromRGB(0xe6e6e6);
    FristNavigationController *nav=[[FristNavigationController alloc]initWithRootViewController:childVc];
    nav.navigationBarHidden=NO;
    [self addChildViewController:nav];
}

@end
