//
//  JNLoopView.m
//  JNPictureScrollView
//
//  Created by Jiangergo on 2017/2/6.
//  Copyright © 2017年 jiangergo. All rights reserved.
//

#import "JNLoopView.h"
#import "JNLoopViewFlowLayout.h"
#import "JNLoopViewCell.h"

NSString *const JNLoopViewCellID = @"JNLoopViewCellID";

@interface JNLoopView () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation JNLoopView{
    
    NSArray <NSURL *> *_urls;
}
- (instancetype) initWithURLs:(NSArray <NSURL *>*)urls
{
    self = [super initWithFrame:CGRectZero collectionViewLayout:[[JNLoopViewFlowLayout alloc]init]];
    if (self) {
        
        _urls = urls;
        
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[JNLoopViewCell class] forCellWithReuseIdentifier:JNLoopViewCellID];
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [self scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_urls.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
            
        });
        
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _urls.count * 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JNLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:JNLoopViewCellID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
    cell.url = _urls[indexPath.item % _urls.count];
    
    return cell;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    if (offset == 0 || offset == [self numberOfItemsInSection:0]-1) {
//        NSLog(@"%zd",offset);
        if (offset == 0) {
            offset = _urls.count;
        }else{
            offset = _urls.count - 1;
        }
        
        scrollView.contentOffset = CGPointMake(offset * scrollView.bounds.size.width, 0);
    }
    
}

@end
