//
//  ViewController.m
//  Pyq好难弄啊（改
//
//  Created by 周彦辰 on 11/22/19.
//  Copyright © 2019 周彦辰. All rights reserved.
//

#import "ViewController.h"
#import "PyqGroupModel.h"
#import "PyqTableViewCell.h"
#import "PyqFooterView.h"

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource,PyqFooterViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSMutableArray *dataArray;
//@property(strong,nonatomic)UIButton *btn;

@end

@implementation ViewController

- (NSMutableArray *) dataArray{
    if (_dataArray == nil){
        _dataArray = [NSMutableArray array];
        //从plist中读取数据
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Wtnl.plist" ofType:nil]];
        //字典转成模型
        for (NSDictionary *dict in arr){
            PyqGroupModel *model = [PyqGroupModel pyqGroupModelWithDict:dict];//PyqGroupModel里声明的方法
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tableView的基本属性
    /*
    //1.让每一个cell的高度根据内容自适应
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //2.默认行高
    self.tableView.estimatedRowHeight = 212;
     */
    
    self.tableView.rowHeight = 170;
    
    //设置footerView（封装了一个方法）
    PyqFooterView *footerView = [PyqFooterView footerView];
    //设置footerView的代理
    footerView.delegate = self;
    self.tableView.tableFooterView = footerView;
}

#pragma mark - tableView DataSource Method

//1.非必要方法 返回每组的行数（默认为1）
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//2.必要方法 返回每组的行数
- (NSInteger) tableView :(UITableView *) tableView numberOfRowsInSection :(NSInteger)section{
    return self.dataArray.count;
}

//3.必要方法 返回每个单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //PyqGroupModel *model = self.dataArray[indexPath.row];
    
    /******************已经封装辽
    //先检查缓存池
    static NSString *ID = @"IDPyqCell";
    PyqTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //如果缓存池里没有，就从xib中新建
//    if (!cell){
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"PyqCell" owner:nil options:nil] lastObject];
//    }
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"PyqCell" bundle:nil] forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
     ***********************/
    PyqTableViewCell *cell = [PyqTableViewCell pyqCellWithTableView:tableView];
    
    //用model里的数据给cell赋值
    cell.model = self.dataArray[indexPath.row];
    
    //最后返回cell
    return cell;
    
}

#pragma mark - PyqFooterViewDelegate 代理方法
-(void)footerViewUpdateData :(PyqFooterView *)footerView{
    //1.增加一条数据
    PyqGroupModel *model = [[PyqGroupModel alloc] init];
    model.name = @"新来的小明";
    model.words = @"大家好我是新加载出的小明说的话balabalbala";
    model.icon = @"p5";
    //2.把模型的数据加到控制器的dataArray中
    [self.dataArray addObject:model];
    //3.刷新tableView
    [self.tableView reloadData];//刷新整个tableView
    //4.滚动到最后一行
    NSIndexPath *idxpath = [NSIndexPath indexPathForRow:self.dataArray.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:idxpath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
@end
 
