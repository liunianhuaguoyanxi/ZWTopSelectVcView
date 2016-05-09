# ZWTopSelectVcView
##快速导入多个控制器，通过顶部选择菜单切换控制器，实现一个页面多个控制器切换处理
# How to use：
## Import the header file
    #import "ZWTopSelectButton.h"
    #import "ZWTopSelectVcView.h"
##### 1.To initialize the ZWTopSelectVcView
    ZWTopSelectVcView *topSelectVcView=[[ZWTopSelectVcView alloc]init];
    topSelectVcView.frame=self.view.frame;
    [self.view addSubview:topSelectVcView];
    self.topSelectVcView=topSelectVcView;
##### 2.Set the delegate of ZWTopSelectVcView
    self.topSelectVcView.delegate=self;
##### 3.Start drawing the UI
    [self.topSelectVcView setupZWTopSelectVcViewUI];
##To implement proxy（Have to do）
   -(NSMutableArray *)totalControllerInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
   {
   
    NSMutableArray *controllerMutableArr=[NSMutableArray array];
    
    [controllerMutableArr addObject:[[OneTableViewController alloc]init]];
    [controllerMutableArr addObject:[[TwoViewController alloc]init]];
    [controllerMutableArr addObject:[[ThreeTableViewController alloc]init]];
    [controllerMutableArr addObject:[[FourViewController alloc]init]];
    
    return controllerMutableArr;
   }
   
####Show some of the effects 
  ![image](https://github.com/liunianhuaguoyanxi/ZWTopSelectVcView/raw/master/push.gif) ![image](https://github.com/liunianhuaguoyanxi/ZWTopSelectVcView/raw/master/水波.gif)
    ![image](https://github.com/liunianhuaguoyanxi/ZWTopSelectVcView/raw/master/淡入淡出.gif) ![image](https://github.com/liunianhuaguoyanxi/ZWTopSelectVcView/raw/master/翻转.gif)
      ![image](https://github.com/liunianhuaguoyanxi/ZWTopSelectVcView/raw/master/覆盖.gif) ![image](https://github.com/liunianhuaguoyanxi/ZWTopSelectVcView/raw/master/翻页.gif)
####具体设置详情在demo中
####如果你有任何疑问，欢迎随时发邮件到menglanfenghen@163.com
####觉得还可以的话，记得给星呀，相互学习，嘿嘿嘿~
