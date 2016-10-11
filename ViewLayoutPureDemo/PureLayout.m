//
//  PureLayout.m
//  ViewLayoutPureDemo
//
//  Created by iMac-jianjian on 16/10/10.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import "PureLayout.h"
#import "PicModel.h"

static CGFloat horizonalSpace = 10;//水平间隔
static CGFloat verticalSpace = 15;//垂直间隔

@implementation PureLayout

-(void)prepareLayout{

    _maxCount = 2;
}

-(CGSize)collectionViewContentSize{
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = 0.0;
    for (PicModel * model in self.dataArray) {
        height = height + model.rowHeight;
    }
    if (height < [UIScreen mainScreen].bounds.size.height) {
        height = [UIScreen mainScreen].bounds.size.height;
    }
    return CGSizeMake(width, height);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray * attributes = [NSMutableArray array];
    for (int i =0 ; i<self.dataArray.count; i++) {
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [attributes addObject:attribute];
    }
    return attributes;
}


-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    PicModel *model = self.dataArray[indexPath.row];
    attribute.size = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 10)/2, model.rowHeight);
    CGFloat itemY = 0.0;
    CGFloat itemX = 0.0;
    if (indexPath.row %2 == 0) {
        itemX = 0;
        if (indexPath.row == 0) {
            itemY = 0;
        }else{
            UICollectionViewLayoutAttributes *otherAttribute = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 2 inSection:0]];
            itemY = CGRectGetMaxY(otherAttribute.frame) + verticalSpace;
        }
    }else{
        itemX = ([UIScreen mainScreen].bounds.size.width - 10)/2 + horizonalSpace;
        if (indexPath.row == 1) {
            itemY = 0;
        }else{
            UICollectionViewLayoutAttributes *otherAttribute = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 2 inSection:0]];
            itemY = CGRectGetMaxY(otherAttribute.frame) + verticalSpace;
        }
    }
    attribute.frame = CGRectMake(itemX, itemY, ([UIScreen mainScreen].bounds.size.width - 10)/2,  model.rowHeight);
    return attribute;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
}

@end
