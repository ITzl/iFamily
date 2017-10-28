//
//  ViewController.m
//  家庭关系图
//
//  Created by William on 16/6/16.
//  Copyright © 2016年 William. All rights reserved.
//

#import "FamilyTreeViewController.h"
#import "Family.h"
#import "FamilyModel.h"

@interface FamilyTreeViewController ()

@end

@implementation FamilyTreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    [self.view addSubview:sc];

    //关系表示层级,1为最顶端,以此类推
    Family *treeView = [[Family alloc]initWithFrame:CGRectMake(0, 0, 4000,800)];
    UIColor *treeBackgroundColor = [UIColor colorWithRed:255/255.0 green:239/255.0 blue:213/255.0 alpha:1];
    treeView.backgroundColor = treeBackgroundColor;
    
    sc.contentSize = treeView.frame.size;
    
    //前面四家人一直到辈
    NSArray *array1 = [self creatDataModel:@[@"A爷爷",@"A奶奶",@"A爸",@"A",@"AB儿子",@"儿子的女儿"]];
    NSArray *array2 = [self creatDataModel:@[@"A外公",@"A外婆",@"A妈",@"A",@"AB儿子",@"儿子的女儿"]];
    NSArray *array3 = [self creatDataModel:@[@"B外公",@"B外婆",@"B妈",@"B",@"AB儿子",@"儿子的女儿"]];
    NSArray *array4 = [self creatDataModel:@[@"B爷爷",@"B奶奶",@"B爸",@"B",@"AB儿子",@"儿子的女儿"]];
    
    //前面四家人一直到辈
    NSArray *array5 = [self creatDataModel:@[@"C爷爷",@"C奶奶",@"C爸",@"C",@"CD女儿",@"儿子的女儿"]];
    NSArray *array6 = [self creatDataModel:@[@"C外公",@"C外婆",@"C妈",@"C",@"CD女儿",@"儿子的女儿"]];
    NSArray *array7 = [self creatDataModel:@[@"D外公",@"D外婆",@"D妈",@"D",@"CD女儿",@"儿子的女儿"]];
    NSArray *array8 = [self creatDataModel:@[@"D爷爷",@"D奶奶",@"D爸",@"D",@"CD女儿",@"儿子的女儿"]];
    
    //拼接数组,得到所有第一层级的模型
    NSArray *qianSiJia = [[[array1 arrayByAddingObjectsFromArray:array2]arrayByAddingObjectsFromArray:array3]arrayByAddingObjectsFromArray:array4];
    NSArray *houSiJia = [[[array5 arrayByAddingObjectsFromArray:array6]arrayByAddingObjectsFromArray:array7]arrayByAddingObjectsFromArray:array8];
    treeView.modelAry = [qianSiJia arrayByAddingObjectsFromArray:houSiJia];
    
    [sc addSubview:treeView];
}

- (NSArray *)creatDataModel:(NSArray *)nameAry
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < nameAry.count; i++)
    {
        FamilyModel *model = [[FamilyModel alloc]init];
        model.name = nameAry[i];
        switch (i)
        {
            case 0:
                model.level = 1;
                [array addObject:model];
                break;
            case 1:
                model.level = 1;
                [array addObject:model];
                break;
            case 2:
                ((FamilyModel *)array[0]).sunModel = model;
                ((FamilyModel *)array[1]).sunModel = model;
                model.level = 2;
                break;
            case 3:
                ((FamilyModel *)array[0]).sunModel.sunModel = model;
                ((FamilyModel *)array[1]).sunModel.sunModel = model;
                model.level = 3;
                break;
            case 4:
                ((FamilyModel *)array[0]).sunModel.sunModel.sunModel = model;
                ((FamilyModel *)array[1]).sunModel.sunModel.sunModel = model;
                model.level = 3;
                break;
            case 5:
                ((FamilyModel *)array[0]).sunModel.sunModel.sunModel.sunModel = model;
                ((FamilyModel *)array[1]).sunModel.sunModel.sunModel.sunModel = model;
                model.level = 3;
                break;
            default:
                break;
        }
        
    }
    return array;
}


@end
