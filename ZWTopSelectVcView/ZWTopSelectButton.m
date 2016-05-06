//
//  ZWTopSelectButton.m
//  ZWSlideView
//
//  Created by 流年划过颜夕 on 16/5/6.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//

#import "ZWTopSelectButton.h"

@interface ZWTopSelectButton()


@end
@implementation ZWTopSelectButton

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        UILabel *labName=[[UILabel alloc]init];
        labName.textAlignment=NSTextAlignmentCenter;
        labName.textColor=[UIColor redColor];
        labName.font=[UIFont systemFontOfSize:15];
        [self addSubview:labName];
        self.labName=labName;
        
        UIView *viewLine=[[UIView alloc]init];
        viewLine.backgroundColor=[UIColor redColor];
        [self addSubview:viewLine];
        self.viewLine=viewLine;
        
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.labName.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.viewLine.frame=CGRectMake(self.frame.size.width-1, self.frame.size.height/2-15, 1, 30);
}
-(void)setState:(BOOL)state{
    if (state==YES) {
        self.labName.textColor=self.selectedColor?self.selectedColor:[UIColor redColor];
        self.userInteractionEnabled=NO;
    }else if(state==NO)
    {
        self.labName.textColor=self.notSelectedColor?self.notSelectedColor:[UIColor grayColor];
        self.userInteractionEnabled=YES;
    }
}
@end

