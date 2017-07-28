//
//  JNLoopViewFlowLayout.m
//  JNPictureScrollView
//
//  Created by Jiangergo on 2017/2/6.
//  Copyright © 2017年 jiangergo. All rights reserved.
//

#import "JNLoopViewFlowLayout.h"

@implementation JNLoopViewFlowLayout

- (void)prepareLayout{
    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
}

@end
