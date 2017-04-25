//
//  HQViewController.m
//  MVC
//
//  Created by 王红庆 on 2017/4/25.
//  Copyright © 2017年 王红庆. All rights reserved.
//

#import "HQViewController.h"
#import "HQTableViewCell.h"
#import "HQNetworkTools.h"
#import "MJExtension.h"
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
    
    /**
     * http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html
     */
    NSString *urlString = @"http://c.m.163.com/nc/article/headline/T1348647853363/0-10.html";
    [[HQNetworkTools sharedTools] request:GET urlString:urlString parameters:nil finished:^(id result, NSError *error) {
        if (error) {
            
            NSLog(@"%@", error);
            return;
        }
        NSLog(@"%@", result[@"T1348647853363"]);
        self.dataArr = [HQModel mj_objectArrayWithKeyValuesArray:result[@"T1348647853363"]];
        [self.tableView reloadData];
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

- (NSArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [NSArray array];
    }
    return _dataArr;
}

@end
