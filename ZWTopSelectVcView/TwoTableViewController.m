//
//  TwoTableViewController.m
//  FrameWork
//
//  Created by liunianhuaguoyanxi on 16/3/16.
//  Copyright (c) 2016年 yan.jm. All rights reserved.
//

#import "TwoTableViewController.h"

@interface TwoTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TwoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.title=@"111";

    self.tableView.delegate=self;

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 20;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"2");
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *I4D=@"I4D";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:I4D ] ;
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:I4D];
    }
    cell.textLabel.text=@"支持顶部菜单栏和子控制器尺寸自定义";
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    return cell;
}



@end
