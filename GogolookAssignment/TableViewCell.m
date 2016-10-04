//
//  TableViewCell.m
//  GogolookAssignment
//
//  Created by Rick Chuang on 2016/10/4.
//  Copyright © 2016年 Rick Chuang. All rights reserved.
//

#import "TableViewCell.h"
#import "TravelData.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void) bindModel:(TravelData *)model{
    self.xbodyLabel.text = model.xbody;
    self.stitleLabel.text = model.stitle;
    [self.fileImageView sd_setImageWithURL:[NSURL URLWithString:model.file] placeholderImage:nil];
}

@end
