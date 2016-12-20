//
//  ViewController.m
//  ShadowTableViewGroupDemo
//
//  Created by hwm on 16/12/20.
//  Copyright © 2016年 hwm. All rights reserved.
//

#import "ViewController.h"
#import "GroupShadowTableView.h"

@interface ViewController () <GroupShadowTableViewDelegate, GroupShadowTableViewDataSource>


@property (nonatomic, strong) GroupShadowTableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTable];
    
}

- (void)setTable {
    self.tableView = [[GroupShadowTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.groupShadowDelegate = self;
    _tableView.groupShadowDataSource = self;
    _tableView.showSeparator = YES;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
}

#pragma mark delegate datasource
- (NSInteger)numberOfSectionsInGroupShadowTableView:(GroupShadowTableView *)tableView {
    return 6;
}

- (NSInteger)groupShadowTableView:(GroupShadowTableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section;
}

- (UITableViewCell *)groupShadowTableView:(GroupShadowTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellcell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellcell"];
    }
    
    cell.imageView.image = [UIImage imageNamed:@"icon"];
    cell.textLabel.text = [NSString stringWithFormat:@"section=%zd, row=%zd", indexPath.section, indexPath.row];
    return cell;
}

- (CGFloat)groupShadowTableView:(GroupShadowTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)groupShadowTableView:(GroupShadowTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
