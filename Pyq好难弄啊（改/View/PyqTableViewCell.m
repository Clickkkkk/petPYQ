//
//  PyqTableViewCell.m
//  Pyq好难弄啊（改
//
//  Created by 周彦辰 on 11/22/19.
//  Copyright © 2019 周彦辰. All rights reserved.
//

#import "PyqTableViewCell.h"
#import "PyqGroupModel.h"

@interface PyqTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *wordsLabel;

//@property(strong,nonatomic) PyqGroupModel *model;
//@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
//@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//@property (weak, nonatomic) IBOutlet UILabel *wordsLabel;

@end
@implementation PyqTableViewCell

+ (instancetype)pyqCellWithTableView :(UITableView *)tableView{
    static NSString *ID = @"PyqCell";
    PyqTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:ID bundle:nil] forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void) setModel:(PyqGroupModel *)model{
    _model = model;
    
    //把模型数据设置给子控件
     _nameLabel.text = model.name;
     NSLog(@"%p",[UIImage imageNamed:model.icon]);
    _imageViewIcon.image = [UIImage imageNamed:model.icon];
    _wordsLabel.text = model.words;
}

@end
