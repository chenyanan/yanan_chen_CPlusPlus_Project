//
//  ViewController.m
//  C++Project
//
//  Created by chenyanan on 2016/12/23.
//  Copyright © 2016年 chenyanan. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerTableViewCell.h"
#import "Model.hpp"
#import "makemodel.hpp"
#import "anotherViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource> {
    CVSModel aVector;
}
@property (nonatomic, strong) UITableView *tableVeiw;
@property (nonatomic, strong) NSMutableArray *models;
@end

class xihe {
//    CInt integer;
    CStr str;
};

class hexi : xihe {
//    CStr str;
    CInt integer;
};

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ViewController";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self tableVeiw];
    
    __weak typeof (self) weakSelf = self;
    CVBlk block = ^{
        anotherViewController *controller = [[anotherViewController alloc] init];
        [weakSelf.navigationController pushViewController:controller animated:YES];
    };

    aVector = CVSModel();
    aVector.emplace_back(CMSModel("1", "11", "111", "1111", block));
    aVector.emplace_back(CMSModel("2", "22", "222", "2222", block));
    aVector.emplace_back(CMSModel("3", "33", "333", "3333", block));
    aVector.emplace_back(CMSModel("4", "44", "444", "4444", block));
    aVector.emplace_back(CMSModel("5", "55", "555", "5555", block));
    aVector.emplace_back(CMSModel("6", "66", "666", "6666", block));
    aVector.emplace_back(CMSModel("7", "77", "777", "7777", block));
    aVector.emplace_back(CMSModel("8", "88", "888", "8888", block));
    aVector.emplace_back(CMSModel("9", "99", "999", "9999", block));
    
    std::cout << "sizeof(std::string) = "<< sizeof(std::string) << std::endl;
    std::cout << "sizeof(xihe) = " << sizeof(xihe) << std::endl;
    std::cout << "sizeof(hexi) = " << sizeof(hexi) << std::endl;
    std::cout << "sizeof(block) = " << sizeof(block) << std::endl;
    
    
//    makemodel::make("", "chenyanan", "Hello", CVStr(), {"China", "America", "Russia", "India", "Japan"}, {"CUStr", "CUStr", "CUStr", "CUStr", "CUStr"});
//    makemodel::make("/Users/chenyanan/Desktop/xixixixi/", "chenyanan", "Model", CVStr(), {"LUStr", "LDStr", "RUStr", "RDStr", "aVBlk"}, {"CUStr", "CUStr", "CUStr", "CUStr", "CUVbk"});
    
//    makemodel::make("/Users/chenyanan/Desktop/xixixixi/", "chenyanan", "another", CVStr(), {"name", "Age", "birth", "Sex", "didClick"}, {"CUStr", "CUInt", "CUStr", "CUImg", "CUVbk"});
    
    // Do any additional setup after loading the view, typically from a nib.
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
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ViewControllerTableViewCell class]) forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    CSModel aModel = aVector[indexPath.row];
    [(ViewControllerTableViewCell *)cell setModel:&aModel];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ViewControllerTableViewCell *cell = (ViewControllerTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell action];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

#pragma mark - get & set
- (UITableView *)tableVeiw {
    if (!_tableVeiw) {
        _tableVeiw = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableVeiw.backgroundColor = [UIColor whiteColor];
        _tableVeiw.dataSource = self;
        _tableVeiw.delegate = self;
        [_tableVeiw registerClass:[ViewControllerTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ViewControllerTableViewCell class])];
        [self.view addSubview:_tableVeiw];
    }
    return _tableVeiw;
}

#pragma mark - dealloc
- (void)dealloc {
    NSLog(@"ViewController dealloc");
}

@end
