//
//  NVT_Cell_UITableView.m
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/6/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import "NVT_Cell_TableView.h"
#import "NVT_SubCell_TableViewCell.h"
@interface NVT_Cell_TableView() <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tbl_Content;

@end
@implementation NVT_Cell_TableView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.tbl_Content.delegate = self;
    self.tbl_Content.dataSource = self;
    [self.tbl_Content registerNib:[UINib nibWithNibName:@"NVT_SubCell_TableViewCell" bundle:nil] forCellReuseIdentifier:@"NVT_SubCell_TableViewCell"];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.delegate subCellNumberOfRowsInSection:[self.delegate currentSection]];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NVT_SubCell_TableViewCell *cell = [self.tbl_Content dequeueReusableCellWithIdentifier:@"NVT_SubCell_TableViewCell" forIndexPath:indexPath];
    if ([self.delegate respondsToSelector:@selector(getSubCellType:)]) {
        cell.type = [self.delegate getSubCellType:indexPath];
    }
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.delegate subCellNumberOfSections];
}
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate subCellDidSelectRowAtIndexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate subCellDidDeselectRowAtIndexPath:indexPath];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(subCellHeightForRowAtIndexPath:)]) {
        return [self.delegate subCellHeightForRowAtIndexPath:indexPath];
    }
    else
    {
        return 40;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(subCellEstimatedHeightForRowAtIndexPath:)]) {
        return [self.delegate subCellEstimatedHeightForRowAtIndexPath:indexPath];
    }
    else
    {
        return 0;
    }
}
@end
