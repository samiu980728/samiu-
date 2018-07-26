//
//  JPX1TableViewCell.m
//  网易云
//
//  Created by 萨缪 on 2018/7/25.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "JPX1TableViewCell.h"

@implementation JPX1TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if ( self ){
        _mainString = [[UILabel alloc]init];
        
        _mainString.textColor = [UIColor blackColor];
        
        _detailString = [[UILabel alloc]init];
        
        _detailString.textColor = [UIColor grayColor];
        
        _image = [[UIImageView alloc]init];
        
        [self.contentView addSubview:_mainString];
        
        [self.contentView addSubview:_detailString];
        
        [self.contentView addSubview:_image];
        
        

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _mainString.font = [UIFont systemFontOfSize:15];
    
    _detailString.font = [UIFont systemFontOfSize:12];
    
    _mainString.frame = CGRectMake(66, 0, 300, 35);
    
    _detailString.frame = CGRectMake(66, 35, 300, 15);
    
    _detailString.textColor = [UIColor grayColor];
    
    _image.frame = CGRectMake(1, 5, 60, 60);
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
