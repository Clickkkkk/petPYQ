//
//  PyqFooterView.m
//  Pyq好难弄啊（改
//
//  Created by 周彦辰 on 12/12/19.
//  Copyright © 2019 周彦辰. All rights reserved.
//

#import "PyqFooterView.h"

@interface PyqFooterView ()
@property (weak, nonatomic) IBOutlet UIButton *btnLoadMore;
@property (weak, nonatomic) IBOutlet UIView *waitingView;
- (IBAction)btnLoadMoreClick;

@end

@implementation PyqFooterView

+ (instancetype)footerView{
    PyqFooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"PyqFooterView" owner:nil options:nil] lastObject];
    return footerView;
}

//加载更多btn单击事件
- (IBAction)btnLoadMoreClick {
    //1.隐藏加载更多button
    self.btnLoadMore.hidden = YES;
    //2.显示等待指示器
    self.waitingView.hidden = NO;
    
    //延迟特定时长（这里是一秒）后再调用代理方法刷新数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //3.调用代理方法实现以下功能：增加一条数据：创建一个模型对象，把模型对象加到控制器的集合中，刷新
        if([self.delegate respondsToSelector:@selector(footerViewUpdateData:)]){
            //判断代理是否调用了这个方法，调用了再执行下面的操作
            [self.delegate footerViewUpdateData:self];
        }
        self.btnLoadMore.hidden = NO;
        self.waitingView.hidden = YES;
    });
    
}

@end
