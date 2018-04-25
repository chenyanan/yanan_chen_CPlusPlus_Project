//
//  anotherViewController.m
//  C++Project
//
//  Created by chenyanan on 2017/1/3.
//  Copyright © 2017年 chenyanan. All rights reserved.
//

#import "anotherViewController.h"
#import "anotherViewControllerTableViewCell.h"
#import "another.hpp"
#import "SPR.h"

@interface anotherViewController () <UITableViewDelegate, UITableViewDataSource> {
    VSAnother aVector;
}
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation anotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"anotherViewController";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self tableView];
    
    aVector = VSAnother();
    
    UIImage *imageName = [UIImage imageNamed:@""];
    
    aVector.emplace_back(SAnother(new Another("1", 2, "3", (__bridge void*)imageName, nil)));
    aVector.emplace_back(SAnother(new Another("11", 22, "33", (__bridge void*)imageName, nil)));
    aVector.emplace_back(SAnother(new Another("111", 222, "333", (__bridge void*)imageName, nil)));
    aVector.emplace_back(SAnother(new Another("1111", 2222, "3333", (__bridge void*)imageName, nil)));
    aVector.emplace_back(SAnother(new Another("11111", 22222, "33333", (__bridge void*)imageName, nil)));
    aVector.emplace_back(SAnother(new Another("111111", 222222, "333333", (__bridge void*)imageName, nil)));
    aVector.emplace_back(SAnother(new Another("1111111", 2222222, "3333333", (__bridge void*)imageName, nil)));
    aVector.emplace_back(SAnother(new Another("11111111", 22222222, "33333333", (__bridge void*)imageName, nil)));
    aVector.emplace_back(SAnother(new Another("111111111", 222222222, "333333333", (__bridge void*)imageName, nil)));
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return aVector.size();
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([anotherViewControllerTableViewCell class]) forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    SAnother aModel = aVector[indexPath.row];
    [(anotherViewControllerTableViewCell *)cell setModel:&aModel];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    anotherViewControllerTableViewCell *cell = (anotherViewControllerTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell action];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

#pragma mark - get & set
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[anotherViewControllerTableViewCell class] forCellReuseIdentifier:NSStringFromClass([anotherViewControllerTableViewCell class])];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark - dealloc
- (void)dealloc {
    NSLog(@"ViewController dealloc");
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
