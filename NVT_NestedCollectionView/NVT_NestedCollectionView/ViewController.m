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
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark NVT_NestedMainProtocol
- (PA_Treding_Model *)getModelAt:(NSIndexPath *)index
{
    return @"";
}
- (NSString *)title:(NSInteger)section
{
    return @"Tea";
}
- (CGFloat)heightForHeader:(NSInteger)section
{
    if (section == 0) {
        return 20;
    }
    return 100;
}
- (BOOL)isHorizontalScroll:(NSInteger)section
{
    if (section == 0) {
        return YES;
    }
    return NO;
}
- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    [self.contentView registerCell:section];
    return 1;
}
- (NSInteger)numberOfSections
{
    return 2;
}
- (UITableViewCell *)cellTableForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    switch (indexPath.section) {
//        case SectionType_Collection:
            return [self.contentView getCellWith:SectionType_Collection indexPath:indexPath];
//        default:
//            return [self.contentView getCellWith:SectionType_TableView indexPath:indexPath];
//    }
}

#pragma mark NVT_NestedProtocolTableView & NVT_NestedProtocolCollectionView
- (NSInteger)subCellNumberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 15;
        default:
            return 10;
    }
}

- (CGSize)subCellSizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 300);
}
- (CGFloat)subCellHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
@end
