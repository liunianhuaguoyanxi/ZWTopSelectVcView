//
//  ZWTopSelectButton.m
//  ZWSlideView
//
//  Created by 流年划过颜夕 on 16/5/6.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//
#define topSelectBtnInitHeight self.topSelectBtnHeight
#define topSelectBtnInitY (self.frame.size.height-topSelectBtnInitHeight)/2

#import "ZWTopSelectButton.h"

@interface ZWTopSelectButton()
@property (nonatomic, assign) float topSelectBtnHeight;

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
        labName.font=[UIFont systemFontOfSize:14];
        [self addSubview:labName];
        self.labName=labName;
        
        UIView *viewLine=[[UIView alloc]init];
        viewLine.backgroundColor=[UIColor redColor];
        [self addSubview:viewLine];
        self.viewLine=viewLine;
        
    }
    return self;
}

-(float)topSelectBtnHeight
{
    if ([self.delegata respondsToSelector:@selector(topSelectBtnSpacingBarHeightInZWTopSelectButtonDelegate:)]) {
        return  [self.delegata topSelectBtnSpacingBarHeightInZWTopSelectButtonDelegate:self];
    }else
    {
        return 30;
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.labName.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    float  topSelectBtnInithalfHeight =topSelectBtnInitHeight/2;
    self.viewLine.frame=CGRectMake(self.frame.size.width-1, self.frame.size.height/2-topSelectBtnInithalfHeight, 1, topSelectBtnInitHeight);
}
-(void)setState:(BOOL)state withSelectedColor:(UIColor *)selectedColor withNotSelectedColor:(UIColor *)notSelectedColor withViewLineColor:(UIColor *)viewLineColor{
    self.viewLine.backgroundColor = self.viewLineColor?self.viewLineColor:viewLineColor;
    if(state==YES) {
        self.labName.textColor=self.selectedColor?self.selectedColor:selectedColor;
        self.userInteractionEnabled=NO;
    }else if(state==NO)
    {
        self.labName.textColor=self.notSelectedColor?self.notSelectedColor:notSelectedColor;
        self.userInteractionEnabled=YES;
    }
}
@end

