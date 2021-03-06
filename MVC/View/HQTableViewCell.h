//
//  HQTableViewCell.h
//  MVC
//
//  Created by 王红庆 on 2017/4/25.
//  Copyright © 2017年 王红庆. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HQModel;

@interface HQTableViewCell : UITableViewCell

+ (instancetype)tableViewCellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) HQModel *model;

@end
