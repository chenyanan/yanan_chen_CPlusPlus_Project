//
//  FirstViewController.m
//  C++Project
//
//  Created by chenyanan on 2017/1/3.
//  Copyright © 2017年 chenyanan. All rights reserved.
//

#import "FirstViewController.h"
#import "ViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAction:)];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - rightBarButtonAction
- (void)rightBarButtonAction:(UIBarButtonItem *)sender {
    ViewController *controller = [[ViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
