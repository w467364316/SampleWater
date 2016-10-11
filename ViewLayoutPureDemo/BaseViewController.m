//
//  BaseViewController.m
//  ViewLayoutPureDemo
//
//  Created by iMac-jianjian on 16/10/10.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import "BaseViewController.h"
#import "PicModel.h"
#import "PureLayout.h"
#import "PureCollectionViewCell.h"

@interface BaseViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView *mainCollectionView;
@property(nonatomic,strong) NSMutableArray *dataArray;//数据源数组
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.dataArray = [NSMutableArray array];
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"Detail" ofType:@"geojson"];
    NSArray *detailArr = [[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:jsonPath] options:NSJSONReadingMutableContainers error:nil] objectForKey:@"data"
    ];
    
    for (int i =0; i<12; i++) {
        NSString *path = [NSString stringWithFormat:@"%d.jpg",i];
        PicModel *model = [PicModel initWithDic:[NSDictionary dictionaryWithObjectsAndKeys:path,@"path",detailArr[i],@"detail", nil]];
        [self.dataArray addObject:model];
    }
    PureLayout *layout = [[PureLayout alloc] init];
    layout.dataArray = self.dataArray;
    self.mainCollectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"PureCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"pureCell"];
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainCollectionView];
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
   return  self.dataArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pureCell" forIndexPath:indexPath];
    PicModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
