//
//  VCSecond.h
//  网易云
//
//  Created by 萨缪 on 2018/7/24.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCSecond : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
>

{
    UITableView * _tableView;
    
    NSArray * mainArray;
    
    NSArray * dataArray;
    
    NSArray * detailArray;
    
    NSArray * imageArray1;
    
    NSArray * imageArray2;
    
    NSArray * numArray1;
    NSArray * smallNumArray;
    NSArray * numArray3;
    NSArray * numArray4;

}
@end
