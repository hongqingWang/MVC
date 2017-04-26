//
//  HQViewController.m
//  MVC
//
//  Created by 王红庆 on 2017/4/25.
//  Copyright © 2017年 王红庆. All rights reserved.
//

#import "HQViewController.h"
#import "HQTableViewCell.h"
#import "HQModel.h"

@interface HQViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation HQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    [self tableView];
    [self loadData];
}

#pragma mark - loadData
- (void)loadData {
    
    [HQModel modelWithSuccess:^(NSArray *array) {
        self.dataArr = array;
        [self.tableView reloadData];
    } error:^{
        NSLog(@"数据请求错误");
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HQTableViewCell *cell = [HQTableViewCell tableViewCellWithTableView:tableView];
    cell.model = self.dataArr[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - lazy
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 80;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
