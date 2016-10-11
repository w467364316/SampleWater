//
//  PicModel.h
//  ViewLayoutPureDemo
//
//  Created by iMac-jianjian on 16/10/10.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PicModel : NSObject
@property(nonatomic,strong) NSString *picPath;
@property(nonatomic,strong) NSString *picDetail;
@property(nonatomic,assign) CGFloat rowHeight;//行高

+(instancetype)initWithDic:(NSDictionary*)dic;
-(instancetype)initWithDic:(NSDictionary*)dic;

@end
