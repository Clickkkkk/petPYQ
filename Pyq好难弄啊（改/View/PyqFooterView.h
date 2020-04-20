//
//  PyqFooterView.h
//  Pyq好难弄啊（改
//
//  Created by 周彦辰 on 12/12/19.
//  Copyright © 2019 周彦辰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PyqFooterView;
@protocol PyqFooterViewDelegate <NSObject, UIScrollViewDelegate>

@required//必须实现的代理方法
-(void)footerViewUpdateData :(PyqFooterView *)footerView;

@end

@interface PyqFooterView : UIView

+ (instancetype)footerView;
@property(weak,nonatomic) id<PyqFooterViewDelegate> delegate;//为控件增加代理属性
@end

NS_ASSUME_NONNULL_END
