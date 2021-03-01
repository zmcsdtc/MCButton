//
//  ViewController.m
//  MCButton
//
//  Created by ZMC on 2021/2/19.
//

#import "ViewController.h"
#import "MCButton.h"
#import "UIImage+Corner.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];

    
    MCButton*mcbtn = [[MCButton alloc] initWithFrame:CGRectMake(50, 100, 100, 40) title:@"按钮标题" clickButtonBlock:^{
        NSLog(@"按钮标题");
    }];
    mcbtn.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:mcbtn];
    [mcbtn addShadowLayerRadius:2 color:[UIColor blackColor] corner:0 shadowSide:MCButtonShadowLeftSide];
    
   __block MCButton*mcbtn1 = [[MCButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40) image:[UIImage imageNamed:@"level_unselected"] clickButtonBlock:^{
        NSLog(@"按钮标题");
        if (mcbtn1.select) {
            mcbtn1.select = NO;
        }
        else {
            mcbtn1.select = YES;
        }
    }];
    mcbtn1.selectBackGroundColor = [UIColor redColor];
    mcbtn1.norBackgroundColor = [UIColor cyanColor];
    mcbtn1.selectImage = [UIImage imageNamed:@"level_selected"];
    
    
    [self.view addSubview:mcbtn1];
    
    
   __block MCButton*mcbtn2 = [[MCButton alloc] initWithFrame:CGRectMake(250, 200, 150, 40) image:[UIImage imageNamed:@"level_unselected"] title:@"四周red" layoutStyle:MCButtonLayoutImageLeftMargin marginOffset:5 clickButtonBlock:^{
       if (mcbtn2.select) {
           mcbtn2.select = NO;
       }
       else {
           mcbtn2.select = YES;
       }
    }];
    mcbtn2.norBackgroundColor = [UIColor cyanColor];
    [self.view addSubview:mcbtn2];
    [mcbtn2 addShadowLayerRadius:20 color:[UIColor redColor] corner:0 shadowSide:MCButtonShadowAllSide];
    mcbtn2.selectBackGroundColor = [UIColor greenColor];
    
    
    MCButton*mcbtn3 = [[MCButton alloc] initWithFrame:CGRectMake(250, 300, 150, 40) image:[UIImage imageNamed:@"level_unselected"] title:@"上黑" layoutStyle:MCButtonLayoutImageRightMargin marginOffset:5 clickButtonBlock:^{
        NSLog(@"按钮标题");
    }];
    mcbtn3.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:mcbtn3];
    [mcbtn3 addShadowLayerRadius:5 color:[UIColor blackColor] corner:0 shadowSide:MCButtonShadowTopSide];
    
    MCButton*btn2 = [[MCButton alloc] initWithFrame:CGRectMake(50, 300, 150, 80) image:[UIImage imageNamed:@"level_unselected"] title:@"下黑" layoutStyle:MCButtonLayoutImageRight spacing:10 clickButtonBlock:^{
        
    }];
    btn2.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:btn2];
    [btn2 addShadowLayerRadius:5 color:[UIColor blackColor] corner:0 shadowSide:MCButtonShadowBottomSide];
    
    
    MCButton*btn3 = [[MCButton alloc] initWithFrame:CGRectMake(50, 400, 100, 100) image:[UIImage imageNamed:@"level_unselected"] title:@"标题" layoutStyle:MCButtonLayoutImageTop spacing:20 clickButtonBlock:^{
        
    }];
    btn3.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn3];
    
    
    MCButton*btn4 = [[MCButton alloc] initWithFrame:CGRectMake(50, 550, 150, 100) image:[UIImage imageNamed:@"level_unselected"] title:@"全弧黑" layoutStyle:MCButtonLayoutImageBottom spacing:20 clickButtonBlock:^{
        
    }];
    btn4.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:btn4];
    [btn4 addCornerRadius:30];
    [btn4 addShadowLayerRadius:10 color:[UIColor blackColor] corner:30 shadowSide:MCButtonShadowAllSide];
    
    MCButton*btn5 = [[MCButton alloc] initWithFrame:CGRectMake(200, 400, 150, 100) image:[UIImage imageNamed:@"level_unselected"] title:@"离屏渲染" layoutStyle:MCButtonLayoutImageLeft spacing:20 clickButtonBlock:^{
        
    }];
    btn5.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn5];
    btn5.layer.cornerRadius = 40;
    btn5.layer.masksToBounds = YES;
    
    MCButton*btn6 = [[MCButton alloc] initWithFrame:CGRectMake(50, 700, 150, 100) image:[UIImage imageNamed:@"level_unselected"] title:@"全弧" layoutStyle:MCButtonLayoutImageBottom spacing:20 clickButtonBlock:^{
        
    }];
    btn6.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btn6];
    [btn6 addCornerRadius:20];
    
    
    MCButton*btn7 = [[MCButton alloc] initWithFrame:CGRectMake(250, 700, 150, 100) image:[UIImage imageNamed:@"level_unselected"] title:@"全弧" layoutStyle:MCButtonLayoutImageBottom spacing:20 clickButtonBlock:^{

    }];
    [self.view addSubview:btn7];
    [btn7 setGradientColors:@[[UIColor redColor],[UIColor blueColor]] startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 1)];
    [btn7 addCornerRadius:20];
    
}


@end
