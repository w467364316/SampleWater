//
//  PicModel.m
//  ViewLayoutPureDemo
//
//  Created by iMac-jianjian on 16/10/10.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import "PicModel.h"

@implementation PicModel

+(instancetype)initWithDic:(NSDictionary*)dic{
    
    PicModel *model = [self alloc];
    return [model initWithDic:dic];
}

-(instancetype)initWithDic:(NSDictionary*)dic{

    if (self = [super init]) {
        self.picPath = dic[@"path"];
        self.picDetail = dic[@"detail"];
        
        CGSize size = [dic[@"detail"] boundingRectWithSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width -10)/2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
        self.rowHeight = size.height + 59 * [UIScreen mainScreen].bounds.size.width / 320;
    }
    return self;
}
@end
