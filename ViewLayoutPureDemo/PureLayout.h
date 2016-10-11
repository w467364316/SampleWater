//
//  PureLayout.h
//  ViewLayoutPureDemo
//
//  Created by iMac-jianjian on 16/10/10.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PureLayout : UICollectionViewLayout

@property(nonatomic,strong)NSArray *dataArray;//数据源
@property(nonatomic,assign) NSInteger maxCount;//列数
@end
