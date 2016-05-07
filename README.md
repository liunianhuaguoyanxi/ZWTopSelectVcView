# ZWTopSelectVcView
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
   -(NSMutableArray *)totalControllerinZWTopSelectVcView:(ZWTopSelectVcView *)topSelectVcView
   {
    NSMutableArray *controllerMutableArr=[NSMutableArray array];
    
    [controllerMutableArr addObject:[[OneTableViewController alloc]init]];
    [controllerMutableArr addObject:[[TwoViewController alloc]init]];
    [controllerMutableArr addObject:[[ThreeTableViewController alloc]init]];
    [controllerMutableArr addObject:[[FourViewController alloc]init]];
    
    return controllerMutableArr;
   }
