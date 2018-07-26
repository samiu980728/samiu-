//
//  VCSecond.m
//  网易云
//
//  Created by 萨缪 on 2018/7/24.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "VCSecond.h"
#import "JPX1TableViewCell.h"
@interface VCSecond ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation VCSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    //UITableView * _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    [_tableView registerClass:[JPX1TableViewCell class] forCellReuseIdentifier:@"labclCell"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    imageArray1 = [NSArray arrayWithObjects:@"18.png",@"19.png",@"20.png",@"21.png", nil];
    
    dataArray = [NSArray arrayWithObjects:@"本地音乐",@"最近播放",@"我的电台",@"我的收藏", nil];
    
    imageArray2 = [NSArray arrayWithObjects:@"22.jpg",@"23.jpg",@"24.jpg",@"25.jpg",@"26.jpg",@"27.jpg",@"28.jpg",@"29.jpg",@"30.jpg",@"31.jpg", nil];
    
    mainArray = [NSArray arrayWithObjects:@"我喜欢的音乐",@"罗汉堂",@"Shower",@"hip hop",@"军歌",@"秦腔",@"车",@"提前",@"杨宗纬",@"梦里水乡", nil];
    
    numArray1 = [NSArray arrayWithObjects:@"8",@"200",@"7",@"392", nil];
    
    smallNumArray = [NSArray arrayWithObjects:@"1651首,已下载8首",@"8首",@"17首,已下载4首",@"6首",@"4首",@"7首",@"8首",@"60首",@"3首",@"2首", nil];
    
    //处理最后一个单元格被分栏控制器遮盖
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = nil;
    JPX1TableViewCell * cell1 = nil;
    
    cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    if ( indexPath.section == 0 ){
        if ( !cell ){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            UILabel * label1 = [[UILabel alloc] init];
            
            label1.frame = CGRectMake(365, 3, 40, 40);
            
            label1.text = [numArray1 objectAtIndex:indexPath.row];
            
            label1.textColor = [UIColor grayColor];
            
            //label1.textAlignment = NSTextAlignmentRight;
            
            label1.font = [UIFont systemFontOfSize:10];
            
            [cell.contentView addSubview:label1];
            
            //最右边的小箭头
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        
        cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
        
        //NSLog(@"%@", cell.textLabel.text);
        
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        
        cell.textLabel.textColor = [UIColor blackColor];
        
        
        
        cell.imageView.image = [UIImage imageNamed:[imageArray1 objectAtIndex:indexPath.row]];
        //cell5.imageView.image = [UIImage imageNamed:@"16.png"];
        //设置cell.imageView的宽和高
        CGSize itemSize13 = CGSizeMake(35, 35);
        
        UIGraphicsBeginImageContext(itemSize13);
        
        CGRect imageRect13 = CGRectMake(0.0, 0.0, itemSize13.width, itemSize13.height);
        
        [cell.imageView.image drawInRect:imageRect13];
        
        cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
//
        
        return cell;
    }
    else{
//    if ( !cell1 ){
//        cell1 = [_tableView dequeueReusableCellWithIdentifier:@"labclCell" forIndexPath:indexPath];
//    }
        //自定义cell的创建必须放到用到的地方 不要放在函数首部 在哪用就在哪放
        cell1 = [_tableView dequeueReusableCellWithIdentifier:@"labclCell" forIndexPath:indexPath];
        
        //重新自定义单元格小标题
        //cell1.detailTextLabel.text = [smallNumArray objectAtIndex:indexPath.row];
        
        //cell1.detailTextLabel.font = [UIFont systemFontOfSize:15];
        
        //自定义单元格中的mainstring中的内容设置
        cell1.mainString.text = [mainArray objectAtIndex:indexPath.row];
        
        //为cell1加小标题
        cell1.detailString.text = [smallNumArray objectAtIndex:indexPath.row];
        
    
        cell1.imageView.image = [UIImage imageNamed:[imageArray2 objectAtIndex:indexPath.row]];
        
        
        CGSize itemSize4 = CGSizeMake(35, 35);
        
        UIGraphicsBeginImageContext(itemSize4);
        
        CGRect imageRect4 = CGRectMake(0.0, 0.0, itemSize4.width, itemSize4.height);
        
        [cell1.imageView.image drawInRect:imageRect4];
        
        cell1.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return cell1;
    }
    
    
    
}



- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [reSizeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


//创建尾标题：我创建的歌单
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if ( section == 0 ){
    return @"我创建的歌单(24)";
    }
    else{
        return @"我收藏的歌单(16)";
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //设置左侧按钮
    NSString * filePath2 = [[NSBundle mainBundle]pathForResource:@"34" ofType:@"png"];
    
    NSData * data2 = [NSData dataWithContentsOfFile:filePath2];
    
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithImage:[self reSizeImage:[UIImage imageWithData:data2] toSize:CGSizeMake(30, 30)] style:UIBarButtonItemStyleDone target:self action:nil];
    
    self.navigationItem.leftBarButtonItem = item2;
    
    
    //设置右侧按钮
    //先添加图片
    NSString * filePath1 = [[NSBundle mainBundle]pathForResource:@"2" ofType:@"png"];
    
    NSData * data1 = [NSData dataWithContentsOfFile:filePath1];
    
    //UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithImage:[self reSizeImage:[UIImage imageNamed:data1] toSize:CGSizeMake(30, 30)]  style:UIBarButtonItemStyleDone target:self action:nil];
    
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithImage:[self reSizeImage:[UIImage imageWithData:data1] toSize:CGSizeMake(30, 30)] style:UIBarButtonItemStyleDone target:self action:nil];
    //item1.tintColor = [UIColor greenColor];
    
    self.navigationItem.rightBarButtonItem = item1;
    
    //[super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    //修改按钮颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //修改字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的音乐";
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( indexPath.section == 0 ){
    return 50;
    }
    return 70;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray * array = [NSArray arrayWithObjects:@4,@10, nil];
    return [[array objectAtIndex:section] integerValue];
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
