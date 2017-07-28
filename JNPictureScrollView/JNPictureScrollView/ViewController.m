//
//  ViewController.m
//  JNPictureScrollView
//
//  Created by Jiangergo on 2017/2/6.
//  Copyright © 2017年 jiangergo. All rights reserved.
//

#import "ViewController.h"
#import "JNLoopView.h"

/*
 属性和成员变量额区别？
 
 属性：提供setter & getter 方法，以及成员变量
 成员变量：真正保存数据的
 
 */

@interface ViewController ()

@end

@implementation ViewController{
    NSArray <NSURL *> *_urls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
//    NSLog(@"%@",_urls);
    
    [self setupUI];
    
    
}

- (void) setupUI{
    
    JNLoopView *loopView = [[JNLoopView alloc]initWithURLs:_urls];
    loopView.frame = CGRectMake(20, 20, self.view.bounds.size.width-40, 200);
    
    [self.view addSubview:loopView];
    
    
}

- (void) loadData{
    
    NSMutableArray *mArr = [NSMutableArray array];
    
    for (int i = 0 ; i < 3; i++) {
        
        NSString *fileName = [NSString stringWithFormat:@"%02zd.jpg",(i+1)];
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        [mArr addObject:url];
        
    }
    _urls = mArr.copy;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
