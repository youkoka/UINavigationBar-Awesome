//
//  ViewController.m
//  AssociateObjectTest
//
//  Created by yehengjia on 2016/4/29.
//  Copyright © 2016年 mitake. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+Awesome.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"test1";
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"logo2"] forBarMetrics:UIBarMetricsDefault];
    
    self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    
    [self.navigationController.navigationBar setBackgroundImageWithOffset:0];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    NSLog(@"offsetY = %f", offsetY);
    
    if (offsetY <= -130) {
        
        [self.navigationController.navigationBar setTitle2];
        
    } else {
        
        [self.navigationController.navigationBar setTitle1];
    }
    
    [self.navigationController.navigationBar setBackgroundImageWithOffset:fabs(offsetY)];
    
}

@end
