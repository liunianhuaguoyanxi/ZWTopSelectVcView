//
//  ZWTopSelectVcView.h
//  ZWTopSelectVcView
//
//  Created by 流年划过颜夕 on 16/5/6.
//  Copyright © 2016年 流年划过颜夕. All rights reserved.


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
-(NSMutableArray *)totalControllerInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView;

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

//
///顶部标题背景设置
-(UIColor *)topViewBackGroundColorInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView;
///顶部高度设置
-(CGFloat)topViewHeightInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView;
///顶部宽度设置
-(CGFloat)topViewWidthInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView;
///顶部X设置
-(CGFloat)topViewXInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView;
///顶部Y设置
-(CGFloat)topViewYInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView;


///子控制器高度设置
-(CGFloat)childVcViewHeightInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView;
///子控制器宽度设置
-(CGFloat)childVcViewWidthInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView;
///子控制器X设置
-(CGFloat)childVcViewXInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView;
///子控制器Y设置
-(CGFloat)childVcViewYInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView;


///初始化展示第几个控制器（默认第一个）
-(NSInteger)showChildViewVcIndexInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView;

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

@property (nonatomic ,strong) ZWTopSelectButton *topViewFirstbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewSecondbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewThirdbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewFourthbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewFifthbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewSixthbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewSeventhbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewEighthbtn;
@property (nonatomic ,strong) ZWTopSelectButton *topViewNinthbtn;

typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
    
} AnimationType;

///是否关闭动画
@property (nonatomic, assign) BOOL          isCloseAnimation;
///底部滑块
@property (nonatomic ,strong) UIView        *viewUnder;
///设置topView圆角
@property (nonatomic, assign) CGFloat       topViewCornerRadius;
///设置动画时间
@property (nonatomic, assign) float         speedTime;
///动画效果
@property (nonatomic, assign) AnimationType animationType;
///关闭左右手势滑动功能
@property (nonatomic, assign) BOOL          isCloseSwipeGesture;


/**
 *  重新加载数组刷新ZWTopSelectVcView
 *
 *
 *  @param 重新加载数组刷新ZWTopSelectVcView
 *
 *  @return 返回封装您的控制器的可变数组
 */
-(void)reloadWithChildControllerMutableArr:(NSMutableArray *)arr;

@end

