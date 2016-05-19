//
//  ZWTopSelectButton.h
//  ZWSlideView
//
//  Created by 流年划过颜夕 on 16/5/6.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZWTopSelectButton;
@protocol ZWTopSelectButtonDelegate <NSObject>

@optional
///高度间隔线设置
-(CGFloat)topSelectBtnSpacingBarHeightInZWTopSelectButtonDelegate:(ZWTopSelectButton *)topSelectButton;

@end
@interface ZWTopSelectButton : UIButton
-(void)setState:(BOOL)state;

@property (nonatomic ,strong) UILabel *labName;
@property (nonatomic ,strong) UIView  *viewLine;
@property (nonatomic ,strong) UIColor *selectedColor;
@property (nonatomic ,strong) UIColor *notSelectedColor;
@property (nonatomic, weak) id<ZWTopSelectButtonDelegate > delegata;
@end
