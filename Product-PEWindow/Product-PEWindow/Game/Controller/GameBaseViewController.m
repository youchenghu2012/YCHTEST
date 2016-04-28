//
//  GameBaseViewController.m
//  Product-PEWindow
//
//  Created by qianfeng on 16/4/21.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import "GameBaseViewController.h"
#import "GameViewController.h"
#import "GameHotViewController.h"
@interface GameBaseViewController ()
/** gamebase*/
@property(nonatomic,strong)GameViewController * baseVC;
/** gamehot*/
@property(nonatomic,strong)GameHotViewController * hotVC;
@end

@implementation GameBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.shadowImage = [[UIImage alloc]init];
////    self.navigationController.navigationBarHidden = YES;
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
 
    
    // 设置返回按钮
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    
    
    _baseVC = [[GameViewController alloc]init];

    _hotVC = [[GameHotViewController alloc]init];
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height -64);
    [self.view addSubview:_hotVC.view];
    [self.view addSubview:_baseVC.view];
    [self addChildViewController:_baseVC];
    [self addChildViewController:_hotVC];

    UISegmentedControl * seg = [[UISegmentedControl alloc]initWithItems:@[@"比赛",@"热门"]];
    seg.frame = CGRectMake(0, 0, 160, 30);
    seg.selectedSegmentIndex = 0;
    seg.tintColor = YCOLOR_BROWNCOLOR;
    seg.layer.cornerRadius = 15;
    seg.clipsToBounds = YES;
    seg.layer.borderWidth = 1;
    seg.layer.borderColor = YCOLOR_BANANACOLOR.CGColor;
    seg.tintAdjustmentMode =  UIViewTintAdjustmentModeAutomatic;
    [seg addTarget:self action:@selector(segClick:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = seg;

    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
  //  self.navigationController.navigationBarHidden = NO;
   // self.navigationController.navigationBar.backgroundColor = YCOLOR_REDCOLOR;

}
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = NO;
//
//}
- (void)segClick:(UISegmentedControl *)seg
{
    //调整_all 与_free
    if (seg.selectedSegmentIndex == 0) {
        //周免视图在最上方
        [self.view bringSubviewToFront:_baseVC.view];
    }else {
        [self.view bringSubviewToFront:_hotVC.view];
    }
}


@end
