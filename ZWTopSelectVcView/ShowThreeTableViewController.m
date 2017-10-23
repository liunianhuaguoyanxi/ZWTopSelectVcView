//
//  ShowThreeTableViewController.m
//  ZWTopSelectVcView
//
//  Created by 流年划过颜夕 on 2017/10/23.
//  Copyright © 2017年 流年划过颜夕. All rights reserved.
//

#import "ShowThreeTableViewController.h"

@interface ShowThreeTableViewController ()

@end

@implementation ShowThreeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame=CGRectMake((self.view.frame.size.width-260)/2, 200, 260, 200);
    
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 20;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"努力，奋斗");
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *I4D=@"I4D";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:I4D ] ;
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:I4D];
    }
    cell.textLabel.text=@"支持动态刷新，重新加载子控制器";
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
