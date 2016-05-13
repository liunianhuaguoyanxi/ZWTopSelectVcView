//
//  SecondTwoTableViewController.m
//  ZWTopSelectVcView
//
//  Created by 流年划过颜夕 on 16/5/13.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//

#import "SecondTwoTableViewController.h"

@interface SecondTwoTableViewController ()

@end

@implementation SecondTwoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame=CGRectMake(self.view.frame.size.width/2+10, 0, self.view.frame.size.width/2-10, self.view.frame.size.height);
    
    self.tableView.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if (indexPath.row==0) {
        cell.textLabel.text=@"终于等到你";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }
    if (indexPath.row==1) {
        cell.textLabel.text=@"戴眼镜的那位";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }
    if (indexPath.row==2) {
        cell.textLabel.text=@"瞅啥瞅，";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }
    if (indexPath.row==3) {
        cell.textLabel.text=@"说的就是你";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }
    if (indexPath.row==4) {
        cell.textLabel.text=@"喜欢我的话";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }
    if (indexPath.row==5) {
    cell.textLabel.text=@"github给star哟";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }
    cell.textLabel.text=@"一起苦中作乐吧";
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


@end
