//
//  ViewController.m
//  AttributeTextDemo
//
//  Created by boolean on 16/9/8.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "ViewController.h"
#import "DetailVC.h"
#import "UtilsMacro.h"

#import <YYText.h>
#import <UIView+YYAdd.h>
#import <NSString+YYAdd.h>
static NSString *const kIdentifier = @"cellIdentifier";


@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
UIToolbarDelegate
>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:DaoXiang];
    //    NSArray *resultPhone = [[Utility regexAt] matchesInString:text.string options:kNilOptions range:text.yy_rangeOfAll];
    
    self.navigationItem.title = @"★★★";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.table];
    
    [self addCell:@"YYText" class:@"BaseAttributeVC"];
    [self addCell:@"TTTAttributedLabel" class:@"DetailVC"];
    [self addCell:@"YYTextView" class:@"YYTextViewVC"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Method
- (void)addCell:(NSString *)title class:(NSString *)className
{
    [self.titles addObject:title];
    [self.classNames addObject:className];
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *title = self.titles[indexPath.row];
    NSString *className = self.classNames[indexPath.row];
    
    Class cls = NSClassFromString(className);
    UIViewController *con = [[cls alloc] init];
    con.navigationItem.title = title;
    [self.navigationController pushViewController:con animated:YES];
}

//- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return indexPath.row;
//}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier forIndexPath:indexPath];
    
    NSString *title = self.titles[indexPath.row];
    //cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.text = title;
    return cell;
}
//- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return section == 0 ? @"动画入门":@"动画进阶";
//}

#pragma mark - Getter And Setter
- (UITableView *)table
{
    if (!_table)
    {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                              style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:kIdentifier];
        
    }
    return _table;
}

- (NSMutableArray *)titles
{
    if (!_titles)
    {
        _titles = [[NSMutableArray alloc] init];
    }
    return _titles;
}
- (NSMutableArray *)classNames
{
    if (!_classNames)
    {
        _classNames = [[NSMutableArray alloc] init];
    }
    return _classNames;
}
@end
