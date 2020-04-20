//
//  PyqTableViewCell.h
//  Pyq好难弄啊（改
//
//  Created by 周彦辰 on 11/22/19.
//  Copyright © 2019 周彦辰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class PyqGroupModel;

@interface PyqTableViewCell : UITableViewCell

@property(strong,nonatomic) PyqGroupModel *model;

//封装一个创建自定义cell的方法
+ (instancetype)pyqCellWithTableView :(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
