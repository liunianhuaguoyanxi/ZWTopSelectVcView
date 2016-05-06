//
//  ZWTopSelectVcView.h
//  ZWTopSelectVcView
//
//  Created by 流年划过颜夕 on 16/5/6.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZWTopSelectVcView;
@class ZWTopSelectButton;
@protocol ZWTopSelectVcViewDelegate <NSObject>

@required
/**
 *  只要一步：传入您各种的控制器，用可变数组封装传入，就会动态的生成选择按钮，默认最大为九个
 *
 *
 *  @param 当前topSelectVcView
 *
 *  @return 返回封装您的控制器的可变数组
 */
-(NSMutableArray *)totalControllerinZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView;
@optional
/**
 *   统一通过totalTopBtns修改顶部控件样式
 *   或者通过topSelectVcView找到对应的单个顶部button，从左到右如,topViewFirstbtn，topViewSecondbtn,topViewThirdbtn,以此类推;
 *   单个设置的优先级比统一设置的优先级高
 *   不修改,则为默认
 *
 *  @param totalTopBtns 所有顶部button
 *  @param topSelectVcView    当前topSelectVcView
 
 */
-(void)totalTopZWTopSelectButton:(ZWTopSelectButton *)totalTopBtns IntopSelectVcView:(ZWTopSelectVcView *)topSelectVcView;
@end
@interface ZWTopSelectVcView : UIView
/**
 *  开始ZWTopSelectVcViewUI绘制,必须实现！
 */
-(void)setupZWTopSelectVcViewUI;
@property (nonatomic, weak) id<ZWTopSelectVcViewDelegate> delegate;

/*************   顶部button具有的公有属性   *****************
 *
 UILabel *labName;           button的文字
 UIView *viewLine;           间隔线
 UIColor *selectedColor;     button选中颜色
 UIColor *notSelectedColor   button未选中颜色
 * **********   顶部button具有的公有属性   ****************
 */
typedef enum{
    ZWTopSelectButtonTypeHeadFirst,
    ZWTopSelectButtonTypeHeadSecond,
    ZWTopSelectButtonTypeHeadThird,
    ZWTopSelectButtonTypeHeadFourth,
    ZWTopSelectButtonTypeHeadFifth,
    ZWTopSelectButtonTypeHeadSixth,
    ZWTopSelectButtonTypeHeadSeventh,
    ZWTopSelectButtonTypeHeadEighth,
    ZWTopSelectButtonTypeHeadNinth
} ZWTopSelectButtonType;
@property (nonatomic ,strong) ZWTopSelectButton *topViewFirstbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewSecondbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewThirdbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewFourthbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewFifthbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewSixthbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewSeventhbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewEighthbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewNinthbtn;
///是否关闭动画
@property (nonatomic, assign) BOOL   closeAnimation;
///底部滑块
@property (nonatomic ,strong) UIView *viewUnder;
///装子控制器容器
@property (nonatomic ,weak  ) UIView *contentView;
///顶部容器
@property (nonatomic, weak  ) UIView *viewTop;
///设置动画速度
@property (nonatomic, assign) float  speedCount;

@end

