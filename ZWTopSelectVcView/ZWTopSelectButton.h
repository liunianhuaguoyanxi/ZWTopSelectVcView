//
//  ZWTopSelectButton.h
//  ZWSlideView
//
//  Created by 流年划过颜夕 on 16/5/6.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWTopSelectButton : UIButton
-(void)setState:(BOOL)state;

@property (nonatomic ,strong) UILabel *labName;
@property (nonatomic ,strong) UIView  *viewLine;
@property (nonatomic ,strong) UIColor *selectedColor;
@property (nonatomic ,strong) UIColor *notSelectedColor;
@end
