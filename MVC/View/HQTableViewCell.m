//
//  HQTableViewCell.m
//  MVC
//
//  Created by 王红庆 on 2017/4/25.
//  Copyright © 2017年 王红庆. All rights reserved.
//

#import "HQTableViewCell.h"
#import "Masonry.h"
#import "HQModel.h"

@interface HQTableViewCell ()

/** 主标题 */
@property (nonatomic, strong) UILabel *newsTitleLabel;
/** 副标题 */
@property (nonatomic, strong) UILabel *newsSubTitleLabel;

@end

@implementation HQTableViewCell

- (void)setModel:(HQModel *)model {
    _model = model;
    
    self.newsTitleLabel.text = model.title;
    self.newsSubTitleLabel.text = model.digest;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

+ (instancetype)tableViewCellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"HQTableViewCell";
    HQTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HQTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)setupUI {
    
    [self addSubview:self.newsTitleLabel];
    [self addSubview:self.newsSubTitleLabel];
    /**
     * 错误的写法
     */
//    [self addSubview:_newsTitleLabel];
//    [self addSubview:_newsSubTitleLabel];
    
    [self.newsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.left.equalTo(self).offset(16);
        make.right.equalTo(self).offset(-16);
    }];
    [_newsSubTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_newsTitleLabel.mas_bottom).offset(8);
        make.left.equalTo(_newsTitleLabel);
        make.right.equalTo(_newsTitleLabel);
    }];
}

#pragma mark - lazy
- (UILabel *)newsTitleLabel {
    if (_newsTitleLabel == nil) {
        _newsTitleLabel = [[UILabel alloc] init];
        _newsTitleLabel.text = @"标题";
        _newsTitleLabel.textColor = [UIColor darkGrayColor];
    }
    return _newsTitleLabel;
}

- (UILabel *)newsSubTitleLabel {
    if (_newsSubTitleLabel == nil) {
        _newsSubTitleLabel = [[UILabel alloc] init];
        _newsSubTitleLabel.text = @"副标题";
        _newsSubTitleLabel.textColor = [UIColor lightGrayColor];
        _newsSubTitleLabel.font = [UIFont systemFontOfSize:14];
        _newsSubTitleLabel.numberOfLines = 2;
    }
    return _newsSubTitleLabel;
}

@end
