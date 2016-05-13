//
//  SecondOneTableViewController.m
//  ZWTopSelectVcView
//
//  Created by 流年划过颜夕 on 16/5/13.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//

#import "SecondOneTableViewController.h"

@interface SecondOneTableViewController ()

@end

@implementation SecondOneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame=CGRectMake(self.view.frame.size.width/2+10, 0, self.view.frame.size.width/2-10, self.view.frame.size.height);
    

}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *I4D=@"I4D";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:I4D ] ;
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:I4D];
    }
    if (indexPath.row==0) {
        cell.textLabel.text=@"程序员代码控";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }
    if (indexPath.row==1) {
        cell.textLabel.text=@"任务紧工作重";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }
    if (indexPath.row==2) {
        cell.textLabel.text=@"天天闷骚写代码";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }
    if (indexPath.row==3) {
        cell.textLabel.text=@"感觉身体被掏空";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }
    if (indexPath.row==4) {
        cell.textLabel.text=@"没代码无聊中";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }
    if (indexPath.row==5) {
   cell.textLabel.text=@"写个框架来用用";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }
    cell.textLabel.text=@"不用白不用~";
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


@end
