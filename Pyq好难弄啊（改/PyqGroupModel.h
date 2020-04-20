//
//  PyqGroupModel.h
//  Pyq好难弄啊（改
//
//  Created by 周彦辰 on 11/22/19.
//  Copyright © 2019 周彦辰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PyqGroupModel : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *words;

- (instancetype) initWithDict :(NSDictionary *)dict;//把字典里的值赋给model的每一个属性
+ (instancetype) pyqGroupModelWithDict :(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
