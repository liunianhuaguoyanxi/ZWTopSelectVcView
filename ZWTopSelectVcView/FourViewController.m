//
//  FourViewController.m
//  ZWSlideViewController
//
//  Created by 流年划过颜夕 on 16/5/5.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor brownColor];
    UILabel *label=[[UILabel alloc]init];
    label.text=@"viewcontroller";
    label.frame=CGRectMake(self.view.frame.size.width/4, 0, self.view.frame.size.width, self.view.frame.size.height/3);
    [self.view addSubview:label];

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
