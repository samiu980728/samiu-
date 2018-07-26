//
//  VCRoot.m
//  网易云
//
//  Created by 萨缪 on 2018/7/23.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "VCRoot.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建分栏按钮对象
//    UITabBarItem * tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:101];
    
//    tabBarItem.badgeValue = @"99+";
    
//    self.tabBarItem = tabBarItem;
    
    
    
    //_tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    //self._tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    //先写导航视图
   // self.view.backgroundColor = [UIColor redColor];
    //self.title = @"账号";
    
    //设置导航栏背景色
    //self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    //self.navigationController.navigationBar.opaque = NO;
    //self.navigationController.navigationBar.translucent = NO;
   // UINavigationBar *  = self.navigationController.navigationBar;
    
    
    //self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = @"账号";
    //self.navigationItem.titleView = label;
    //self.navigationController.navigationBarHidden = NO;
    
    //添加图片数组
    imageData1 = [NSArray arrayWithObjects:@"5.png",@"6.png",@"7.png", nil];
    
    imageData2 = [NSArray arrayWithObjects:@"8.png",@"9.png",@"10.png",@"11.png",@"12.png",@"13.png",@"14.png", nil];
    
    imageData3 = [NSArray arrayWithObjects:@"16.png",@"17.png", nil];
    
    labelData1 = [NSArray arrayWithObjects:@"会员中心",@"商城",@"在线听歌免流量", nil];
    
    labelData2 = [NSArray arrayWithObjects:@"设置",@"扫一扫",@"个性换肤",@"夜间模式",@"定时关闭",@"音乐闹钟",@"驾驶模式", nil];

    labelData3 = [NSArray arrayWithObjects:@"分享网易云音乐",@"关于", nil];
    
   // self.navigationItem.title = @"账号";
//    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"zuo" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    
    
    
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"2" ofType:@"png"];
    
    NSData * data = [NSData dataWithContentsOfFile:filePath];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[self reSizeImage:[UIImage imageWithData:data] toSize:CGSizeMake(30, 30)] style:UIBarButtonItemStyleDone target:self action:nil];
    

    
    //UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"2.png"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = item;
    
    
        //UITableView * _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 500, 500) style:UITableViewStylePlain];
    UITableView * _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
    //处理最后一个单元格被分栏控制器遮盖
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    //修改按钮颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //修改字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"账号";
    
}

- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [reSizeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray * array = [NSArray arrayWithObjects:@1,@1,@3,@7,@2,@1, nil];
    return [[array objectAtIndex:section] integerValue];
}


//***配置特定行中的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //在这里建立button数组 给对应的indexPath.row/section去设置不同的button
//    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.JPG"]];
//    imageView.frame = CGRectMake(20, 20, 30, 30);

    //[self.view addSubview:imageView];

    //开始放置图片数组
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出
    UITableViewCell *cell = nil;
    UITableViewCell *cell1 = nil;
    UITableViewCell *cell2 = nil;
    UITableViewCell *cell3 = nil;
    UITableViewCell *cell4 = nil;
    UITableViewCell *cell5 = nil;
    UITableViewCell *cell6 = nil;

    cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出
    cell1 = [_tableView dequeueReusableCellWithIdentifier:@"cell1"]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出
    cell2 = [_tableView dequeueReusableCellWithIdentifier:@"cell2"]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出
    cell3 = [_tableView dequeueReusableCellWithIdentifier:@"cell3"]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出
    cell4 = [_tableView dequeueReusableCellWithIdentifier:@"cell4"]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出
    cell5 = [_tableView dequeueReusableCellWithIdentifier:@"cell5"]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出
    cell6 = [_tableView dequeueReusableCellWithIdentifier:@"cell6"]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出
    
    
    //做图片数组 通过数组找到图片

    if ( indexPath.section == 0 ){
    if (!cell ){
                //设置单元格样式
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        
        //通过button设置图片和文字
//        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        button.titleLabel.textAlignment = NSTextAlignmentRight;
//
//        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//
//        button.frame = CGRectMake(270, 23, 20, 20);
//        button.layer.cornerRadius = 5;
//
//
//
//        [button setBackgroundImage:[UIImage imageNamed:@"3.png"] forState:(UIControlStateNormal)];
//        [button setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentRight)];
//
//        UIButton * button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [button1 setTitle:@"签到" forState:UIControlStateNormal];
//
//        [button1 setBackgroundImage:[UIImage imageNamed:@"3.png"] forState:(UIControlStateNormal)];
//
//        [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        button1.titleLabel.font = [UIFont systemFontOfSize:15];
//
////        button1.layer.masksToBounds = YES;
////        button1.layer.borderWidth = 1;
////        button1.layer.borderColor = [UIColor redColor].CGColor;
//
//        //添加事件
//        [button1 addTarget:self action:@selector(buttonInPressed:) forControlEvents:UIControlEventTouchUpInside];
//
//        [button1 setTitle:@"已签到" forState:UIControlStateSelected];
//        button1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        button1.frame = CGRectMake(250, 5, 1500, 50);
        
        UIButton * button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [button1 setTitle:@"签到" forState:UIControlStateNormal];
        
        [button1 setImage:[UIImage imageNamed:@"33.png"] forState:UIControlStateNormal];
        
        [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button1 setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentRight)];
        
        [button1 setTintColor:[UIColor redColor]];
        
        button1.titleLabel.font = [UIFont systemFontOfSize:15];
        
        button1.titleLabel.textAlignment = NSTextAlignmentRight;
        button1.frame = CGRectMake(200, 10, 150, 50);
        
        //turnBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        button1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        
        //设置点击后的按钮
        //先添加事件
        [button1 addTarget:self action:@selector(buttonInPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [button1 setTitle:@"已签到" forState:UIControlStateSelected];
        
        //[cell.contentView addSubview:button];
        [cell.contentView addSubview:button1];
        
        }
        cell.textLabel.text = @"来一打镇魂歌";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.detailTextLabel.text = @"Lv.8";
        cell.detailTextLabel.textColor = [UIColor redColor];
        cell.imageView.image = [UIImage imageNamed:@"1.JPG"];
        
//        设置cell.imageView的宽和高
        CGSize itemSize = CGSizeMake(35, 35);

        UIGraphicsBeginImageContext(itemSize);

        CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);

        [cell.imageView.image drawInRect:imageRect];

        cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();
        return cell;
        
    }
    
    
     else if ( indexPath.section == 1 ){
         if ( !cell1 ){
             cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
             cell1.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

         }
             cell1.textLabel.text = @"我的消息";
             cell1.textLabel.font = [UIFont systemFontOfSize:15];
             
             cell1.imageView.image = [UIImage imageNamed:@"4.png"];
             //设置cell.imageView的宽和高
             CGSize itemSize1 = CGSizeMake(35, 35);
             
             UIGraphicsBeginImageContext(itemSize1);
             
             CGRect imageRect1 = CGRectMake(0.0, 0.0, itemSize1.width, itemSize1.height);
             
             [cell1.imageView.image drawInRect:imageRect1];
             
             cell1.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
             
             UIGraphicsEndImageContext();
             
         return cell1;
     }
    
    else if ( indexPath.section == 2 )
    {
        if ( !cell2 ){
            cell2 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
            //cell2 = [tableView dequeueReusableCellWithIdentifier:<#(nonnull NSString *)#> forIndexPath:<#(nonnull NSIndexPath *)#>
            cell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell2.textLabel.text = [labelData1 objectAtIndex:indexPath.row];
        //cell2.textLabel.text = @"会员中心";
        cell2.textLabel.font = [UIFont systemFontOfSize:15];
        
        cell2.imageView.image = [UIImage imageNamed:[imageData1 objectAtIndex:indexPath.row]];
        //cell2.imageView.image = [UIImage imageNamed:@"5.png"];
        //设置cell.imageView的宽和高
        CGSize itemSize2 = CGSizeMake(35, 35);
        
        UIGraphicsBeginImageContext(itemSize2);
        
        CGRect imageRect2 = CGRectMake(0.0, 0.0, itemSize2.width, itemSize2.height);
        
        [cell2.imageView.image drawInRect:imageRect2];
        
        cell2.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        return cell2;
        
        
        
        //这有一个大括号 新加的 ！！！
    }
        
        
        

    else if ( indexPath.section == 3 ){
        if ( !cell4 ){
            cell4 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell4"];
            if ( indexPath.row != 3 ){
            cell4.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            
            UILabel * label3 = [[UILabel alloc] init];
            
            label3.frame = CGRectMake(345, 5, 40, 40);
            
            label3.text = @"官方红";
            
            label3.font = [UIFont systemFontOfSize:12];
            
            label3.textColor = [UIColor grayColor];
            if ( indexPath.row == 2 ){
                [cell4 addSubview:label3];
            }
            
            //加UISwitch
            if ( indexPath.row == 3 ){
                UISwitch * switch1 = [[UISwitch alloc]init];
                
                switch1.frame = CGRectMake(350, 10, 40, 40);
                
                //设置开关状态
                [switch1 setOn:NO animated:YES];
                
                [cell4.contentView addSubview:switch1];
                
            }
            
        }
        
        cell4.textLabel.text = [labelData2 objectAtIndex:indexPath.row];
        //cell4.textLabel.text = @"设置";
        cell4.textLabel.font = [UIFont systemFontOfSize:15];
        
        cell4.imageView.image = [UIImage imageNamed:[imageData2 objectAtIndex:indexPath.row]];
        //cell4.imageView.image = [UIImage imageNamed:@"8.png"];
        //设置cell.imageView的宽和高
        CGSize itemSize5 = CGSizeMake(35, 35);
        
        UIGraphicsBeginImageContext(itemSize5);
        
        CGRect imageRect5 = CGRectMake(0.0, 0.0, itemSize5.width, itemSize5.height);
        
        [cell4.imageView.image drawInRect:imageRect5];
        
        cell4.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        return cell4;
        
        
        
        //这里新加大括号
    }
        

    else if ( indexPath.section == 4 )
    {
        if ( !cell5 ){
            cell5 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell5"];
        }
        cell5.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell5.textLabel.text = [labelData3 objectAtIndex:indexPath.row];
        //cell5.textLabel.text = @"分享网易云音乐";
        cell5.textLabel.font = [UIFont systemFontOfSize:15];
        
        
        cell5.imageView.image = [UIImage imageNamed:[imageData3 objectAtIndex:indexPath.row]];
        //cell5.imageView.image = [UIImage imageNamed:@"16.png"];
        //设置cell.imageView的宽和高
        CGSize itemSize13 = CGSizeMake(35, 35);
        
        UIGraphicsBeginImageContext(itemSize13);
        
        CGRect imageRect13 = CGRectMake(0.0, 0.0, itemSize13.width, itemSize13.height);
        
        [cell5.imageView.image drawInRect:imageRect13];
        
        cell5.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return cell5;
        
        
        //注意这里多加了一个大括号
    }
    
        if ( !cell6 ){
            cell6 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell6"];
        UIButton * buttonF = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonF setTitle:@"退出登录" forState:UIControlStateNormal];
        buttonF.frame = CGRectMake(150, 0, 65, 65);
        buttonF.titleLabel.textAlignment = NSTextAlignmentCenter;
        [buttonF setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        buttonF.titleLabel.font = [UIFont systemFontOfSize:15];
        [buttonF addTarget:self action:@selector(pressButton1:) forControlEvents:UIControlEventTouchUpInside];
        [buttonF setTitle:@"已退出" forState:UIControlStateSelected];
        [buttonF setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [cell6.contentView addSubview:buttonF];
        }
      //  }
        return cell6;
    
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"我创建的歌单";
//}

- (void)buttonPressed:(UIButton *)button
{
    //实现按钮状态的切换
    button.selected = !button.selected;
}

- (void)buttonInPressed:(UIButton *)button
{
    //实现按钮状态的切换
    button.selected = !button.selected;
    if(button.selected){
        [button setImage:nil forState:UIControlStateNormal];
    }else{
        [button setImage:[UIImage imageNamed:@"33.png"] forState:UIControlStateNormal];
    }
}

//设置单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( indexPath.section == 0 ){
        return 70;
    }
    return 50;
}


//button1事件
- (void)pressButton1:(UIButton *)button
{
    button.selected = !button.selected;
}

//分割线设置


//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // 下面这几行代码是用来设置cell的上下行线的位置
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//    //按照作者最后的意思还要加上下面这一段，才能做到底部线控制位置，所以这里按stackflow上的做法添加上吧。
//    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
//        [cell setPreservesSuperviewLayoutMargins:NO];
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
