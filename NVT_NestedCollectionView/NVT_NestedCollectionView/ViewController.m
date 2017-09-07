//
//  ViewController.m
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/6/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import "ViewController.h"
#import "NVT_Nested_CollectionCell.h"
#import "NVT_Nested_TableCell.h"
#import "NVT_NestedCollectionMainView.h"

@interface ViewController () <NVT_NestedMainProtocol, NVT_NestedProtocolTableView, NVT_NestedProtocolCollectionView>
{
    NSMutableArray *tableItems;
    NSMutableArray *collectionItems;
    
}
@property (weak, nonatomic) IBOutlet NVT_NestedCollectionMainView *contentView;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentView.delegate = self;
    
    //có 3 cells chính là:NVT_SubCell_Trending, NVT_SubCell_Dícovery, NVT_SubCell_StartTrend
}

#pragma mark NVT_NestedMainProtocol
- (SubCellType)getSubCellType:(NSIndexPath *)index
{
    //Là nơi quyết định sẽ sử dụng cell nào
    if (index.section == 0) {
        if (index.row == 0) {
            return SubCell_StartTrend;
        }
        return SubCell_Trending;
    }
    return SubCell_Discovery;
}
- (PA_Treding_Model *)getModelAt:(NSIndexPath *)index
{
    //Lấy ra model tương ứng
    switch (index.section) {
        case SectionType_Collection:
            return tableItems[index.row];
            
        default:
            return collectionItems[index.row];
    }
}
- (NSString *)title:(NSInteger)section
{
    //Set title với mỗi section ở đây
    return @"Tea";
}
- (CGFloat)heightForHeader:(NSInteger)section
{
    //Chiều cao của header
    
    
    //Để custom các thông số font chữ của title thì đến NVT_NestedCollectionMainView > viewForHeaderInSection
    if (section == 0) {
        return 20;
    }
    return 100;
}
- (BOOL)isHorizontalScroll:(NSInteger)section
{
    //Quyết định scroll theo chiều nào
    if (section == 0) {
        return YES;
    }
    return NO;
}
- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    //Số lượng row đối với 1 section trên main view
    [self.contentView registerCell:section];
    return 1;
}
- (NSInteger)numberOfSections
{
    //Số lượng section trên main view
    return 2;
}
- (UITableViewCell *)cellTableForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Có thể dùng collectionview hoặc table view SectionType_TableView để set là tableview
//    switch (indexPath.section) {
//        case SectionType_Collection:
            return [self.contentView getCellWith:SectionType_Collection indexPath:indexPath];
//        default:
//            return [self.contentView getCellWith:SectionType_TableView indexPath:indexPath];
//    }
}

#pragma mark NVT_NestedProtocolTableView & NVT_NestedProtocolCollectionView
- (void)subCellDidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"DidSelect:%@", indexPath);
}
- (void)subCellDidDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"DidDeselect:%@", indexPath);
}
- (NSInteger)subCellNumberOfRowsInSection:(NSInteger)section
{
    //Quyết định số phần tử ứng với mỗi section trên Main View
    switch (section) {
        case 0:
            return 15;
        default:
            return 10;
    }
}

- (CGSize)subCellSizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //Set size cho mỗi cell con ví dụng TrendingCell hoặc DiscoveryCell
    return CGSizeMake(135, 250);
}
- (CGFloat)subCellHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
@end
