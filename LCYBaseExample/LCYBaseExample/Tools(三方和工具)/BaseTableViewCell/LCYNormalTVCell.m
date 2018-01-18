//
//  LCYNormalTVCell.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/18.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "LCYNormalTVCell.h"

// --------------------------------------
static CGFloat leftImageWidth = 30;
static CGFloat leftImageHeight = 30;
static CGFloat leftMargin = 12;//控件左右边距一致
static CGFloat imageTitleMargin = 8;//图片和标题之间的边距
static CGFloat arrowWidth = 8;
static CGFloat arrowHeight = 12;

#define LeftLabelFont [UIFont systemFontOfSize:14]
#define LeftLabelColor [UIColor qmui_colorWithHexString:@"#333333"]

#define RightLabelFont [UIFont systemFontOfSize:12]
#define RightLabelColor [UIColor qmui_colorWithHexString:@"#666666"]

// --------------------------------------

@interface LCYNormalTVCell ()

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UIImageView *rightArrowImageView;
@property (nonatomic, strong) UILabel *rightLabel;

@end

@implementation LCYNormalTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)setType:(LCYNormalTVCellType)type{
    switch (type) {
        case LCYNormalTVCellTypeTitleArrow:
        {
            [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(leftMargin);
                make.centerY.mas_equalTo(0);
            }];
            
            [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.leftLabel.mas_right).mas_equalTo(5);
                make.right.mas_equalTo(self.rightArrowImageView.mas_left).mas_equalTo(-5);
                make.top.bottom.mas_equalTo(0);
            }];
        }
            break;
        case LCYNormalTVCellTypeImageTitleArrow:
        {
            [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(leftImageWidth);
                make.height.mas_equalTo(leftImageHeight);
                make.centerY.mas_equalTo(0);
                make.left.mas_equalTo(leftMargin);
            }];
            
            [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.leftImageView.mas_right).mas_equalTo(imageTitleMargin);
                make.centerY.mas_equalTo(0);
            }];
            
            [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.leftLabel.mas_right).mas_equalTo(5);
                make.right.mas_equalTo(self.rightArrowImageView.mas_left).mas_equalTo(-5);
                make.top.bottom.mas_equalTo(0);
            }];
        }
            break;
        default:
            break;
    }
}

- (UIImageView *)leftImageView{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] init];
        [self addSubview:_leftImageView];
    }
    return _leftImageView;
}

- (UILabel *)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] initWithFont:LeftLabelFont textColor:LeftLabelColor];
        [self addSubview:_leftLabel];
        _leftLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _leftLabel;
}

- (UIImageView *)rightArrowImageView{
    if (!_rightArrowImageView) {
        _rightArrowImageView = [[UIImageView alloc] init];
        _rightArrowImageView.image = [UIImage imageNamed:@"arrowRight"];
        [self addSubview:_rightArrowImageView];
        [_rightArrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftMargin);
            make.centerY.mas_equalTo(0);
            make.width.mas_equalTo(arrowWidth);
            make.height.mas_equalTo(arrowHeight);
        }];
    }
    return _rightArrowImageView;
}

- (UILabel *)rightLabel{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] initWithFont:RightLabelFont textColor:RightLabelColor];
        [self addSubview:_rightLabel];
        _rightLabel.textAlignment = NSTextAlignmentRight;
        _rightLabel.numberOfLines = 0;
    }
    return _rightLabel;
}

#pragma mark - method -----------------------

- (void)setTitle:(NSString *)title{
    self.leftLabel.text = title;
}

- (void)setDetail:(NSString *)detail{
    self.rightLabel.text = detail;
}

- (void)setImage:(NSString *)imagename{
    self.leftImageView.image = [UIImage imageNamed:imagename];
}

@end
