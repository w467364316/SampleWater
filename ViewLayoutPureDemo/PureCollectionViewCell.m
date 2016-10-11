//
//  PureCollectionViewCell.m
//  ViewLayoutPureDemo
//
//  Created by iMac-jianjian on 16/10/10.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import "PureCollectionViewCell.h"

@interface PureCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@end

@implementation PureCollectionViewCell


-(void)setModel:(PicModel *)model{
    
    _model = model;
    self.picImageView.image = [UIImage imageNamed:model.picPath];
    self.detailLabel.text = model.picDetail;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
