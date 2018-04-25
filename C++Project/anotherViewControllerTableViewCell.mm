//
//  anotherViewControllerTableViewCell.m
//  C++Project
//
//  Created by chenyanan on 2017/1/3.
//  Copyright © 2017年 chenyanan. All rights reserved.
//

#import "anotherViewControllerTableViewCell.h"
#import "another.hpp"
#import "SPR.h"

static const CGFloat five = 5.0f;

static NSString *cppStringToNSString(STR string) {
    return [NSString stringWithCString:string.c_str() encoding:NSUTF8StringEncoding];
}

static NSString *intToNSString(INT integer) {
    return [NSString stringWithFormat:@"%ld", (long)integer];
}

@interface anotherViewControllerTableViewCell () {
    SAnother _model;
}
@property (nonatomic, strong) UILabel *leftUpLabel;
@property (nonatomic, strong) UILabel *leftDownLabel;
@property (nonatomic, strong) UILabel *rightUpLabel;
@property (nonatomic, strong) UILabel *rightDownLabel;
@end

@implementation anotherViewControllerTableViewCell

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
    
    if (_model->_name.length() > 0) {
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
        _model = SAnother();
    }
    return self;
}

#pragma mark - get & set
- (void)setModel:(void *)ptr {
    _model = *((SAnother *)ptr);
    if (!_model->_didClick) {
        _model->_didClick = ^{
            NSLog(@"another cell");
        };
    }
}

- (void)action {

    if (_model->_didClick) {
        _model->_didClick();
    } else {
        NSLog(@"not action");
    }
}

- (UILabel *)leftUpLabel {
    if (!_leftUpLabel) {
        _leftUpLabel = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(five, five, CGRectGetWidth(self.contentView.bounds) * 0.5f - five * 2.0f, CGRectGetHeight(self.contentView.bounds) * 0.5f - five * 2.0f))];
        _leftUpLabel.backgroundColor = [UIColor yellowColor];
        _leftUpLabel.textAlignment = NSTextAlignmentCenter;
        _leftUpLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_leftUpLabel];
    }
    _leftUpLabel.text = cppStringToNSString(_model->_name);
    return _leftUpLabel;
}

- (UILabel *)leftDownLabel {
    if (!_leftDownLabel) {
        _leftDownLabel = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(five, CGRectGetMaxY(_leftUpLabel.frame) + five, CGRectGetWidth(self.contentView.bounds) * 0.5f - five * 2.0f, CGRectGetHeight(self.contentView.bounds) * 0.5f - five * 2.0f))];
        _leftDownLabel.backgroundColor = [UIColor redColor];
        _leftDownLabel.textAlignment = NSTextAlignmentCenter;
        _leftDownLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_leftDownLabel];
    }
    _leftDownLabel.text = intToNSString(_model->_Age);
    return _leftDownLabel;
}

- (UILabel *)rightUpLabel {
    if (!_rightUpLabel) {
        _rightUpLabel = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(CGRectGetMaxX(_leftUpLabel.frame) + five * 2.0f, 0, CGRectGetWidth(self.contentView.bounds) * 0.5f - five * 2.0f, CGRectGetHeight(self.contentView.bounds) * 0.5f - five * 2.0f))];
        _rightUpLabel.backgroundColor = [UIColor orangeColor];
        _rightUpLabel.textAlignment = NSTextAlignmentCenter;
        _rightUpLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_rightUpLabel];
    }
    _rightUpLabel.text = cppStringToNSString(_model->_birth);
    return _rightUpLabel;
}

- (UILabel *)rightDownLabel {
    if (!_rightDownLabel) {
        _rightDownLabel = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(CGRectGetMaxX(_leftUpLabel.frame) + five * 2.0f, CGRectGetMaxY(_rightUpLabel.frame) + five * 2.0f, CGRectGetWidth(self.contentView.bounds) * 0.5f - five * 2.0f, CGRectGetHeight(self.contentView.bounds) * 0.5f - five * 2.0f))];
        _rightDownLabel.backgroundColor = [UIColor purpleColor];
        _rightDownLabel.textAlignment = NSTextAlignmentCenter;
        _rightUpLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_rightDownLabel];
    }
    _rightDownLabel.text = intToNSString((INT)_model->_Sex);
    return _rightDownLabel;
}

#pragma mark - dealloc
- (void)dealloc {
    NSLog(@"ViewControllerTableViewCell dealloc");
}

@end
