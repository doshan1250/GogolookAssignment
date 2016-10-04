//
//  TableViewCell.h
//  GogolookAssignment
//
//  Created by Rick Chuang on 2016/10/4.
//  Copyright © 2016年 Rick Chuang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TravelData;
@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *stitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *xbodyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *fileImageView;

- (void) bindModel:(TravelData *)model;

@end
