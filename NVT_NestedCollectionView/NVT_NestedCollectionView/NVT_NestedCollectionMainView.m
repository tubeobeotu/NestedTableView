//
//  NVT_NestedCollectionMainView.m
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/6/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import "NVT_NestedCollectionMainView.h"
#import "NVT_Nested_CollectionCell.h"
#import "NVT_Nested_TableCell.h"
@interface NVT_NestedCollectionMainView () <NVT_NestedProtocolTableView, NVT_NestedProtocolCollectionView, UITableViewDataSource, UITableViewDelegate>


@end

@implementation NVT_NestedCollectionMainView
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.tbl_Content.dataSource = self;
    self.tbl_Content.delegate = self;
}
- (void)registerCell:(SectionType)type
{
    switch (type) {
        case SectionType_Collection:
            [self.tbl_Content registerNib:[UINib nibWithNibName:@"NVT_Nested_CollectionCell" bundle:nil] forCellReuseIdentifier:@"NVT_Nested_CollectionCell"];
            break;
            
        default:
            [self.tbl_Content registerNib:[UINib nibWithNibName:@"NVT_Nested_TableCell" bundle:nil] forCellReuseIdentifier:@"NVT_Nested_TableCell"];
            break;
    }
}
- (UITableViewCell *)getCellWith:(SectionType)type indexPath:(NSIndexPath *)indexPath
{
    switch (type) {
        case SectionType_Collection:
        {
            NVT_Nested_CollectionCell *cell = [self.tbl_Content dequeueReusableCellWithIdentifier:@"NVT_Nested_CollectionCell" forIndexPath:indexPath];
            cell.section = indexPath.section;
            cell.delegate = self;
            
            return cell;
        }
            
        default:
        {
            NVT_Nested_TableCell *cell = [self.tbl_Content dequeueReusableCellWithIdentifier:@"NVT_Nested_TableCell" forIndexPath:indexPath];
            cell.section = indexPath.section;
            cell.delegate = self;
            return cell;
        }
    }
    
}

#pragma mark UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(heightForHeader:)]) {
        return [self.delegate heightForHeader:section];
    }
    return 20;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *myLabel = [[UILabel alloc] init];
    CGFloat height;
    if ([self.delegate respondsToSelector:@selector(heightForHeader:)]) {
        height = [self.delegate heightForHeader:section];
    }
    else
    {
        height = 20;
    }
    myLabel.frame = CGRectMake(20, 8, self.frame.size.width - 20*2, height);
    myLabel.font = [UIFont boldSystemFontOfSize:18];
    myLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    myLabel.textAlignment = NSTextAlignmentCenter;
    UIView *headerView = [[UIView alloc] init];
    [headerView addSubview:myLabel];
    
    return headerView;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section %ld", (long)section
            ];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.delegate numberOfRowsInSection:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.delegate numberOfSections];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.delegate cellTableForRowAtIndexPath:indexPath];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}
#pragma mark NVT_NestedProtocol
- (PA_Treding_Model *)getModelAt:(NSIndexPath *)index
{
    return @"";
}
- (NSInteger)subCellNumberOfRowsInSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(numberOfRowsInSection:)]) {
        return [self.delegate subCellNumberOfRowsInSection:section];
    }
    return 0;
}

//CollectionView
- (UICollectionViewCell *)subCellCellCollectionForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.delegate subCellCellCollectionForRowAtIndexPath:indexPath];
}
- (BOOL)isHorizontalScroll:(NSInteger)section
{
    return [self.delegate isHorizontalScroll: section];
}
//

- (UITableViewCell *)subCellCellTableForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.delegate subCellCellTableForRowAtIndexPath:indexPath];
}
- (NSInteger)subCellNumberOfSections
{
    if ([self.delegate respondsToSelector:@selector(subCellNumberOfSections)]) {
        return [self.delegate subCellNumberOfSections];
    }
    return 1;
}

- (void)subCellDidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate subCellDidSelectRowAtIndexPath:indexPath];
}
- (void)subCellDidDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate subCellDidDeselectRowAtIndexPath:indexPath];
}

//CollectionView
- (CGSize)subCellSizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.delegate subCellSizeForItemAtIndexPath:indexPath];
}
//

- (CGFloat)subCellHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.delegate subCellHeightForRowAtIndexPath:indexPath];
}

@end
