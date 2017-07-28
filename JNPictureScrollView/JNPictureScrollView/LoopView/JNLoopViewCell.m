//
//  JNLoopViewCell.m
//  JNPictureScrollView
//
//  Created by Jiangergo on 2017/2/6.
//  Copyright © 2017年 jiangergo. All rights reserved.
//

#import "JNLoopViewCell.h"

@implementation JNLoopViewCell{
    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:_imageView];
        
    }
    return self;
}

- (void)setUrl:(NSURL *)url{
    _url = url;
    
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc]initWithData:data];
    
    _imageView.image = image;
}

@end
