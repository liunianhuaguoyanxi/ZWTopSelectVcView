# ZWTopSelectVcView
##快速导入多个控制器，通过顶部选择菜单切换控制器，实现一个页面多个控制器切换处理
# 使用方法：
## 导入头文件
    #import "ZWTopSelectButton.h"
    #import "ZWTopSelectVcView.h"
##### 初始化ZWTopSelectVcView
    ZWTopSelectVcView *topSelectVcView=[[ZWTopSelectVcView alloc]init];
    topSelectVcView.frame=self.view.frame;
    [self.view addSubview:topSelectVcView];
    self.topSelectVcView=topSelectVcView;
##### 设置ZWTopSelectVcView的代理
    self.topSelectVcView.delegate=self;
#####开始ZWTopSelectVcViewUI绘制
    [self.topSelectVcView setupZWTopSelectVcViewUI];
##实现代理方法（必须实现，一步完成创建）
   -(NSMutableArray *)totalControllerInZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
   {
   
    NSMutableArray *controllerMutableArr=[NSMutableArray array];
    
    [controllerMutableArr addObject:[[OneTableViewController alloc]init]];
    [controllerMutableArr addObject:[[TwoViewController alloc]init]];
    [controllerMutableArr addObject:[[ThreeTableViewController alloc]init]];
    [controllerMutableArr addObject:[[FourViewController alloc]init]];
    
    return controllerMutableArr;
   }
####觉得还可以的话，记得给星呀，相互学习，嘿嘿
