//
//  ViewController.m
//  MCButton
//
//  Created by ZMC on 2021/2/19.
//

#import "ViewController.h"
#import "MCButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIImageView*btn = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    btn.image = [UIImage imageNamed:@"check"];
    btn.contentMode = UIViewContentModeScaleAspectFit;
    btn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:btn];
    
    MCButton*mcbtn = [[MCButton alloc] initWithFrame:CGRectMake(100, 300, 100, 40) title:@"按钮标题" clickButtonBlock:^{
        NSLog(@"按钮标题");
    }];
    mcbtn.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:mcbtn];
    
    MCButton*mcbtn1 = [[MCButton alloc] initWithFrame:CGRectMake(100, 400, 100, 40) image:[UIImage imageNamed:@"check"] clickButtonBlock:^{
        NSLog(@"按钮标题");
    }];
    mcbtn1.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:mcbtn1];
    
    
    MCButton*mcbtn2 = [[MCButton alloc] initWithFrame:CGRectMake(250, 400, 100, 40) image:[UIImage imageNamed:@"check"] title:@"按钮" layoutStyle:MCButtonLayoutImageLeftMargin marginOffset:5 clickButtonBlock:^{
        NSLog(@"按钮标题");
    }];
    mcbtn2.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:mcbtn2];
    [mcbtn2 addShadowLayerRadius:20 color:[UIColor redColor] corner:0];
    
    MCButton*mcbtn3 = [[MCButton alloc] initWithFrame:CGRectMake(250, 500, 100, 40) image:[UIImage imageNamed:@"check"] title:@"按钮" layoutStyle:MCButtonLayoutImageRightMargin marginOffset:5 clickButtonBlock:^{
        NSLog(@"按钮标题");
    }];
    mcbtn3.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:mcbtn3];
    [mcbtn3 addShadowLayerRadius:5 color:[UIColor blackColor] corner:0];
    
    MCButton*btn2 = [[MCButton alloc] initWithFrame:CGRectMake(100, 450, 100, 80) image:[UIImage imageNamed:@"check"] title:@"标题" layoutStyle:MCButtonLayoutImageRight spacing:10 clickButtonBlock:^{
        
    }];
    btn2.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:btn2];
    [btn2 addShadowLayerRadius:5 color:[UIColor blackColor] corner:0];
    
    
    MCButton*btn3 = [[MCButton alloc] initWithFrame:CGRectMake(100, 550, 100, 80) image:[UIImage imageNamed:@"check"] title:@"标题" layoutStyle:MCButtonLayoutImageTop spacing:20 clickButtonBlock:^{
        
    }];
    btn3.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn3];
    
    
    MCButton*btn4 = [[MCButton alloc] initWithFrame:CGRectMake(100, 650, 100, 80) image:[UIImage imageNamed:@"check"] title:@"标题" layoutStyle:MCButtonLayoutImageBottom spacing:20 clickButtonBlock:^{
        
    }];
    btn4.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:btn4];
    [btn4 addCornerRadius:30];
    [btn4 addShadowLayerRadius:10 color:[UIColor blackColor] corner:30];
    
    MCButton*btn5 = [[MCButton alloc] initWithFrame:CGRectMake(100, 850, 100, 80) image:[UIImage imageNamed:@"check"] title:@"标题" layoutStyle:MCButtonLayoutImageLeft spacing:10 clickButtonBlock:^{
        
    }];
    btn5.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn5];
    btn5.layer.cornerRadius = 40;
    btn5.layer.masksToBounds = YES;
}


@end
