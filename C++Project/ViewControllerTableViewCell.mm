//
//  ViewControllerTableViewCell.m
//  C++Project
//
//  Created by chenyanan on 2016/12/24.
//  Copyright © 2016年 chenyanan. All rights reserved.
//

#import "ViewControllerTableViewCell.h"
#import "Model.hpp"

static NSString *cppStringToNSString(const std::unique_ptr<std::string>& string) {
    return [NSString stringWithCString:string->c_str() encoding:NSUTF8StringEncoding];
}

static const CGFloat five = 5.0f;

@interface ViewControllerTableViewCell () {
    CSModel _model;
}
@property (nonatomic, strong) UILabel *leftUpLabel;
@property (nonatomic, strong) UILabel *leftDownLabel;
@property (nonatomic, strong) UILabel *rightUpLabel;
@property (nonatomic, strong) UILabel *rightDownLabel;
@end

@implementation ViewControllerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_model->getLUStr()) {
        [self leftUpLabel];
        [self leftDownLabel];
        [self rightUpLabel];
        [self rightDownLabel];
    }
}

#pragma mark - init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _model = CSModel();
    }
    return self;
}

#pragma mark - get & set
- (void)setModel:(void *)ptr {
    _model = *((CSModel *)ptr);
}

- (void)action {
    CVBlk block = *(_model->getAVBlk());
    if (block) {
        block();
    
    } else {
        NSLog(@"xixi");
    }
}

- (UILabel *)leftUpLabel {
    if (!_leftUpLabel) {
        _leftUpLabel = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(five, five, CGRectGetWidth(self.contentView.bounds) * 0.5f - five * 2.0f, CGRectGetHeight(self.contentView.bounds) * 0.5f - five * 2.0f))];
        _leftUpLabel.backgroundColor = [UIColor redColor];
        _leftUpLabel.textAlignment = NSTextAlignmentCenter;
        _leftUpLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_leftUpLabel];
    }
    _leftUpLabel.text = cppStringToNSString(_model->getLUStr());
    return _leftUpLabel;
}

- (UILabel *)leftDownLabel {
    if (!_leftDownLabel) {
        _leftDownLabel = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(five, CGRectGetMaxY(_leftUpLabel.frame) + five, CGRectGetWidth(self.contentView.bounds) * 0.5f - five * 2.0f, CGRectGetHeight(self.contentView.bounds) * 0.5f - five * 2.0f))];
        _leftDownLabel.backgroundColor = [UIColor greenColor];
        _leftDownLabel.textAlignment = NSTextAlignmentCenter;
        _leftDownLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_leftDownLabel];
    }
    _leftDownLabel.text = cppStringToNSString(_model->getLDStr());
    return _leftDownLabel;
}

- (UILabel *)rightUpLabel {
    if (!_rightUpLabel) {
        _rightUpLabel = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(CGRectGetMaxX(_leftUpLabel.frame) + five * 2.0f, 0, CGRectGetWidth(self.contentView.bounds) * 0.5f - five * 2.0f, CGRectGetHeight(self.contentView.bounds) * 0.5f - five * 2.0f))];
        _rightUpLabel.backgroundColor = [UIColor yellowColor];
        _rightUpLabel.textAlignment = NSTextAlignmentCenter;
        _rightUpLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_rightUpLabel];
    }
    _rightUpLabel.text = cppStringToNSString(_model->getRUStr());
    return _rightUpLabel;
}

- (UILabel *)rightDownLabel {
    if (!_rightDownLabel) {
        _rightDownLabel = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(CGRectGetMaxX(_leftUpLabel.frame) + five * 2.0f, CGRectGetMaxY(_rightUpLabel.frame) + five * 2.0f, CGRectGetWidth(self.contentView.bounds) * 0.5f - five * 2.0f, CGRectGetHeight(self.contentView.bounds) * 0.5f - five * 2.0f))];
        _rightDownLabel.backgroundColor = [UIColor orangeColor];
        _rightDownLabel.textAlignment = NSTextAlignmentCenter;
        _rightUpLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_rightDownLabel];
    }
    _rightDownLabel.text = cppStringToNSString(_model->getRDStr());
    return _rightDownLabel;
}

#pragma mark - dealloc
- (void)dealloc {
    NSLog(@"ViewControllerTableViewCell dealloc");
}
@end


