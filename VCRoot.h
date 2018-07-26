//
//  VCRoot.h
//  网易云
//
//  Created by 萨缪 on 2018/7/23.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCRoot : UIViewController
<
UITableViewDataSource,
UITableViewDelegate
>
{
    UITableView * _tableView;
    NSMutableArray * _arrayData;
    NSArray * imageData1;
    NSArray * imageData2;
    NSArray * imageData3;
    NSArray * labelData1;
    NSArray * labelData2;
    NSArray * labelData3;
}
@end
